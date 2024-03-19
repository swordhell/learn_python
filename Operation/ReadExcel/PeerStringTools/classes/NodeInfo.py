import logging
logger = logging.getLogger('ExcelReader')

class NodeInfo:
    def __init__(self, row):
        self.area = row[1]
        self.name = row[2]
        self.out_ip = row[3]
        self.in_ip = row[4]
        self.persisten_peer = row[6]
        self.d_is_used: int = row[7]

    def get_peer_addr(self,area):
        ip = ""
        if self.area == area:
            ip = self.in_ip
        else:
            ip = self.out_ip
        return f"{self.persisten_peer}@{ip}:26656"

    def is_used(self):
        return self.d_is_used == 1