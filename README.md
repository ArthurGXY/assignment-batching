# assignment-batching
A script that developed during being teaching assistant to speedup marking process for a certain C++ course.

The batch downloaded file from the school website is too long and not standard that we cannot use the file directly with ease. The files are in such form.

```
SubmissionID - Firstname Lastname - Mmm dd, yyyy time - filename_StudentID.h
SubmissionID - Firstname Lastname - Mmm dd, yyyy time - filename_StudentID.cpp
```

The python script does the filename cleaning and separates them into different folders named by Student ID.

The bash script will copy the test .cpp file (1st positional argument) to each folder, adding a include statement for file name_StudentID.h and then generate the Makefile. Then it compiles using the makefile. If errors happen, errors will be stored in a file named `failed_compiling`. The script will report how many folders failed to compile, and show their directory name (Student ID).

 ## How to use these 2 scripts

Requirements for `format.py`:

- python3

Requirements (tested with bash on archlinux and msys2 environment on windows.) for `maketest.sh`:

1. A bash-compatible environment
2. `make` command so that the script can use the makefiles, if not, the test will not make the test program and will show 0/total folders past test.

### Running

- On the assignment submission page of the script, select all submission and download them as a zip archive.

- Unzip the archive under the folder you desire.

- Place the scripts under the same folder with these unarchived files.
- Run the `format.py` first. 
- Remove the line that includes the assignment header file from the test file, then place test file in the same folder as well.
- Then run `./maketest.sh <TestFile>`.
- The compilation report and generated test programs are under each folder.
