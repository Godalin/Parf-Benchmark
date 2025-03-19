import sys
import os

def check_analysis_file(filename):
    """
    检查分析文件是否存在并提取结果。
    :param filename: 分析文件名
    :return: 分析结果字符串（如"false"或"true"），如果未找到结果则返回"timeout"
    """
    result = "timeout"
    try:
        with open(filename, 'r') as file:
            for line in file:
                if line.startswith("INFO:RESULT:"):
                    result = line.strip().split(":")[-1]
                    break
    except FileNotFoundError:
        print(f"Warning: Analysis file {filename} not found.")
    return result


def process_task_file(target, task_file, output_file):
    """
    处理目标文件并生成输出文件。
    :param task_file: 目标文件路径
    :param output_file: 输出文件路径
    """
    try:
        with open(task_file, 'r') as infile, open(output_file, 'w') as outfile:
            for line in infile:
                line = line.strip()
                if not line:
                    continue
                # 解析目标文件的每一行
                filename, _, _, verdict = line.split()
                if target == 'framac':
                    analysis_file = f"{filename}.framac"
                elif target == 'parf':
                    analysis_file = f"{filename}.parfopt"
                else:
                    analysis_file = "no_file"
                # 检查分析文件并获取结果
                result = check_analysis_file(analysis_file)
                # 写入输出文件
                outfile.write(f"{filename} {verdict} {result}\n")
        print(f"Processing complete. Output written to {output_file}")
    except FileNotFoundError:
        print(f"Error: Task file {task_file} not found.")
    except Exception as e:
        print(f"An error occurred: {e}")


if __name__ == "__main__":
    if len(sys.argv) != 4 or (sys.argv[1] != "framac" and sys.argv[1] != "parf"):
        print("Usage: python collect_answer.py <framac/parf> <task-file> <output-file>")
        sys.exit(1)

    target = sys.argv[1]
    task_file = sys.argv[2]
    output_file = sys.argv[3]

    process_task_file(target, task_file, output_file)