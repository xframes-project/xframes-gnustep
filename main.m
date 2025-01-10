#import <Foundation/Foundation.h>
#include <dlfcn.h>

@interface FontDefs : NSObject {
    NSArray *_defs;
}
@property (nonatomic, retain) NSArray *defs;
@end

@implementation FontDefs

@synthesize defs = _defs;

- (instancetype)init
{
    self = [super init];
    if (self) {
        _defs = [NSArray arrayWithObjects:
            [NSDictionary dictionaryWithObjectsAndKeys:
                @"roboto-regular", @"name",
                [NSArray arrayWithObjects:
                    [NSNumber numberWithInt:16],
                    [NSNumber numberWithInt:18],
                    [NSNumber numberWithInt:20],
                    [NSNumber numberWithInt:24],
                    [NSNumber numberWithInt:28],
                    [NSNumber numberWithInt:32],
                    [NSNumber numberWithInt:36],
                    [NSNumber numberWithInt:48],
                    nil
                ], @"sizes",
                nil
            ],
            nil
        ];
    }
    return self;
}

@end

typedef void (*InitFunc)(
    const char*, const char*, const char*,
    void (*)(), void (*)(int, const char*), void (*)(int, int),
    void (*)(int, float), void (*)(int, bool),
    void (*)(int, float*, int), void (*)(int)
);

typedef void (*SetElementFunc)(const char* elementJson);
typedef void (*SetChildrenFunc)(int id, const char* childrenIds);

// Callback functions
void onInitCallback() {
    NSLog(@"Library initialized successfully (Objective-C)!");
}

void onTextChangedCallback(int fieldId, const char *newText) {
    NSLog(@"Text changed in field %d: %s", fieldId, newText);
}

void onComboChanged(int id, int selectedIndex) {
    printf("Combo box changed (ID: %d): New selection index: %d\n", id, selectedIndex);
}

void onNumericValueChanged(int id, float value) {
    printf("Numeric value changed (ID: %d): New value: %.2f\n", id, value);
}

void onBooleanValueChanged(int id, bool value) {
    printf("Boolean value changed (ID: %d): New value: %s\n", id, value ? "true" : "false");
}

void onMultipleNumericValuesChanged(int id, float* values, int numValues) {
    printf("Multiple numeric values changed (ID: %d):", id);
    for (int i = 0; i < numValues; ++i) {
        printf(" %.2f", values[i]);
    }
    printf("\n");
}

void onClickCallback(int buttonId) {
    NSLog(@"Button %d clicked!", buttonId);
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        FontDefs *fontDefs = [[FontDefs alloc] init];
        NSLog(@"Font Definitions: %@", fontDefs.defs);
        
        // Flatten the font definitions
        NSMutableArray *flattenedFontDefs = [NSMutableArray array];
        for (NSDictionary *def in fontDefs.defs) {
            NSString *name = [def objectForKey:@"name"];
            NSArray *sizes = [def objectForKey:@"sizes"];
            
            for (NSNumber *size in sizes) {
                NSDictionary *flattened = @{@"name": name, @"size": size};
                [flattenedFontDefs addObject:flattened];
            }
        }
        
        NSLog(@"Flattened Font Definitions: %@", flattenedFontDefs);


        // Load the shared library (ensure correct path)
        const char *libraryPath = "./libxframesshared.so";  // Adjust path as needed
        void *handle = dlopen(libraryPath, RTLD_LAZY);
        
        if (!handle) {
            NSLog(@"Failed to load library: %s", dlerror());
            return 1;
        }

        // Retrieve the init function pointer
        

        InitFunc initFunc = (InitFunc)dlsym(handle, "init");
        if (!initFunc) {
            NSLog(@"Failed to find symbol 'init': %s", dlerror());
            dlclose(handle);
            return 1;
        }

        // Retrieve the setElement function pointer
        SetElementFunc setElementFunc = (SetElementFunc)dlsym(handle, "setElement");
        if (!setElementFunc) {
            NSLog(@"Failed to find symbol 'setElement': %s", dlerror());
            dlclose(handle);
            return 1;
        }

        // Retrieve the setChildren function pointer
        SetChildrenFunc setChildrenFunc = (SetChildrenFunc)dlsym(handle, "setChildren");
        if (!setChildrenFunc) {
            NSLog(@"Failed to find symbol 'setChildren': %s", dlerror());
            dlclose(handle);
            return 1;
        }

        // Call the init function with callback functions
        initFunc(
            "./assets", 
            "./fonts.txt", 
            "./styles.css",
            onInitCallback,        
            onTextChangedCallback, 
            onComboChanged,                  
            onNumericValueChanged,
            onBooleanValueChanged,
            onMultipleNumericValuesChanged,
            onClickCallback
        );

        // Close the library
        dlclose(handle);
    }
    return 0;
}
