# assignment-batching
A script that developed during being teaching assistant to speedup marking process for a certain C++ course.

The batch downloaded file from the school website is too long and not standard that we cannot use the file directly. The files are in such form.

```
SubmissionID - Firstname Lastname - Mmm dd, yyyy time - filename_StudentID.h
SubmissionID - Firstname Lastname - Mmm dd, yyyy time - filename_StudentID.cpp
```

The python script does the filename cleaning and separates them into different folders named by Student ID.

The bash script will copy the test .cpp file (1st positional argument) to each folder, adding a include statement for file name_StudentID.h and then generate the Makefile. Then it compiles using the makefile. If errors happen, errors will be stored in a file named `failed_compiling`. The script will report how many folders failed to compile, and show their directory name (Student ID).

 
