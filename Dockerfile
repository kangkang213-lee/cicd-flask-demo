# 基础镜像：Python 3.9 轻量版
FROM python:3.9-slim-buster

# 设置容器工作目录
WORKDIR /app

# 复制依赖文件到工作目录
COPY requirements.txt .

# 安装依赖（--no-cache-dir 避免缓存占用空间）
RUN pip install --no-cache-dir -r requirements.txt

# 复制所有应用代码到工作目录
COPY . .

# 暴露容器 5000 端口（与 Flask 运行端口一致）
EXPOSE 5000

# 环境变量定义
ENV NAME World

# 容器启动命令
CMD ["python", "app.py"]
