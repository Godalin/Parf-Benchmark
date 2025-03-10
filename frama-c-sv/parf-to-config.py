import os

def extract_and_save_final_parameter(input_file):
    """
    读取输入文件，解析每一行，提取对应的 .parf 文件中的 Final parameter，
    并将其写入对应的 .config 文件。
    """
    try:
        with open(input_file, 'r') as infile:
            for line in infile:
                line = line.strip()
                if not line:
                    continue
                # 解析输入文件的每一行
                filename, _, _, _ = line.split()
                parf_file = f"{filename}.parf"
                config_file = f"{filename}.config"

                # 检查 .parf 文件是否存在
                if not os.path.exists(parf_file):
                    print(f"Warning: .parf file not found for {filename}. Skipping...")
                    continue

                # 从 .parf 文件中提取 Final parameter
                final_parameters = ""
                with open(parf_file, 'r') as parf:
                    for parf_line in parf:
                        if parf_line.startswith("[parf] Final parameter:"):
                            final_parameters = parf_line.split(":", 1)[1].strip()
                            break

                if not final_parameters:
                    print(f"Warning: No Final parameter found in {parf_file}. Skipping...")
                    # write empty string, i.e. default setting, into config file
                    # continue

                # 将提取的参数写入 .config 文件
                with open(config_file, 'w') as config:
                    config.write(final_parameters + "\n")
                print(f"Final parameter extracted and saved to {config_file}")
    except FileNotFoundError:
        print(f"Error: Input file {input_file} not found.")
    except Exception as e:
        print(f"An error occurred: {e}")


if __name__ == "__main__":
    import sys
    if len(sys.argv) != 2:
        print("Usage: python extract_final_parameter.py <input-file>")
        sys.exit(1)

    input_file = sys.argv[1]
    extract_and_save_final_parameter(input_file)