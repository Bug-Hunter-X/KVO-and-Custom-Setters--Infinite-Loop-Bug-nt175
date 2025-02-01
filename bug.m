In Objective-C, a subtle issue can arise when using KVO (Key-Value Observing) with custom setters. If a setter modifies another property that also triggers KVO, it can lead to unexpected behavior or infinite loops.  For example:

```objectivec
@interface MyClass : NSObject
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *fullName;
@end

@implementation MyClass
- (void)setName:(NSString *)name {
    _name = name;
    self.fullName = [NSString stringWithFormat:@"%@ LastName", name]; // This triggers KVO on fullName
}

- (void)setFullName:(NSString *)fullName {
    _fullName = fullName;
    // ... some other logic ...
}
@end
```

Setting `name` triggers the `setName` method which in turn sets `fullName`. This could lead to the `setFullName` being called repeatedly resulting in a stack overflow or unexpected behavior.