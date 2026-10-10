#!/usr/bin/env python3
import ipaddress
import socket
from concurrent.futures import ThreadPoolExecutor

# 配置扫描参数
SUBNET = "192.168.0.0/24"
PORTS = [5000, 5001, 80, 443]  # 可补充其他常用 NAS 端口
TIMEOUT = 0.5  # 超时时间（秒）
MAX_WORKERS = 100  # 并发线程数


def check_port(ip: str, port: int):
    """尝试与指定 IP 和端口建立 TCP 连接"""
    with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
        s.settimeout(TIMEOUT)
        if s.connect_ex((ip, port)) == 0:
            print(f"[+] 发现开放端口: {ip}:{port}")
            return ip, port
    return None


def main():
    network = ipaddress.ip_network(SUBNET, strict=False)
    print(f"[*] 开始扫描网段 {SUBNET}，端口列表: {PORTS} ...")

    tasks = []
    with ThreadPoolExecutor(max_workers=MAX_WORKERS) as executor:
        for host in network.hosts():
            ip_str = str(host)
            for port in PORTS:
                tasks.append(executor.submit(check_port, ip_str, port))

    # 等待所有任务完成
    results = [t.result() for t in tasks if t.result()]

    print(f"\n[*] 扫描完成，共找到 {len(results)} 个匹配端口。")


if __name__ == "__main__":
    main()