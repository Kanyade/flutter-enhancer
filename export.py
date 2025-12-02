import os

### This script generates export files for Dart packages.
### In case new files or folders are added, running this script will update the export files accordingly.

def generate_export_file(path):
    folder_name = os.path.basename(path)

    if folder_name == "lib":
        export_file_name = os.path.join(path, "flutter_enhancer.dart")
    else:
        export_file_name = os.path.join(path, f"export_{folder_name}.dart")

    export_lines = []

    for file_name in os.listdir(path):
        file_path = os.path.join(path, file_name)
        if os.path.isdir(file_path):
            subfolder_export = f"export '{file_name}/export_{file_name}.dart';\n"
            export_lines.append(subfolder_export)
            generate_export_file(file_path)
        elif file_name.endswith(".dart") and not file_name.startswith("export_") and file_name != "flutter_enhancer.dart":
            dart_export = f"export '{file_name}';\n"
            export_lines.append(dart_export)

    export_lines.sort()

    with open(export_file_name, "w") as export_file:
        export_file.writelines(export_lines)


generate_export_file("lib")
