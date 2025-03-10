import sys

def process_files(targetfile, deletefile, outputfile):
    """
    遍历 targetfile 的每一行，如果其 <filename> 也同时存在于 deletefile
    则删除这一行，并将结果保存到 outputfile。
    """
    try:
        # 读取 deletefile 中的 <filename> 到一个集合中
        delete_filenames = set()
        with open(deletefile, 'r') as df:
            for line in df:
                parts = line.strip().split()
                if len(parts) == 3:
                    delete_filenames.add(parts[0])  # 添加 <filename> 到集合中

        # 遍历 targetfile，过滤掉在 deletefile 中的行
        with open(targetfile, 'r') as tf, open(outputfile, 'w') as of:
            for line in tf:
                parts = line.strip().split()
                if len(parts) == 4:
                    filename = parts[0]
                    if filename not in delete_filenames:
                        of.write(line)  # 将不在 deletefile 中的行写入输出文件

        print(f"Processing complete. Result saved to {outputfile}")

    except FileNotFoundError as e:
        print(f"Error: File not found - {e}")
    except Exception as e:
        print(f"An error occurred: {e}")


if __name__ == "__main__":
    if len(sys.argv) != 3:
        print("Usage: python process_files.py <targetfile> <deletefile>")
        sys.exit(1)

    targetfile = sys.argv[1]
    deletefile = sys.argv[2]
    outputfile = targetfile + ".filtered"  # 输出文件名为 targetfile.filtered

    process_files(targetfile, deletefile, outputfile)