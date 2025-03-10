import subprocess
import argparse

def run_frama_c_sv(line):
    """
    解析一行输入并运行对应的 ParfOpt 命令。
    """
    # 分割行内容
    parts = line.strip().split()
    if len(parts) != 4:
        print(f"Skipping invalid line: {line}")
        return

    filename_yml, sourcefile, data_model, _ = parts

    config_file = f"{filename_yml}.config"

    # 构造命令
    command = [
        "./frama-c-sv.py",
        "--program", sourcefile,
        "--property", filename_yml,
        "--datamodel", data_model,
        "--config", config_file
    ]

    # 构造输出文件名
    output_file = f"{filename_yml}.parfopt"

    # 执行命令并重定向输出
    try:
        with open(output_file, "w") as outfile:
            subprocess.run(command, stdout=outfile, stderr=subprocess.STDOUT, check=True)
        print(f"Processed {filename_yml} successfully. Output saved to {output_file}")
    except subprocess.CalledProcessError as e:
        print(f"Error processing {filename_yml}: {e}")
    except Exception as e:
        print(f"Unexpected error: {e}")


def main():
    parser = argparse.ArgumentParser(description="Run Frama-C SV commands based on input file.")
    parser.add_argument("sourcefile", type=str, help="Path to the input file containing the source data.")
    args = parser.parse_args()

    sourcefile = args.sourcefile

    # 检查文件是否存在
    if not os.path.isfile(sourcefile):
        print(f"Error: File {sourcefile} does not exist.")
        return

    # 逐行读取文件并处理
    with open(sourcefile, "r") as infile:
        for line in infile:
            run_frama_c_sv(line)


if __name__ == "__main__":
    import os
    main()