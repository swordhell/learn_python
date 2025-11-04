// 完整可运行的 React App.js 文件，增加 SHA256 + RSA 签名与验证功能，界面完整
import React, { useState } from 'react';
import forge from 'node-forge';

function RSAKeyConverter() {
  const [input, setInput] = useState('');
  const [type, setType] = useState('auto');
  const [outputPem, setOutputPem] = useState('');
  const [outputFlat, setOutputFlat] = useState('');
  const [derivedPublicPem, setDerivedPublicPem] = useState('');
  const [error, setError] = useState('');

  const [message, setMessage] = useState('');
  const [signature, setSignature] = useState('');
  const [verifyResult, setVerifyResult] = useState(null);

  function normalizeFlattened(s) {
    return s.replace(/-----BEGIN [^-]+-----/g, '')
            .replace(/-----END [^-]+-----/g, '')
            .replace(/\s+/g, '')
            .trim();
  }

  function split64(s) {
    return s.match(/.{1,64}/g)?.join('\n') || s;
  }

  function flattenedToPem(flat, isPrivate) {
    const body = split64(flat);
    const header = isPrivate ? '-----BEGIN RSA PRIVATE KEY-----' : '-----BEGIN PUBLIC KEY-----';
    const footer = isPrivate ? '-----END RSA PRIVATE KEY-----' : '-----END PUBLIC KEY-----';
    return `${header}\n${body}\n${footer}`;
  }

  function pemToFlattened(pem) {
    return normalizeFlattened(pem);
  }

  function detectPemType(pem) {
    if (/-----BEGIN RSA PRIVATE KEY-----/.test(pem) || /-----BEGIN PRIVATE KEY-----/.test(pem)) return 'private';
    if (/-----BEGIN PUBLIC KEY-----/.test(pem) || /-----BEGIN RSA PUBLIC KEY-----/.test(pem)) return 'public';
    return 'unknown';
  }

  function handleConvert() {
    setError('');
    setOutputPem('');
    setOutputFlat('');
    setDerivedPublicPem('');

    try {
      const raw = input.trim();
      if (!raw) return setError('请先输入私钥或公钥（打平或PEM）。');

      const flat = normalizeFlattened(raw);
      const looksLikePem = /-----BEGIN [A-Z ]+-----/.test(raw);

      if (looksLikePem) {
        const which = detectPemType(raw);
        if (which === 'unknown') return setError('无法识别的 PEM 类型。');
        setOutputPem(raw);
        setOutputFlat(flat);

        if (which === 'private' || type === 'private') {
          const privateKey = forge.pki.privateKeyFromPem(raw);
          const pubPem = forge.pki.publicKeyToPem(privateKey.publicKey || forge.pki.setRsaPublicKey(privateKey.n, privateKey.e));
          setDerivedPublicPem(pubPem);
        }
      } else {
        const wantType = type === 'auto' ? 'private' : type;

        if (type === 'auto') {
          try {
            const pem = flattenedToPem(flat, true);
            const privateKey = forge.pki.privateKeyFromPem(pem);
            setOutputPem(pem);
            setOutputFlat(flat);
            const pubPem = forge.pki.publicKeyToPem(privateKey.publicKey || forge.pki.setRsaPublicKey(privateKey.n, privateKey.e));
            setDerivedPublicPem(pubPem);
            return;
          } catch {
            const pemPub = flattenedToPem(flat, false);
            forge.pki.publicKeyFromPem(pemPub);
            setOutputPem(pemPub);
            setOutputFlat(flat);
          }
        } else if (wantType === 'private') {
          const pem = flattenedToPem(flat, true);
          const privateKey = forge.pki.privateKeyFromPem(pem);
          setOutputPem(pem);
          setOutputFlat(flat);
          const pubPem = forge.pki.publicKeyToPem(privateKey.publicKey || forge.pki.setRsaPublicKey(privateKey.n, privateKey.e));
          setDerivedPublicPem(pubPem);
        } else {
          const pem = flattenedToPem(flat, false);
          forge.pki.publicKeyFromPem(pem);
          setOutputPem(pem);
          setOutputFlat(flat);
        }
      }
    } catch (err) {
      setError(err.message || String(err));
    }
  }

  function handleSign() {
    setError('');
    setSignature('');
    setVerifyResult(null);

    try {
      if (!outputPem) return setError('请先转换并生成私钥 PEM');
      const privateKey = forge.pki.privateKeyFromPem(outputPem);
      const md = forge.md.sha256.create();
      md.update(message, 'utf8');
      const sig = privateKey.sign(md);
      const sigBase64 = forge.util.encode64(sig);
      setSignature(sigBase64);
    } catch (err) {
      setError('签名失败：' + (err.message || err));
    }
  }

  function handleVerify() {
    setError('');
    setVerifyResult(null);

    try {
      if (!derivedPublicPem) return setError('请先生成公钥 PEM');
      const publicKey = forge.pki.publicKeyFromPem(derivedPublicPem);
      const md = forge.md.sha256.create();
      md.update(message, 'utf8');
      const sigBytes = forge.util.decode64(signature);
      const verified = publicKey.verify(md.digest().bytes(), sigBytes);
      setVerifyResult(verified);
    } catch (err) {
      setError('验证失败：' + (err.message || err));
    }
  }

  function copy(text) { navigator.clipboard?.writeText(text).catch(() => {}); }
  function download(filename, text) {
    const blob = new Blob([text], { type: 'text/plain' });
    const url = URL.createObjectURL(blob);
    const a = document.createElement('a');
    a.href = url;
    a.download = filename;
    a.click();
    URL.revokeObjectURL(url);
  }

  return (
    <div className="max-w-4xl mx-auto p-6">
      <h1 className="text-2xl font-semibold mb-4">RSA Key Converter + SHA256 签名</h1>
      <textarea className="w-full h-40 p-3 border rounded mb-3 font-mono" placeholder="粘贴打平或 PEM key" value={input} onChange={e=>setInput(e.target.value)} />
      <div className="flex items-center gap-3 mb-4">
        <select className="border rounded p-1" value={type} onChange={e=>setType(e.target.value)}>
          <option value="auto">自动检测</option>
          <option value="private">强制：私钥</option>
          <option value="public">强制：公钥</option>
        </select>
        <button className="ml-auto bg-blue-600 text-white px-3 py-1 rounded" onClick={handleConvert}>转换</button>
      </div>
      {error && <div className="mb-4 p-3 bg-red-100 text-red-800 rounded">错误：{error}</div>}

      <div className="grid grid-cols-1 md:grid-cols-2 gap-4 mb-6">
        <div>
          <h3 className="font-medium">输出 PEM</h3>
          <pre className="p-3 border rounded h-48 overflow-auto font-mono bg-gray-50">{outputPem || '（无）'}</pre>
          <div className="flex gap-2 mt-2">
            <button className="px-2 py-1 border rounded" onClick={()=>copy(outputPem)}>复制 PEM</button>
            <button className="px-2 py-1 border rounded" onClick={()=>download('key.pem', outputPem)}>下载 PEM</button>
          </div>
        </div>
        <div>
          <h3 className="font-medium">输出 打平 (base64)</h3>
          <pre className="p-3 border rounded h-48 overflow-auto font-mono bg-gray-50">{outputFlat || '（无）'}</pre>
          <div className="flex gap-2 mt-2">
            <button className="px-2 py-1 border rounded" onClick={()=>copy(outputFlat)}>复制 打平</button>
          </div>
        </div>
      </div>

      <div className="mb-6">
        <h3 className="font-medium">从私钥导出的公钥 (PEM)</h3>
        <pre className="p-3 border rounded h-48 overflow-auto font-mono bg-gray-50">{derivedPublicPem || '（未生成或输入不是私钥）'}</pre>
        <div className="flex gap-2 mt-2">
          <button className="px-2 py-1 border rounded" onClick={()=>copy(derivedPublicPem)}>复制 公钥 PEM</button>
          <button className="px-2 py-1 border rounded" onClick={()=>download('public.pem', derivedPublicPem)}>下载 公钥 PEM</button>
        </div>
      </div>

      <h2 className="text-xl font-semibold mb-2">SHA256 + RSA 签名/验证</h2>
      <textarea className="w-full h-24 p-3 border rounded mb-2" placeholder="输入待签名文本" value={message} onChange={e=>setMessage(e.target.value)} />
      <div className="flex gap-2 mb-2">
        <button className="px-3 py-1 bg-green-600 text-white rounded" onClick={handleSign}>生成签名</button>
        <button className="px-3 py-1 bg-purple-600 text-white rounded" onClick={handleVerify}>验证签名</button>
      </div>
      {signature && <div className="mb-2">签名(Base64)：<pre className="bg-gray-50 p-2 rounded overflow-auto font-mono">{signature}</pre></div>}
      {verifyResult !== null && <div className={`p-2 rounded ${verifyResult ? 'bg-green-100 text-green-800' : 'bg-red-100 text-red-800'}`}>验证结果：{verifyResult ? '通过' : '失败'}</div>}
    </div>
  );
}

export default function App() {
  return <RSAKeyConverter />;
}