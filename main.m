#import <Foundation/Foundation.h>
#include <dlfcn.h>

typedef NS_ENUM(NSInteger, ImGuiCol) {
    ImGuiColText = 0,
    ImGuiColTextDisabled = 1,
    ImGuiColWindowBg = 2,
    ImGuiColChildBg = 3,
    ImGuiColPopupBg = 4,
    ImGuiColBorder = 5,
    ImGuiColBorderShadow = 6,
    ImGuiColFrameBg = 7,
    ImGuiColFrameBgHovered = 8,
    ImGuiColFrameBgActive = 9,
    ImGuiColTitleBg = 10,
    ImGuiColTitleBgActive = 11,
    ImGuiColTitleBgCollapsed = 12,
    ImGuiColMenuBarBg = 13,
    ImGuiColScrollbarBg = 14,
    ImGuiColScrollbarGrab = 15,
    ImGuiColScrollbarGrabHovered = 16,
    ImGuiColScrollbarGrabActive = 17,
    ImGuiColCheckMark = 18,
    ImGuiColSliderGrab = 19,
    ImGuiColSliderGrabActive = 20,
    ImGuiColButton = 21,
    ImGuiColButtonHovered = 22,
    ImGuiColButtonActive = 23,
    ImGuiColHeader = 24,
    ImGuiColHeaderHovered = 25,
    ImGuiColHeaderActive = 26,
    ImGuiColSeparator = 27,
    ImGuiColSeparatorHovered = 28,
    ImGuiColSeparatorActive = 29,
    ImGuiColResizeGrip = 30,
    ImGuiColResizeGripHovered = 31,
    ImGuiColResizeGripActive = 32,
    ImGuiColTab = 33,
    ImGuiColTabHovered = 34,
    ImGuiColTabActive = 35,
    ImGuiColTabUnfocused = 36,
    ImGuiColTabUnfocusedActive = 37,
    ImGuiColPlotLines = 38,
    ImGuiColPlotLinesHovered = 39,
    ImGuiColPlotHistogram = 40,
    ImGuiColPlotHistogramHovered = 41,
    ImGuiColTableHeaderBg = 42,
    ImGuiColTableBorderStrong = 43,
    ImGuiColTableBorderLight = 44,
    ImGuiColTableRowBg = 45,
    ImGuiColTableRowBgAlt = 46,
    ImGuiColTextSelectedBg = 47,
    ImGuiColDragDropTarget = 48,
    ImGuiColNavHighlight = 49,
    ImGuiColNavWindowingHighlight = 50,
    ImGuiColNavWindowingDimBg = 51,
    ImGuiColModalWindowDimBg = 52,
    ImGuiColCOUNT = 53
};


@interface Theme : NSObject {
    NSDictionary<NSString *, NSString *> *_baseColors;
    NSDictionary<NSNumber *, NSArray<id> *> *_colors;
}

@property (nonatomic, strong) NSDictionary<NSString *, NSString *> *baseColors;
@property (nonatomic, strong) NSDictionary<NSNumber *, NSArray<id> *> *colors;

- (instancetype)init;
- (NSString *)toJSON;

@end

@implementation Theme

@synthesize colors = _colors;
@synthesize baseColors = _baseColors;

- (instancetype)init {
    self = [super init];
    if (self) {
        self.baseColors = @{
            @"darkestGrey": @"#141f2c",
            @"darkerGrey": @"#2a2e39",
            @"darkGrey": @"#363b4a",
            @"lightGrey": @"#5a5a5a",
            @"lighterGrey": @"#7A818C",
            @"evenLighterGrey": @"#8491a3",
            @"black": @"#0A0B0D",
            @"green": @"#75f986",
            @"red": @"#ff0062",
            @"white": @"#fff",
        };
        
        self.colors = @{
            @(ImGuiColText): @[[self.baseColors objectForKey:@"white"], @1],
            @(ImGuiColTextDisabled): @[[self.baseColors objectForKey:@"lighterGrey"], @1],
            @(ImGuiColWindowBg): @[[self.baseColors objectForKey:@"black"], @1],
            @(ImGuiColChildBg): @[[self.baseColors objectForKey:@"black"], @1],
            @(ImGuiColPopupBg): @[[self.baseColors objectForKey:@"white"], @1],
            @(ImGuiColBorder): @[[self.baseColors objectForKey:@"lightGrey"], @1],
            @(ImGuiColBorderShadow): @[[self.baseColors objectForKey:@"darkestGrey"], @1],
            @(ImGuiColFrameBg): @[[self.baseColors objectForKey:@"black"], @1],
            @(ImGuiColFrameBgHovered): @[[self.baseColors objectForKey:@"darkerGrey"], @1],
            @(ImGuiColFrameBgActive): @[[self.baseColors objectForKey:@"lightGrey"], @1],
            @(ImGuiColTitleBg): @[[self.baseColors objectForKey:@"lightGrey"], @1],
            @(ImGuiColTitleBgActive): @[[self.baseColors objectForKey:@"darkerGrey"], @1],
            @(ImGuiColTitleBgCollapsed): @[[self.baseColors objectForKey:@"lightGrey"], @1],
            @(ImGuiColMenuBarBg): @[[self.baseColors objectForKey:@"lightGrey"], @1],
            @(ImGuiColScrollbarBg): @[[self.baseColors objectForKey:@"darkerGrey"], @1],
            @(ImGuiColScrollbarGrab): @[[self.baseColors objectForKey:@"darkerGrey"], @1],
            @(ImGuiColScrollbarGrabHovered): @[[self.baseColors objectForKey:@"lightGrey"], @1],
            @(ImGuiColScrollbarGrabActive): @[[self.baseColors objectForKey:@"darkestGrey"], @1],
            @(ImGuiColCheckMark): @[[self.baseColors objectForKey:@"darkestGrey"], @1],
            @(ImGuiColSliderGrab): @[[self.baseColors objectForKey:@"darkerGrey"], @1],
            @(ImGuiColSliderGrabActive): @[[self.baseColors objectForKey:@"lightGrey"], @1],
            @(ImGuiColButton): @[[self.baseColors objectForKey:@"black"], @1],
            @(ImGuiColButtonHovered): @[[self.baseColors objectForKey:@"darkerGrey"], @1],
            @(ImGuiColButtonActive): @[[self.baseColors objectForKey:@"black"], @1],
            @(ImGuiColHeader): @[[self.baseColors objectForKey:@"black"], @1],
            @(ImGuiColHeaderHovered): @[[self.baseColors objectForKey:@"black"], @1],
            @(ImGuiColHeaderActive): @[[self.baseColors objectForKey:@"lightGrey"], @1],
            @(ImGuiColSeparator): @[[self.baseColors objectForKey:@"darkestGrey"], @1],
            @(ImGuiColSeparatorHovered): @[[self.baseColors objectForKey:@"lightGrey"], @1],
            @(ImGuiColSeparatorActive): @[[self.baseColors objectForKey:@"lightGrey"], @1],
            @(ImGuiColResizeGrip): @[[self.baseColors objectForKey:@"black"], @1],
            @(ImGuiColResizeGripHovered): @[[self.baseColors objectForKey:@"lightGrey"], @1],
            @(ImGuiColResizeGripActive): @[[self.baseColors objectForKey:@"darkerGrey"], @1],
            @(ImGuiColTab): @[[self.baseColors objectForKey:@"black"], @1],
            @(ImGuiColTabHovered): @[[self.baseColors objectForKey:@"darkerGrey"], @1],
            @(ImGuiColTabActive): @[[self.baseColors objectForKey:@"lightGrey"], @1],
            @(ImGuiColTabUnfocused): @[[self.baseColors objectForKey:@"black"], @1],
            @(ImGuiColTabUnfocusedActive): @[[self.baseColors objectForKey:@"lightGrey"], @1],
            @(ImGuiColPlotLines): @[[self.baseColors objectForKey:@"darkerGrey"], @1],
            @(ImGuiColPlotLinesHovered): @[[self.baseColors objectForKey:@"lightGrey"], @1],
            @(ImGuiColPlotHistogram): @[[self.baseColors objectForKey:@"darkerGrey"], @1],
            @(ImGuiColPlotHistogramHovered): @[[self.baseColors objectForKey:@"lightGrey"], @1],
            @(ImGuiColTableHeaderBg): @[[self.baseColors objectForKey:@"black"], @1],
            @(ImGuiColTableBorderStrong): @[[self.baseColors objectForKey:@"lightGrey"], @1],
            @(ImGuiColTableBorderLight): @[[self.baseColors objectForKey:@"darkerGrey"], @1],
            @(ImGuiColTableRowBg): @[[self.baseColors objectForKey:@"darkGrey"], @1],
            @(ImGuiColTableRowBgAlt): @[[self.baseColors objectForKey:@"darkerGrey"], @1],
            @(ImGuiColTextSelectedBg): @[[self.baseColors objectForKey:@"darkerGrey"], @1],
            @(ImGuiColDragDropTarget): @[[self.baseColors objectForKey:@"darkerGrey"], @1],
            @(ImGuiColNavHighlight): @[[self.baseColors objectForKey:@"darkerGrey"], @1],
            @(ImGuiColNavWindowingHighlight): @[[self.baseColors objectForKey:@"darkerGrey"], @1],
            @(ImGuiColNavWindowingDimBg): @[[self.baseColors objectForKey:@"darkerGrey"], @1],
            @(ImGuiColModalWindowDimBg): @[[self.baseColors objectForKey:@"darkerGrey"], @1],
        };
    }
    return self;
}

- (NSString *)toJSON {
    NSMutableDictionary *jsonDict = [NSMutableDictionary dictionary];
    NSMutableDictionary *serializedColors = [NSMutableDictionary dictionary];
    
    NSEnumerator *enumerator = [self.colors keyEnumerator];
    NSNumber *key;
    while ((key = [enumerator nextObject])) {
        NSString *keyString = [key stringValue];
        NSArray *colorArray = [self.colors objectForKey:key];
        [serializedColors setObject:colorArray forKey:keyString];
    }
    
    [jsonDict setObject:serializedColors forKey:@"colors"];
    
    NSError *error = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:jsonDict options:0 error:&error];
    
    if (error) {
        NSLog(@"Error converting to JSON: %@", [error localizedDescription]);
        return nil;
    }
    
    NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    return [jsonString autorelease];
}

@end


@interface FontDefs : NSObject {
    NSArray *_defs;
}
@property (nonatomic, retain) NSArray *defs;

- (instancetype)init;
- (NSString *)toJSON;

@end

@implementation FontDefs

@synthesize defs = _defs;

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSMutableArray *fontDefsArray = [NSMutableArray array];
        
        NSString *fontName = @"roboto-regular";
        NSArray *sizes = @[@16, @18, @20, @24, @28, @32, @36, @48];
        
        for (NSNumber *size in sizes) {
            NSDictionary *fontDef = @{
                @"name": fontName,
                @"size": size
            };
            [fontDefsArray addObject:fontDef];
        }
        
        self.defs = fontDefsArray;
    }
    return self;
}

- (NSString *)toJSON {
    NSDictionary *jsonDict = @{
        @"defs": self.defs
    };
    
    NSError *error = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:jsonDict options:NSJSONWritingPrettyPrinted error:&error];
    
    if (error) {
        NSLog(@"Error converting to JSON: %@", error.localizedDescription);
        return nil;
    }
    
    NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    return [jsonString autorelease];
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
        NSString *fontDefsJson = [fontDefs toJSON];
        NSLog(@"Fonts: %@", fontDefsJson);

        Theme *theme = [[Theme alloc] init];
        NSString *themeJson = [theme toJSON];
        NSLog(@"Theme: %@", themeJson);

        const char *libraryPath = "./libxframesshared.so";
        void *handle = dlopen(libraryPath, RTLD_LAZY);
        
        if (!handle) {
            NSLog(@"Failed to load library: %s", dlerror());
            return 1;
        }

        InitFunc initFunc = (InitFunc)dlsym(handle, "init");
        if (!initFunc) {
            NSLog(@"Failed to find symbol 'init': %s", dlerror());
            dlclose(handle);
            return 1;
        }

        SetElementFunc setElementFunc = (SetElementFunc)dlsym(handle, "setElement");
        if (!setElementFunc) {
            NSLog(@"Failed to find symbol 'setElement': %s", dlerror());
            dlclose(handle);
            return 1;
        }

        SetChildrenFunc setChildrenFunc = (SetChildrenFunc)dlsym(handle, "setChildren");
        if (!setChildrenFunc) {
            NSLog(@"Failed to find symbol 'setChildren': %s", dlerror());
            dlclose(handle);
            return 1;
        }

        initFunc(
            "./assets", 
            [fontDefsJson UTF8String],
            [themeJson UTF8String],
            onInitCallback,        
            onTextChangedCallback, 
            onComboChanged,                  
            onNumericValueChanged,
            onBooleanValueChanged,
            onMultipleNumericValuesChanged,
            onClickCallback
        );

        NSLog(@"Press Enter to continue...\n");
        getchar();

        dlclose(handle);
    }
    return 0;
}
