import secrets

def generate_hex_key(length):
    """
    生成指定长度的 32 进制字符串
    length: 字符长度 (如 32 或 64)
    """
    # token_hex(n) 生成 n 个字节的随机数，每个字节转为 2 个 32 进制字符
    # 因此传入长度需要除以 2
    return secrets.token_hex(length // 2)

# 执行生成
key_32 = generate_hex_key(32)
key_64 = generate_hex_key(64)

print(f"32 位密钥: {key_32}")
print(f"64 位密钥: {key_64}")