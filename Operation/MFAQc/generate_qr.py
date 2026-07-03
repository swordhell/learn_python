#!/usr/bin/env python3
# python3 -m pip install Pillow

import qrcode
from urllib.parse import quote

# ===========================
# 修改这里
# ===========================
SECRET = "JBSWY3DPEHPK3PXP"   # 你的 MFA Secret
ISSUER = "MyCompany"          # 应用名称
ACCOUNT = "user@example.com"  # 用户名/邮箱
# ===========================

# 构造 Google Authenticator 标准 URI
uri = (
    f"otpauth://totp/"
    f"{quote(ISSUER)}:{quote(ACCOUNT)}"
    f"?secret={SECRET}"
    f"&issuer={quote(ISSUER)}"
)

print("OTP URI:")
print(uri)

# 生成二维码
img = qrcode.make(uri)

filename = "google_auth_qr.png"
img.save(filename)

print(f"\n二维码已保存：{filename}")