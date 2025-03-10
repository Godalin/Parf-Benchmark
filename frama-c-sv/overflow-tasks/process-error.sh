#!/bin/bash

# 输入文件
# error_file="error.txt"
error_file="test.txt"
tasks_file="overflow-tasks.txt"
# output_file="new-error.txt"
output_file="new-parf.txt"

# 确保输入文件存在
if [ ! -f "$error_file" ]; then
    echo "Error: File $error_file not found."
    exit 1
fi

if [ ! -f "$tasks_file" ]; then
    echo "Error: File $tasks_file not found."
    exit 1
fi

# 清空或创建输出文件
> "$output_file"

# 遍历 error.txt 的每一行
while IFS= read -r line; do
    # 使用 grep 搜索匹配的内容
    grep "$line" "$tasks_file" >> "$output_file"
done < "$error_file"

echo "Processing complete. Results saved to $output_file"
