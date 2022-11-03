#!/bin/python
import os
def get_filenames():
    """_summary_
        Get the file names from current directory
    """
    filenames = os.listdir(os.getcwd())
    return filenames

def strip_names(filenames):
    """_summary_
        Strip the file names
    """
    new_names = []
    for filename in filenames:
        if os.path.isfile(filename):
            ele = filename.split(" ")[-1]
            if ele != "format.py" and ele != ".vscode":
                new_names.append(ele)
                # rename the original file
                os.rename(filename, ele)

                # if a filename is in format of fraction_{id}.py, move the file to a folder {id}
                if ele.find("_") != -1:
                    folder_name = ele.split("_")[1].split(".")[0]
                    if not os.path.exists(folder_name):
                        os.mkdir(folder_name)
                    os.rename(ele, folder_name + "/" + ele)
    return new_names

if __name__ == '__main__':
    filenames = get_filenames()
    strip_names(filenames)