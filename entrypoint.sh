#!/bin/bash

compile () {
    if [ "${!1}" == "" ]; then
        return 0;
    fi 

    mkdir -p ${!1};

    protoc --$1=${!1} $2;
    
    if [ $? -ne 0 ]; then
        echo "Compile error (protoc --$1=${!1} $2)";
        return -1;
    fi;

    return 0;
}

echo "Compiling $files";

RESULT=0;

compile "cpp_out" "$files";
compile "csharp_out" "$files";
compile "java_out" "$files";
compile "js_out" "$files";
compile "objc_out" "$files";
compile "php_out" "$files";
compile "python_out" "$files";
compile "ruby_out" "$files";
compile "c_out" "$files";

echo "done.";

exit $RESULT;
