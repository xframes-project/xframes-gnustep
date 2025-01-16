# xframes-gnustep

## Instructions

### Install GNUStep

#### Ubuntu

`sudo apt install gnustep gnustep-devel clang plocate libxml2-dev libxslt1-dev`'

You may need to run `sudo updatedb.plocate`, depending on your environment.

Then run `locate objc.h`.

Copy the path, change the command accordingly and run (replace `<path>` with the actual path):

`sudo ln -s <path> /usr/local/include/objc`

For example

`sudo ln -s /usr/lib/gcc/x86_64-linux-gnu/14/include/objc /usr/local/include/objc`

### Building

#### Ubuntu

``clang `gnustep-config --objc-flags` -o main main.m `gnustep-config --base-libs` -lm``

## Screenshots

Ubuntu 24.04

![image](https://github.com/user-attachments/assets/026e6cee-c704-4226-9bf7-1084e97b13d4)

Raspberry Pi 5

![image](https://github.com/user-attachments/assets/6c423fa7-e801-43da-bb20-36786e0b51cb)

