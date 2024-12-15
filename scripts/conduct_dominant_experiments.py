import os
import subprocess
import argparse


def parse_parameters_file(file_path):
    """
    Parse a single parameter file to extract 13 splits of parameters.

    Args:
        file_path (str): Path to the parameter file.

    Returns:
        list: A list of tuples, where each tuple contains (selected_parameter, remaining_parameters).
    """
    splits = []
    try:
        with open(file_path, 'r') as f:
            content = f.read()
            for i in range(1, 14):  # Split 1 to Split 13
                split_section = content.split(f"Split {i}:")[1]
                selected_line = split_section.split("\n")[1].strip()
                remaining_line = split_section.split("\n")[2].strip()
                selected = selected_line.replace("Parameter:", "").strip()
                remaining = remaining_line.replace("Remaining:", "").strip()
                splits.append((selected, remaining))
    except Exception as e:
        print(f"Error parsing file {file_path}: {e}")
    return splits


def run_static_analysis(project_dir, splits):
    """
    Run static analysis for each parameter split in the given project directory.

    Args:
        project_dir (str): Path to the project directory containing .frama-c folder.
        splits (list): A list of tuples containing (selected_parameter, remaining_parameters).
    """
    work_dir = os.path.join(project_dir, ".frama-c")
    if not os.path.isdir(work_dir):
        print(f"Error: Directory {work_dir} does not exist.")
        return

    # Create dominant_params_results directory
    results_dir = os.path.join(work_dir, "dominant_params_results")
    os.makedirs(results_dir, exist_ok=True)

    for i, (selected, remaining) in enumerate(splits, start=1):
        if i < 13:
            continue
        try:
            # Run analysis for selected parameters
            selected_logfile = f"dominant_params_results/selected-{i}.log"
            selected_cmd = ["./run_eva.sh", f"--logfile={selected_logfile}", f"--parameters={selected}"]
            print(f"Running: {' '.join(selected_cmd)} in {work_dir}")
            subprocess.run(selected_cmd, cwd=work_dir, check=True)

            # Run analysis for remaining parameters
            remaining_logfile = f"dominant_params_results/remaining-{i}.log"
            remaining_cmd = ["./run_eva.sh", f"--logfile={remaining_logfile}", f"--parameters={remaining}"]
            print(f"Running: {' '.join(remaining_cmd)} in {work_dir}")
            subprocess.run(remaining_cmd, cwd=work_dir, check=True)

        except subprocess.CalledProcessError as e:
            print(f"Error running analysis for Split {i} in {project_dir}: {e}")


def main():
    # Set up argument parser
    parser = argparse.ArgumentParser(description="Process static analysis parameters and run analyses.")
    parser.add_argument("--parameters_dir", type=str, help="Path to the directory containing parameter files.")
    parser.add_argument("--projects_dir", type=str, help="Path to the directory containing project directories.")
    args = parser.parse_args()

    parameters_dir = args.parameters_dir
    projects_dir = args.projects_dir

    # Validate input directories
    if not os.path.isdir(parameters_dir):
        print(f"Error: Parameters directory {parameters_dir} does not exist.")
        return

    if not os.path.isdir(projects_dir):
        print(f"Error: Projects directory {projects_dir} does not exist.")
        return

    # Process each parameter file
    for filename in os.listdir(parameters_dir):
        if filename.endswith(".txt"):
            project_name = filename.replace(".txt", "")
            parameter_file_path = os.path.join(parameters_dir, filename)
            project_dir = os.path.join(projects_dir, project_name)

            # Parse parameters file
            splits = parse_parameters_file(parameter_file_path)
            if not splits:
                print(f"No splits found in {filename}, skipping.")
                continue

            # Run static analysis for the project
            run_static_analysis(project_dir, splits)
            # for x, y in splits:
            #     print(f"Selected: {x}")
            #     print(f"Remained: {y}")


if __name__ == "__main__":
    main()
