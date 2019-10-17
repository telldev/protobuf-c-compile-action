#!/bin/bash

echo "Compiling $files to $output_dir";

protoc --c_out=$output_dir $files 

echo "done.";

