#!/bin/bash

# 输入文件名
input_file="overflow-tasks.txt"  # 替换为你的大文件名
output_dir="."          # 输出目录

# # 创建输出目录
# mkdir -p "$output_dir"

# 初始化变量
line_count=1
file_count=1
output_file="./overflow-taskset_${file_count}.txt"

# 打开输入文件并逐行读取
while IFS= read -r line; do
    # 将当前行写入当前输出文件
    echo "$line" >> "$output_file"
    
    # 检查是否达到200行
    if [ $line_count -eq 200 ]; then
        # 重置行计数器
        line_count=0
        # 切换到下一个输出文件
        file_count=$((file_count + 1))
        output_file="./overflow-taskset_${file_count}.txt"
    fi
    
    # 行计数器递增
    line_count=$((line_count + 1))
done < "$input_file"

echo "Splitting complete. Files are in $output_dir/"