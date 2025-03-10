import os
import yaml
import argparse

def parse_yml(file_path):
    """
    解析单个 .yml 文件，提取所需信息。
    """
    try:
        with open(file_path, "r") as file:
            data = yaml.safe_load(file)
        
        # 检查文件是否包含 properties
        if "properties" not in data:
            return None
        
        # 遍历 properties，查找包含 "no-overflow.prp" 的条目
        for prop in data.get("properties", []):
            if "no-overflow.prp" in prop.get("property_file", ""):
                # 获取 input_files 的文件名（不带路径）
                input_files = data.get("input_files", "").strip("<>")
                if not input_files:
                    return None
                
                # 获取 data_model
                data_model = data.get("options", {}).get("data_model", "unknown")
                
                # 获取 expected_verdict
                verdict = prop.get("expected_verdict", "unknown")
                
                # 返回结果
                return file_path, input_files, data_model, verdict
        
        # 如果没有找到符合条件的 property_file，返回 None
        return None
    except Exception as e:
        print(f"Error parsing {file_path}: {e}")
        return None


def process_directory(target_dir):
    """
    遍历目标目录及其子目录中的 .yml 文件，提取并打印所需信息。
    """
    results = []
    for root, dirs, files in os.walk(target_dir):
        for file in files:
            if file.endswith(".yml"):
                file_path = os.path.join(root, file)
                result = parse_yml(file_path)
                if result:
                    results.append(result)
    
    # 打印结果
    for result in results:
        file_path, input_files, data_model, verdict = result
        # 转换 input_files 为完整路径
        input_files_path = os.path.join(os.path.dirname(file_path), input_files)
        print(f"{file_path} {input_files_path} {data_model} {verdict}")


def main():
    parser = argparse.ArgumentParser(description="Process .yml files in a target directory.")
    parser.add_argument("target_dir", type=str, help="Path to the target directory")
    args = parser.parse_args()

    target_dir = args.target_dir
    if not os.path.isdir(target_dir):
        print(f"Error: {target_dir} is not a valid directory.")
        return

    process_directory(target_dir)


if __name__ == "__main__":
    main()