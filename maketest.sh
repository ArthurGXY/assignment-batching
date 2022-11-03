#!/usr/bin/bash

# used to copy the test file to each folder that starts with digit in current working path, and then add a include statement in the test file that includes the header file in the folder.

# after the above step, a makefile will be generated in each folder with a make option that compiles all cpp files in the folder
Test=$1
echo $Test
cp $Test "__test.cpp"

passed_compiling=0 # counter for number of folders that passed compiling
dir_count=0
failed=()
for dir in `ls -d [0-9]*`
do
    dir_count=$((dir_count+1))
    echo "Working on $dir..."    
    cp __test.cpp $dir
    cd $dir
    rm test.cpp
    header=`ls *.h*`
    echo "#include \"$header\"" > test.cpp
    cat __test.cpp >> test.cpp
    rm __test.cpp
    # find the header file in the folder
    
    cppfile=`ls *.cpp`

    printf "\tFound header: $header\n"

    echo "CC = g++" > Makefile
    echo "CFLAGS = -g -Wall" >> Makefile
    echo "default: test" >> Makefile
    echo "test: test.cpp" >> Makefile
    echo '	$(CC) $(CFLAGS) -o test' $cppfile >> Makefile
    echo "clean:" >> Makefile
    echo "	rm -f test log errors failed_compiling" >> Makefile
    echo "Cleaning previous test..."
    make clean
    echo "Making test files..."
    make > log 2> errors

    if [ $? -eq 0 ]; then
        echo "$dir Passed compiling"
        rm errors
        passed_compiling=$((passed_compiling+1))
    else
        echo "$dir Failed compiling"
        failed=("${failed[@]}" "$dir")
        cat errors > failed_compiling
        rm errors
    fi
    cd ..
done
echo "Done, $passed_compiling/$dir_count folders passed compiling."
echo "Failed compiling folders: ${failed[@]}"