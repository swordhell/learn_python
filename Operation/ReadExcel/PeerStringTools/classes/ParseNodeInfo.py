import logging
from classes.NodeInfo import NodeInfo
from typing import List
logger = logging.getLogger('ExcelReader')

class ParseNodeInfo:
    def __init__(self, rows):
        self.rows = rows
        self.nodes: List[NodeInfo] = []
        self.parse_records()

    def parse_records(self):
        for row in self.rows:
            node = NodeInfo(row)
            if node.is_used():
                self.nodes.append(node)
            
    
    def output_peer_string(self):
        for node in self.nodes:
            node_str: List[str] = []
            for other in self.nodes:
                if other.name == node.name:
                    continue
                node_str.append(other.get_peer_addr(node.area))
            logger.info(f"服务器-{node.name}-地域-{node.area}")
            print(','.join(node_str))
            print('')
            print('')
    
    def output_full_peer_string(self):
        node_str: List[str] = []
        for node in self.nodes:
            node_str.append(node.get_peer_addr(""))
        logger.info("全部配置")
        print(','.join(node_str))
        