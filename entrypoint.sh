#!/bin/bash

compile () {
    if [ $# -lt 3 ]; then
        return 0;
    fi 

    protoc --$1=$2 $3;
    
    if [ $? -ne 0 ]; then
        echo "Compile error (protoc --$1=$2 $3)";
        return -1;
    fi;

    return 0;
}

echo "Compiling $files";

RESULT=0;

compile "cpp_out" $cpp_out $files;
compile "csharp_out" $csharp_out $files;
compile "java_out" $java_out $files;
compile "js_out" $js_out $files;
compile "objc_out" $objc_out $files;
compile "php_out" $php_out $files;
compile "python_out" $python_out $files;
compile "ruby_out" $ruby_out $files;
compile "c_out" $c_out $files;

echo "done.";

exit $RESULT;
