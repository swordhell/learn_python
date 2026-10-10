#!/usr/bin/env bash

# 配置网段前缀与探测端口
SUBNET_PREFIX="192.168.0"
PORTS=(5000 5001 80 443)
TIMEOUT=1

echo "[*] 开始扫描 ${SUBNET_PREFIX}.1-254 上的端口: ${PORTS[*]}..."

scan_target() {
    local ip=$1
    local port=$2
    # 利用 bash 内建 /dev/tcp 进行探测，超时退出
    if timeout "${TIMEOUT}" bash -c "cat < /dev/null > /dev/tcp/${ip}/${port}" 2>/dev/null; then
        echo "[+] 发现开放端口: http://${ip}:${port}"
    fi
}

# 并发扫描以提升速度
for i in $(seq 1 254); do
    ip="${SUBNET_PREFIX}.${i}"
    for port in "${PORTS[@]}"; do
        scan_target "${ip}" "${port}" &
    done
done

# 等待后台所有并发任务结束
wait
echo "[*] 扫描完成。"