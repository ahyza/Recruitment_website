import subprocess

# 定义要运行的 Python 文件列表
python_files = ['run.py', 'run2.py', 'run3.py', 'run4.py', 'run5.py']

# 创建一个空的进程列表
processes = []

# 启动所有文件
for file in python_files:
    process = subprocess.Popen(['python', file])  # 对于 Python 3，使用 'python3' 替代 'python'
    processes.append(process)

# 等待所有进程结束
for process in processes:
    process.wait()

print("所有文件执行完毕")
