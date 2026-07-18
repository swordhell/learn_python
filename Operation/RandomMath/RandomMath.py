import random

def multiplication_practice():
    print("=== 三位数乘法练习 ===")
    print("输入 q 退出\n")

    score = 0
    total = 0

    while True:
        # 随机生成两个三位数
        a = random.randint(100, 999)
        b = random.randint(100, 999)

        answer = a * b

        user_input = input(f"{a} × {b} = ")

        if user_input.lower() == "q":
            break

        total += 1

        try:
            user_answer = int(user_input)

            if user_answer == answer:
                print("✅ 正确！\n")
                score += 1
            else:
                print(f"❌ 错误，正确答案是：{answer}\n")

        except ValueError:
            print("请输入数字！\n")

    print("=== 练习结束 ===")
    print(f"完成题数：{total}")
    print(f"正确题数：{score}")

    if total > 0:
        rate = score / total * 100
        print(f"正确率：{rate:.1f}%")

if __name__ == "__main__":
    multiplication_practice()