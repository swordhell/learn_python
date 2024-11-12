// 要解码的Base64字符串
const base64Str = "f/8fwAM+ww8AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";

// 将Base64解码为字节数组
const buffer = Buffer.from(base64Str, 'base64');

// 将字节数组转换为Hex字符串
const hexStr = buffer.toString('hex');

console.log(hexStr);