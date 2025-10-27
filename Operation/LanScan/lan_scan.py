# scan.py
# python3 -m venv myenv
# source myenv/bin/activate
# pip install netifaces
import socket
import ipaddress
import concurrent.futures
import netifaces as nf  # pip install netifaces
import sys

def get_ipv4_net():
    for iface in nf.interfaces():
        addrs = nf.ifaddresses(iface)
        ipv4 = addrs.get(nf.AF_INET)
        if not ipv4:
            continue
        for info in ipv4:
            ip = info.get('addr')
            netmask = info.get('netmask')
            if ip and netmask and not ip.startswith('127.'):
                network = ipaddress.IPv4Network(f"{ip}/{netmask}", strict=False)
                return network
    return None

def probe(ip, ports=('80','443','22', '10123')):
    for p in ports:
        try:
            s = socket.socket()
            s.settimeout(0.2)
            s.connect((str(ip), int(p)))
            s.close()
            return f"{ip} (port {p} open)"
        except:
            pass
    return None

def main():
    net = get_ipv4_net()
    if not net:
        print("找不到本机 IPv4 子网（安装 netifaces 并运行在具有网络的机器上）。")
        sys.exit(1)

    print("Scanning", net)

    alive = []
    with concurrent.futures.ThreadPoolExecutor(max_workers=200) as ex:
        futures = {ex.submit(probe, ip): ip for ip in net.hosts()}
        for fut in concurrent.futures.as_completed(futures):
            r = fut.result()
            if r:
                print(r)
                alive.append(r)

    if not alive:
        print("未发现在线主机。尝试更换端口、增加超时或使用 ARP/ping。")

if __name__ == "__main__":
    main()