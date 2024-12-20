import sys
import re
import argparse

def parse_line(line):
    """
    Parse a single line of input and extract the project name, alarm count, and the full line.

    Args:
        line (str): A single line of text.

    Returns:
        tuple: (project_name, alarm_count, line_content)
    """
    match = re.match(r"^(.*?), Alarms: (\d+), Time: .*?, Parameters: (.*)$", line.strip())
    if match:
        project_name = match.group(1)
        alarm_count = int(match.group(2))
        return project_name, alarm_count, line.strip()
    return None, None, None

def collect_best_analysis(filenames, output_file):
    """
    Collect the best analysis line for each project from multiple files.

    Args:
        filenames (list): List of input file paths.
        output_file (str): Path to the output file.
    """
    project_data = {}

    # Read each file and collect project data
    for filename in filenames:
        try:
            with open(filename, 'r') as file:
                for line in file:
                    project_name, alarm_count, full_line = parse_line(line)
                    if project_name:
                        # If the project already exists, choose the one with fewer alarms
                        if project_name in project_data:
                            if alarm_count < project_data[project_name][0]:
                                project_data[project_name] = (alarm_count, full_line)
                        else:
                            project_data[project_name] = (alarm_count, full_line)
        except FileNotFoundError:
            print(f"File not found: {filename}")
        except Exception as e:
            print(f"Error reading file {filename}: {e}")

    # Write the collected data to the output file
    try:
        with open(output_file, 'w') as out_file:
            for project_name, (_, best_line) in sorted(project_data.items()):
                out_file.write(best_line + '\n')
        print(f"Best analyses written to {output_file}")
    except Exception as e:
        print(f"Error writing to output file {output_file}: {e}")

def main():
    parser = argparse.ArgumentParser(description="Collect the best analysis lines from multiple files.")
    parser.add_argument("filenames", nargs='+', help="Input filenames.")
    parser.add_argument("--output_file", help="Output filename.")
    args = parser.parse_args()

    collect_best_analysis(args.filenames, args.output_file)

if __name__ == "__main__":
    main()

