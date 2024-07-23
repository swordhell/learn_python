import re
def parse_time_to_seconds(time_str):
    # 定义正则表达式模式
    pattern = re.compile(r'(?:(\d+)h)?(?:(\d+)m)?(?:(\d+)s)?')
    
    # 匹配时间字符串
    match = pattern.fullmatch(time_str)
    if not match:
        raise ValueError(f"Invalid time format: {time_str}")
    
    # 提取小时、分钟和秒数
    hours = int(match.group(1)) if match.group(1) else 0
    minutes = int(match.group(2)) if match.group(2) else 0
    oneBlock = int(match.group(3)) if match.group(3) else 0
    
    # 计算总秒数
    total_seconds = hours * 3600 + minutes * 60 + oneBlock
    return total_seconds