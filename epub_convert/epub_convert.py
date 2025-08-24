import os
from ebooklib import epub, ITEM_DOCUMENT
from bs4 import BeautifulSoup
from collections import Counter
import re

INPUT_DIR = "input"
OUTPUT_DIR = "output"

def epub_to_text(epub_path):
    """提取EPUB文本"""
    book = epub.read_epub(epub_path)
    texts = []
    chapters = []

    for item in book.items:
        if item.get_type() == ITEM_DOCUMENT:
            soup = BeautifulSoup(item.get_content(), 'html.parser')
            text = soup.get_text().strip()
            if text:
                texts.append(text)
                chapters.append(text.splitlines()[0] if text.splitlines() else "章节")

    full_text = "\n\n".join(texts)
    return full_text, chapters

def save_txt(text, txt_path):
    """保存TXT"""
    os.makedirs(os.path.dirname(txt_path), exist_ok=True)
    with open(txt_path, 'w', encoding='utf-8') as f:
        f.write(text)

def analyze_text(text, top_n=20):
    """简单分析：字数、章节数、常用词"""
    total_chars = len(text)
    words = re.findall(r'\b\w+\b|[\u4e00-\u9fff]', text)
    word_counts = Counter(words)
    most_common = word_counts.most_common(top_n)
    return total_chars, most_common

def process_file(epub_file):
    """处理单个EPUB文件"""
    file_name = os.path.splitext(os.path.basename(epub_file))[0]
    txt_file = os.path.join(OUTPUT_DIR, f"{file_name}.txt")

    print(f"📖 正在处理: {epub_file}")
    text, chapters = epub_to_text(epub_file)
    save_txt(text, txt_file)

    total_chars, most_common = analyze_text(text)
    print(f"✅ {file_name} 转换完成")
    print(f"   总字数: {total_chars}")
    print(f"   章节数: {len(chapters)}")
    print(f"   高频词语/字符:")
    for word, count in most_common[:10]:  # 只显示前10个
        print(f"     {word}: {count}")
    print("-" * 40)

def main():
    if not os.path.exists(INPUT_DIR):
        print(f"❌ 没有找到 {INPUT_DIR} 目录，请先建立并放入 epub 文件。")
        return

    files = [f for f in os.listdir(INPUT_DIR) if f.endswith(".epub")]
    if not files:
        print(f"⚠️ {INPUT_DIR} 目录下没有找到 epub 文件。")
        return

    os.makedirs(OUTPUT_DIR, exist_ok=True)

    for f in files:
        epub_file = os.path.join(INPUT_DIR, f)
        process_file(epub_file)

if __name__ == "__main__":
    main()