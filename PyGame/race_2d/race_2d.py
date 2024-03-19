import pygame
import random

# 游戏窗口大小
WINDOW_WIDTH = 400
WINDOW_HEIGHT = 600

# 颜色定义
BLACK = (0, 0, 0)
WHITE = (255, 255, 255)

# 初始化 Pygame
pygame.init()

# 创建游戏窗口
window = pygame.display.set_mode((WINDOW_WIDTH, WINDOW_HEIGHT))
pygame.display.set_caption("Pixel Car Racing")

# 游戏参数
car_width = 40
car_height = 80
car_x = WINDOW_WIDTH // 2 - car_width // 2
car_y = WINDOW_HEIGHT - car_height - 20
car_speed = 5

# 障碍物参数
obstacle_width = 100
obstacle_height = 20
obstacle_speed = 4
obstacle_y = -obstacle_height  # 初始位置在窗口上方

# 用于控制帧速率
clock = pygame.time.Clock()

# 加载车辆图像
car_image = pygame.Surface((car_width, car_height))
car_image.fill(WHITE)

# 游戏主循环
running = True
while running:
    # 事件处理
    for event in pygame.event.get():
        if event.type == pygame.QUIT:
            running = False

    # 移动车辆
    keys = pygame.key.get_pressed()
    if keys[pygame.K_LEFT]:
        car_x -= car_speed
    if keys[pygame.K_RIGHT]:
        car_x += car_speed

    # 碰撞检测
    if car_x < 0:
        car_x = 0
    elif car_x > WINDOW_WIDTH - car_width:
        car_x = WINDOW_WIDTH - car_width

    # 清空窗口
    window.fill(BLACK)

    # 绘制车辆
    window.blit(car_image, (car_x, car_y))

    # 绘制障碍物
    pygame.draw.rect(window, WHITE, (obstacle_x, obstacle_y, obstacle_width, obstacle_height))

    # 更新障碍物位置
    obstacle_y += obstacle_speed
    if obstacle_y > WINDOW_HEIGHT:
        obstacle_y = -obstacle_height
        obstacle_x = random.randint(0, WINDOW_WIDTH - obstacle_width)

    # 更新窗口
    pygame.display.update()

    # 控制帧速率
    clock.tick(60)

# 退出游戏
pygame.quit()
