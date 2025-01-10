#import <Foundation/Foundation.h>
#include <math.h>  // Include the C math library

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        double number = 9.0;
        double result = sqrt(number);  // Call the C library function

        NSLog(@"The square root of %.2f is %.2f", number, result);
    }
    return 0;
}
