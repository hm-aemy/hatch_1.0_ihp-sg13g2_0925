import argparse
import sys
import json
import os

def parse_flist(file, relpath):
    defines = []
    incdirs = []
    files = []

    with open(file, 'r') as f:
        for line in f:
            if line.startswith("+incdir+"):
                # Process the line and extract relevant information
                incdirs.append(relpath + line.strip().split("+")[2])
            elif line.startswith("+define+"):
                # Process the line and extract relevant information
                defines.append(line.strip().split("+")[2])
            else:
                files.append(relpath + line.strip())

    return {"VERILOG_DEFINES": defines, "VERILOG_INCLUDE_DIRS": incdirs, "VERILOG_FILES": files}

def main():
    parser = argparse.ArgumentParser(description="Process a file and convert flist to JSON.")
    parser.add_argument("file", help="Input file to process")
    args = parser.parse_args()

    relpath = os.path.dirname(os.path.relpath(args.file))+"/"

    # Placeholder for further processing
    result = parse_flist(args.file, relpath)
    print(json.dumps(result, indent=4))

if __name__ == "__main__":
    main()