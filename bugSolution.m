The solution involves using `willChangeValueForKey:` and `didChangeValueForKey:` to explicitly control the KVO notifications and prevent the infinite loop:

```objectivec
@interface MyClass : NSObject
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *fullName;
@end

@implementation MyClass
- (void)setName:(NSString *)name {
    [self willChangeValueForKey:@