import os
import re
import sys

def read_target_file(target_file):
    sourcefiles = []
    with open(target_file, 'r') as f:
        for line in f:
            parts = line.strip().split()
            if len(parts) > 1:
                sourcefiles.append(parts[1])
    return sourcefiles

def extract_answer(sourcefile_path):
    answer, flag = None, False
    with open(sourcefile_path, 'r') as f:
        for line in f:
            flag = True if flag or re.search(r'no-overflow.prp', line) else False
            match = re.search(r'expected_verdict: ([a-zA-Z]*)\n', line)
            if flag and match:
                answer = match.group(1).strip()
                break
    return answer

def extract_result(result_file):
    result = None
    with open(result_file, 'r') as f:
        for line in f:
            match = re.search(r'INFO:RESULT:([a-zA-Z\(\)]*)\n', line)
            if match:
                result = match.group(1).strip()
                break
    return result

def main(inputdir):
    # Get target file
    target_file = f"{inputdir}.target"
    if not os.path.isfile(target_file):
        print(f"File '{target_file}' does not exist.", file=sys.stderr)
        sys.exit(1)

    # Get the list of sourcefiles
    sourcefiles = read_target_file(target_file)
    # for sf in sourcefiles:
    #     print(sf)
    # sys.exit(0)

    # Extract the answers dict
    answers = {}
    for sourcefile in sourcefiles:
        sourcefile_path = os.path.join(inputdir, sourcefile)
        if os.path.isfile(sourcefile_path):
            answer = extract_answer(sourcefile_path)
            answers[sourcefile] = answer
    # for sf in sourcefiles:
    #     print(answers[sf])
    # sys.exit(0)

    # Extract the results dict
    output_dir = f"{inputdir}-output"
    results = {}
    for sourcefile in sourcefiles:
        result_file = os.path.join(output_dir, f"{os.path.splitext(sourcefile)[0]}.result")
        # print(result_file)
        if os.path.isfile(result_file):
            result = extract_result(result_file)
            results[sourcefile] = result
    # for sf in sourcefiles:
    #     if results[sf]:
    #         print(results[sf])
    # sys.exit(0)

    # Extract the results dict of parf
    output_dir_parf = f"{inputdir}-parf"
    results_parf = {}
    for sourcefile in sourcefiles:
        result_file = os.path.join(output_dir_parf, f"{os.path.splitext(sourcefile)[0]}.result")
        # print(result_file)
        if os.path.isfile(result_file):
            result = extract_result(result_file)
            results_parf[sourcefile] = result

    # Output summary of precision evaluation
    correct, wrong, unknown, error, fail_execution, score = 0, 0, 0, 0, 0, 0
    correct_p, wrong_p, unknown_p, error_p, fail_execution_p, score_p = 0, 0, 0, 0, 0, 0
    for sourcefile in sourcefiles:
        answer = answers.get(sourcefile, f"No answer for {sourcefile}")
        result = results.get(sourcefile, f"No result for {sourcefile}")
        result_p = results_parf.get(sourcefile, f"No result for {sourcefile}")
        print(f"{sourcefile}:")
        print(f"  answer: {answer}")
        print(f"  result: {result}")
        print(f"  result_parf: {result_p}")
        print("-" * 30)
        if not answer or not result:
            fail_execution += 1
        elif "unknown" in result:
            unknown += 1
        elif result == "error":
            if answer == "true":
                score += 2
                correct += 1
            else:
                score -= 32
                wrong_p += 1
            # error += 1
        elif answer == result:
            score += 2 if answer == "true" else 1
            correct += 1
        else:
            score -= 16 if answer == "true" else 32
            wrong += 1
        
        if not answer or not result_p:
            fail_execution_p += 1
        elif "unknown" in result_p:
            unknown_p += 1
        elif result_p == "error":
            if answer == "true":
                score_p += 2
                correct_p += 1
            else:
                score_p -= 32
                wrong_p += 1
            # error_p += 1
        elif answer == result_p:
            score_p += 2 if answer == "true" else 1
            correct_p += 1
        else:
            score_p -= 16 if answer == "true" else 32
            wrong_p += 1

    print("="*15+"SUMMARY: PRECISION"+"="*15)
    print(f"correct:\t{correct}")
    print(f"wrong:\t\t{wrong}")
    print(f"unknown:\t{unknown}")
    print(f"error:\t\t{error}")
    print(f"cannot execute:\t{fail_execution}")
    print(f"score:\t\t{score}")

    print("="*15+"SUMMARY: PARF"+"="*15)
    print(f"correct:\t{correct_p}")
    print(f"wrong:\t\t{wrong_p}")
    print(f"unknown:\t{unknown_p}")
    print(f"error:\t\t{error_p}")
    print(f"cannot execute:\t{fail_execution_p}")
    print(f"score:\t\t{score_p}")
if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python evaluate_results.py <inputdir>", file=sys.stderr)
        sys.exit(1)

    inputdir = sys.argv[1]
    main(inputdir) 