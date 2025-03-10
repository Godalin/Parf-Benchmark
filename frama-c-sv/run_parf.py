import subprocess
import argparse

def run_frama_c_sv(line, outputdir):
    """
    解析一行输入并运行对应的 Frama-C Parf 命令。
    """
    # 分割行内容
    parts = line.strip().split()
    if len(parts) != 4:
        print(f"Skipping invalid line: {line}")
        return

    filename_yml, sourcefile, data_model, _ = parts

    machdep = 'x86_64' if 'LP64' in data_model else 'x86_32'

    # 构造命令
    command = f"frama-c -parf {sourcefile} harness.c -machdep {machdep} -parf-output {outputdir} -parf-budget 450 -parf-process 2 -parf-sample-num 4"

    # 构造输出文件名
    output_file = f"{filename_yml}.parf"

    # 执行命令并重定向输出
    try:
        with open(output_file, "w") as outfile:
            subprocess.run(command, shell=True, stdout=outfile, stderr=subprocess.STDOUT, check=True)
        print(f"Processed {filename_yml} successfully. Output saved to {output_file}")
    except subprocess.CalledProcessError as e:
        print(f"Error processing {filename_yml}: {e}")
    except Exception as e:
        print(f"Unexpected error: {e}")


def main():
    parser = argparse.ArgumentParser(description="Run Frama-C SV commands based on input file.")
    parser.add_argument("sourcefile", type=str, help="Path to the input file containing the source data.")
    parser.add_argument("outputdir", type=str, help="Path to the directory containing the output intermediate files.")
    args = parser.parse_args()

    sourcefile = args.sourcefile
    outputdir = args.outputdir

    # 检查文件是否存在
    if not os.path.isfile(sourcefile):
        print(f"Error: File {sourcefile} does not exist.")
        return

    # 逐行读取文件并处理
    with open(sourcefile, "r") as infile:
        for line in infile:
            run_frama_c_sv(line, outputdir)


if __name__ == "__main__":
    import os
    main()