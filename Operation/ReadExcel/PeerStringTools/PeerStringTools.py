from classes.ExcelReader import ExcelReader
from classes.ParseNodeInfo import ParseNodeInfo
import logging

# 配置日志记录器
logging.basicConfig(level=logging.DEBUG,  # 设置日志级别为DEBUG
                    format='%(asctime)s - %(name)s - %(levelname)s - %(message)s')  # 设置日志输出格式

logger = logging.getLogger('PeerStringTools')
if __name__ == "__main__":
    e = ExcelReader("./cvn-mainnet-node-info.xlsx")
    rows = e.read_sheet("Sheet1")
    rows = rows[1:]
    p = ParseNodeInfo(rows)
    p.output_peer_string()
    p.output_full_peer_string()