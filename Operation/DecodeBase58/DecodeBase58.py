
import base64
import binascii

# 要解码的Base64字符串
base64_str = "f/8fwAM+ww8AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA="

# 解码为字节数组
byte_data = base64.b64decode(base64_str)

# 转换为Hex字符串
hex_str = binascii.hexlify(byte_data).decode('utf-8')

print(hex_str)