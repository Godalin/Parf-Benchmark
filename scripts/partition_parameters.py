import os
import re
import argparse

def parse_analysis_result(result):
    """
    Parse the static analysis result string and split final parameters.
    
    Args:
        result (str): Analysis result string in the specified format.
    
    Returns:
        tuple: Project name and a list of parameter splits for the given order.
    """
    # Extract project name, alarms, time, and final parameters
    match = re.match(r'^(.*?), Alarms: \d+, Time: \d+s, Parameters: (.+)$', result)
    if not match:
        raise ValueError("Invalid result format")

    project_name = match.group(1)
    final_parameters = match.group(2)

    # Parameter keys in the specified order
    parameter_keys = [
        "-eva-min-loop-unroll",
        "-eva-auto-loop-unroll",
        "-eva-widening-delay",
        "-eva-partition-history",
        "-eva-slevel",
        "-eva-ilevel",
        "-eva-plevel",
        "-eva-subdivide-non-linear",
        "-eva-split-return",
        "-eva-remove-redundant-alarms",
        "-eva-octagon-through-calls",
        "-eva-equality-through-calls",
        "-eva-domains"
    ]

    # Perform 13 splits
    splits = []
    for key in parameter_keys:
        # Find the parameter section matching the key
        match = re.search(rf'({key}[^-]*)', final_parameters)
        if match:
            param_part = match.group(1).strip()
            remaining = final_parameters.replace(param_part, "", 1).strip()
            splits.append((param_part, remaining))
        else:
            splits.append(("", final_parameters))

    return project_name, splits


def process_analysis_file(input_file, output_directory):
    """
    Process each line in the input file, parse analysis results, and write splits to separate files.

    Args:
        input_file (str): Path to the input file containing analysis results.
        output_directory (str): Path to the directory for storing output files.
    """
    # Ensure output directory exists
    os.makedirs(output_directory, exist_ok=True)

    with open(input_file, 'r') as infile:
        for line in infile:
            line = line.strip()
            if not line:
                continue

            try:
                project_name, parameter_splits = parse_analysis_result(line)

                output_file = os.path.join(output_directory, f"{project_name}.txt")
                with open(output_file, 'w') as outfile:
                    outfile.write(f"Project Name: {project_name}\n\n")
                    outfile.write("13 Splits of Parameters:\n")
                    for i, (param, remaining) in enumerate(parameter_splits):
                        outfile.write(f"Split {i + 1}:\n")
                        outfile.write(f"  Parameter: {param}\n")
                        outfile.write(f"  Remaining: {remaining}\n\n")
            except ValueError as e:
                print(f"Skipping invalid line: {line}\nError: {e}")

def main():
    """
    Main function to parse command-line arguments and process the analysis file.
    """
    parser = argparse.ArgumentParser(description="Parse static analysis results and split parameters.")
    parser.add_argument("input_file", help="Path to the input file containing analysis results.")
    parser.add_argument("output_directory", help="Path to the directory for storing output files.")
    args = parser.parse_args()

    process_analysis_file(args.input_file, args.output_directory)

if __name__ == "__main__":
    main()