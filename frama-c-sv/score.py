import sys

score, t_correct, f_correct, t_incorrect, f_incorrect, timeout, error, unknown = 0,0,0,0,0,0,0,0

def scoring(task_file):
    global score, t_correct, f_correct, t_incorrect, f_incorrect, timeout, error, unknown
    try:
        with open(task_file, 'r') as infile:
            for line in infile:
                line = line.strip()
                if not line:
                    continue
                # 解析目标文件的每一行
                filename, answer, result = line.split()
                if 'unknown' in result:
                    unknown += 1
                elif 'error' in result:
                    error += 1
                elif 'timeout' in result:
                    timeout += 1
                elif answer == 'true' and result == 'true':
                    score += 2
                    t_correct += 1
                elif answer == 'false' and result == 'false':
                    score += 1
                    f_correct += 1
                elif answer == 'false' and result == 'true':
                    score -= 16
                    t_incorrect += 1
                elif answer == 'true' and result == 'false':
                    score -= 32
                    f_incorrect += 1
                else:
                    print(f"Error: Task file {filename} cantains illegal result.")
    except FileNotFoundError:
        print(f"Error: Task file {task_file} not found.")
    except Exception as e:
        print(f"An error occurred: {e}")


if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python score.py <task-file>")
        sys.exit(1)

    task_file = sys.argv[1]

    scoring(task_file)

    print("="*15+"SUMMARY"+"="*15)
    print(f"True correct:\t{t_correct}")
    print(f"False correct:\t{f_correct}")
    print(f"True incorrect:\t\t{t_incorrect}")
    print(f"False incorrect:\t\t{f_incorrect}")
    print(f"unknown:\t{unknown}")
    print(f"error:\t\t{error}")
    print(f"timeout:\t{timeout}")
    print(f"score:\t\t{score}")