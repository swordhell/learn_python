#!/usr/bin/env python3
"""
rsa_pair_checker.py

简单的 RSA 公私钥配对检测工具（带 GUI）。
支持 PEM/DER 与“打平”的 Base64/Hex 文本输入。

依赖:
    pip install cryptography

用法:
    python rsa_pair_checker.py
"""

import base64
import binascii
import tkinter as tk
from tkinter import filedialog, messagebox, scrolledtext
from cryptography.hazmat.primitives import hashes
from cryptography.hazmat.primitives.asymmetric import padding, rsa
from cryptography.hazmat.primitives import serialization
from cryptography.exceptions import InvalidSignature

# --------------------
# Utils: load/parse
# --------------------

def try_load_private_key(data_bytes, password=None):
    """尝试把 bytes 当成多种私钥格式解析"""
    loaders = [
        serialization.load_pem_private_key,
        serialization.load_der_private_key,
    ]
    last_exc = None
    for loader in loaders:
        try:
            return loader(data_bytes, password=password)
        except Exception as e:
            last_exc = e
    raise last_exc

def try_load_public_key(data_bytes):
    """尝试把 bytes 当成多种公钥格式解析"""
    loaders = [
        serialization.load_pem_public_key,
        serialization.load_der_public_key,
    ]
    last_exc = None
    for loader in loaders:
        try:
            return loader(data_bytes)
        except Exception as e:
            last_exc = e
    # 有些公钥是以 SubjectPublicKeyInfo 以外的形式（或裸 RSA 公钥），但 load_der_public_key 一般能处理
    raise last_exc

def guess_and_parse_key(text_or_bytes, want_private=False, password=None):
    """
    自动识别输入（str 或 bytes），并尝试解析为私钥或公钥。
    支持：
      - PEM（含 -----BEGIN ...）
      - 打平的 Base64（没有 PEM 头尾）
      - hex 编码串
      - 直接 bytes (DER)
    返回解析的 key 对象（cryptography key）
    """
    # if caller passed bytes, try directly
    if isinstance(text_or_bytes, bytes):
        b = text_or_bytes
        try:
            if want_private:
                return try_load_private_key(b, password=password)
            else:
                return try_load_public_key(b)
        except Exception:
            pass

    txt = text_or_bytes.decode() if isinstance(text_or_bytes, bytes) else str(text_or_bytes)

    # 1) if looks like PEM (BEGIN/END)
    if "-----BEGIN" in txt and "-----END" in txt:
        b = txt.encode()
        try:
            if want_private:
                return try_load_private_key(b, password=password)
            else:
                return try_load_public_key(b)
        except Exception as e:
            raise ValueError(f"PEM parse error: {e}")

    # 2) try base64 decode directly (打平 base64)
    s = ''.join(txt.strip().split())  # remove whitespace/newlines
    # sometimes PEM is given without headers (pure base64). Try decode.
    try:
        decoded = base64.b64decode(s, validate=True)
        # try parse decoded bytes as DER
        try:
            if want_private:
                return try_load_private_key(decoded, password=password)
            else:
                return try_load_public_key(decoded)
        except Exception:
            # maybe the user provided base64 of PEM itself (rare). fallback below.
            pass
    except Exception:
        pass

    # 3) try hex decode
    try:
        decoded = binascii.unhexlify(s)
        try:
            if want_private:
                return try_load_private_key(decoded, password=password)
            else:
                return try_load_public_key(decoded)
        except Exception:
            pass
    except Exception:
        pass

    # 4) maybe it's raw bytes passed as str -> try interpreting as latin1 bytes
    try:
        b = txt.encode('latin1')
        if want_private:
            return try_load_private_key(b, password=password)
        else:
            return try_load_public_key(b)
    except Exception as e:
        raise ValueError("无法识别或解析密钥（尝试 PEM/DER/Base64/Hex）。错误：" + str(e))


# --------------------
# Matching / testing
# --------------------

def rsa_key_info_from_public(pubkey):
    """返回 (n, e, bitlen) 和展示字符串"""
    if not isinstance(pubkey, rsa.RSAPublicKey):
        raise TypeError("不是 RSA 公钥")
    nums = pubkey.public_numbers()
    n = nums.n
    e = nums.e
    bits = n.bit_length()
    return n, e, bits

def rsa_key_info_from_private(privkey):
    """返回 (n, e, d, bits)"""
    if not isinstance(privkey, rsa.RSAPrivateKey):
        raise TypeError("不是 RSA 私钥")
    nums = privkey.private_numbers()
    pub = nums.public_numbers
    return pub.n, pub.e, nums.d, pub.n.bit_length()

def keys_match_by_numbers(privkey, pubkey):
    try:
        n1, e1, _ = rsa_key_info_from_private(privkey)
    except Exception:
        # maybe privkey is actually public
        n1, e1, _ = rsa_key_info_from_public(privkey)
    n2, e2, _ = rsa_key_info_from_public(pubkey)
    return n1 == n2 and e1 == e2

def keys_match_by_signing(privkey, pubkey):
    """
    用私钥对随机消息签名，再用公钥验证；如果验证成功，则认为匹配。
    """
    message = b"rsa-pair-check-" + base64.b64encode(binascii.b2a_hex(b"probe"))  # 固定消息也行
    if isinstance(privkey, rsa.RSAPublicKey):
        # no private key to sign
        return False, "提供的私钥其实是公钥，无法签名"
    try:
        signature = privkey.sign(
            message,
            padding.PKCS1v15(),
            hashes.SHA256()
        )
    except Exception as e:
        return False, f"签名失败: {e}"

    try:
        pubkey.verify(signature, message, padding.PKCS1v15(), hashes.SHA256())
        return True, "签名验证成功"
    except InvalidSignature:
        return False, "签名验证失败（Not matched）"
    except Exception as e:
        return False, f"验证过程出错: {e}"

# --------------------
# GUI
# --------------------

class App:
    def __init__(self, root):
        self.root = root
        root.title("RSA Pair Checker")
        root.geometry("920x700")

        # top frames
        frm_top = tk.Frame(root)
        frm_top.pack(fill=tk.X, padx=8, pady=8)

        btn_load_priv = tk.Button(frm_top, text="Load Private Key", command=self.load_private_file)
        btn_load_priv.pack(side=tk.LEFT)
        btn_load_pub = tk.Button(frm_top, text="Load Public Key", command=self.load_public_file)
        btn_load_pub.pack(side=tk.LEFT, padx=(6,0))
        btn_clear = tk.Button(frm_top, text="Clear", command=self.clear_all)
        btn_clear.pack(side=tk.LEFT, padx=(6,0))

        self.check_sign_var = tk.IntVar(value=1)
        tk.Checkbutton(frm_top, text="Use sign/verify test (extra)", variable=self.check_sign_var).pack(side=tk.RIGHT)

        # text areas
        pan = tk.PanedWindow(root, orient=tk.HORIZONTAL, sashrelief=tk.RAISED)
        pan.pack(fill=tk.BOTH, expand=True, padx=8, pady=6)

        left = tk.Frame(pan)
        right = tk.Frame(pan)
        pan.add(left)
        pan.add(right)

        tk.Label(left, text="Private Key (PEM / Base64 / Hex / DER)").pack(anchor='w')
        self.priv_text = scrolledtext.ScrolledText(left, width=60, height=20)
        self.priv_text.pack(fill=tk.BOTH, expand=True)
        tk.Label(left, text="(可粘贴打平的私钥，或点击 Load Private Key)").pack(anchor='w')

        tk.Label(right, text="Public Key (PEM / Base64 / Hex / DER)").pack(anchor='w')
        self.pub_text = scrolledtext.ScrolledText(right, width=60, height=20)
        self.pub_text.pack(fill=tk.BOTH, expand=True)
        tk.Label(right, text="(可粘贴打平的公钥，或点击 Load Public Key)").pack(anchor='w')

        # bottom controls
        frm_bot = tk.Frame(root)
        frm_bot.pack(fill=tk.X, padx=8, pady=6)

        btn_check = tk.Button(frm_bot, text="Check Match", bg="#2563eb", fg="white", command=self.do_check)
        btn_check.pack(side=tk.LEFT)

        self.result_label = tk.Label(frm_bot, text="", anchor='w', justify='left')
        self.result_label.pack(side=tk.LEFT, padx=10)

        tk.Label(frm_bot, text="Password(for private key, optional):").pack(side=tk.RIGHT)
        self.pwd_entry = tk.Entry(frm_bot, show='*', width=22)
        self.pwd_entry.pack(side=tk.RIGHT, padx=6)

        # detail output
        tk.Label(root, text="Detail / Output").pack(anchor='w', padx=10)
        self.out = scrolledtext.ScrolledText(root, height=12)
        self.out.pack(fill=tk.BOTH, expand=False, padx=10, pady=(0,10))

        # status
        self.status = tk.Label(root, text="Ready", bd=1, relief=tk.SUNKEN, anchor='w')
        self.status.pack(side=tk.BOTTOM, fill=tk.X)

    def load_private_file(self):
        path = filedialog.askopenfilename(title="Select private key file", filetypes=[("All files", "*"),("PEM files", "*.pem"),("DER files","*.der")])
        if path:
            with open(path, 'rb') as f:
                data = f.read()
            try:
                text = data.decode()
            except Exception:
                # binary
                text = base64.b64encode(data).decode()
                # label as base64
                text = text
            self.priv_text.delete('1.0', tk.END)
            self.priv_text.insert(tk.END, text)
            self.status.config(text=f"Loaded private key from {path}")

    def load_public_file(self):
        path = filedialog.askopenfilename(title="Select public key file", filetypes=[("All files", "*"),("PEM files", "*.pem"),("DER files","*.der")])
        if path:
            with open(path, 'rb') as f:
                data = f.read()
            try:
                text = data.decode()
            except Exception:
                text = base64.b64encode(data).decode()
            self.pub_text.delete('1.0', tk.END)
            self.pub_text.insert(tk.END, text)
            self.status.config(text=f"Loaded public key from {path}")

    def clear_all(self):
        self.priv_text.delete('1.0', tk.END)
        self.pub_text.delete('1.0', tk.END)
        self.out.delete('1.0', tk.END)
        self.result_label.config(text="")
        self.status.config(text="Cleared")

    def do_check(self):
        self.out.delete('1.0', tk.END)
        self.result_label.config(text="")
        self.status.config(text="Parsing keys...")
        priv_input = self.priv_text.get('1.0', tk.END).strip()
        pub_input = self.pub_text.get('1.0', tk.END).strip()
        password = self.pwd_entry.get().encode() if self.pwd_entry.get() else None

        if not priv_input or not pub_input:
            messagebox.showwarning("输入缺失", "请确保私钥和公钥都已填写或加载。")
            return

        # parse private
        try:
            priv_key = guess_and_parse_key(priv_input, want_private=True, password=password)
            self.out.insert(tk.END, "Private key parsed OK.\n")
        except Exception as e:
            self.out.insert(tk.END, f"Private key parse error: {e}\n")
            self.status.config(text="Private parse error")
            return

        # parse public
        try:
            pub_key = guess_and_parse_key(pub_input, want_private=False)
            self.out.insert(tk.END, "Public key parsed OK.\n")
        except Exception as e:
            self.out.insert(tk.END, f"Public key parse error: {e}\n")
            self.status.config(text="Public parse error")
            return

        # print key details
        try:
            n_priv, e_priv, d_priv, bits_priv = rsa_key_info_from_private(priv_key)
            self.out.insert(tk.END, f"Private key: modulus bits={bits_priv}, e={e_priv}\n")
            self.out.insert(tk.END, f"Private modulus (hex prefix): {hex(n_priv)[:80]}...\n")
        except Exception:
            try:
                n_priv, e_priv, bits_priv = rsa_key_info_from_public(priv_key)
                self.out.insert(tk.END, f"Provided private input parsed as PUBLIC key: bits={bits_priv}, e={e_priv}\n")
            except Exception:
                pass

        try:
            n_pub, e_pub, bits_pub = rsa_key_info_from_public(pub_key)
            self.out.insert(tk.END, f"Public key: modulus bits={bits_pub}, e={e_pub}\n")
            self.out.insert(tk.END, f"Public modulus (hex prefix): {hex(n_pub)[:80]}...\n")
        except Exception:
            pass

        # compare
        try:
            matched = keys_match_by_numbers(priv_key, pub_key)
            if matched:
                msg = "MODULUS/E match: OK ✅ (numbers equal)"
                self.out.insert(tk.END, msg + "\n")
                self.result_label.config(text="MATCH ✓", fg="green")
            else:
                msg = "MODULUS/E mismatch: ❌ (numbers differ)"
                self.out.insert(tk.END, msg + "\n")
                self.result_label.config(text="NOT MATCH ✗", fg="red")
        except Exception as e:
            self.out.insert(tk.END, f"Comparison error: {e}\n")

        # optional sign/verify
        if self.check_sign_var.get():
            self.out.insert(tk.END, "Performing sign/verify test...\n")
            ok, note = keys_match_by_signing(priv_key, pub_key)
            self.out.insert(tk.END, f"Sign/verify test: {ok} — {note}\n")
            if ok:
                self.result_label.config(text="MATCH ✓ (signature)", fg="green")
            else:
                if not matched:
                    # keep previous mismatch result
                    pass
                else:
                    # numbers matched but signature failed (rare)
                    self.result_label.config(text="Signature test failed", fg="orange")

        self.status.config(text="Done")

# --------------------
# main
# --------------------

def main():
    root = tk.Tk()
    app = App(root)
    root.mainloop()

if __name__ == "__main__":
    main()