# xframes-gnustep

## Instructions

### Install GNUStep

#### Ubuntu

`sudo apt install gnustep gnustep-devel clang plocate libxml2-dev libxslt1-dev`

`locate objc.h`

Copy the path, change the command accordingly and run (replace `<path>` with the actual path):

`sudo ln -s <path> /usr/local/include/objc`

For example

`sudo ln -s /usr/lib/gcc/x86_64-linux-gnu/14/include/objc /usr/local/include/objc`

### Building

#### Ubuntu

``clang `gnustep-config --objc-flags` -o main main.m `gnustep-config --base-libs` -lm``

## Screenshots