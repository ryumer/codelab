/*
Find shortest unique prefix to represent each word in the list.

Example:

Input: [zebra, dog, duck, dove]
Output: {z, dog, du, dov}
where we can see that
zebra = z
dog = dog
duck = du
dove = dov
NOTE : Assume that no word is prefix of another. In other words, the representation is always possible.
*/

@interface Node : NSObject
{
    unichar _c;
    int _val;
    Node *_left, *_mid, *_right;
}

@property (nonatomic, assign) unichar c;
@property (nonatomic, assign) int val;
@property (nonatomic, strong) Node *left, *mid, *right;

@end

@implementation Node

@synthesize right = _right;
@synthesize left = _left;
@synthesize mid = _mid;
@synthesize c = _c;
@synthesize val = _val;

- (id)initWithChar:(unichar)c {
    if (self == [super init]) {
        self.c = c;
        self.val = 0;
    }
    return self;
}

@end

@implementation Solution
-(NSMutableArray *) prefix:(NSMutableArray *) A {
    Node *root = nil;
    for (int i=0; i< A.count; i++) {
        NSString *str = [A objectAtIndex:i];
        root = [self put:root str:str];
    }
    
    NSMutableArray *res = [[NSMutableArray alloc] initWithCapacity:A.count];
    
    for (int i=0; i<A.count; i++) {
        NSString *str = [A objectAtIndex:i];
        NSString *prefix = [self getPrefix:root str:str];
        [res addObject:prefix];
    }
    
    return [res autorelease];
}

-(NSString *)getPrefix:(Node *)root str:(NSString *)str {
    NSMutableString *mutString = [[[NSMutableString alloc] initWithCapacity:str.length] autorelease];
    return [self get:root str:str index:0 builder:mutString];
}

- (NSString *)get:(Node *)node str:(NSString *)str index:(int)idx builder:(NSMutableString *)builder {
    unichar c = [str characterAtIndex:idx];
    
    if (c < node.c) {
        return [self get:node.left str:str index:idx builder:builder];
    } else if (c > node.c) {
        return [self get:node.right str:str index:idx builder:builder];
    } else if (node.val == 1) {
        [builder appendFormat:@"%c", node.c];
        return [NSString stringWithString:builder];
    } else {
        [builder appendFormat:@"%c", node.c];
        return [self get:node.mid str:str index:idx+1 builder:builder];
    }
}

- (Node *)put:(Node *)root str:(NSString *)str {
    
    return [self put:root str:str index:0];
}

- (Node *)put:(Node *)node str:(NSString *)str index:(int)idx {
    
    if (idx == str.length) return node;
    
    unichar c = [str characterAtIndex:idx];
    
    if (node == nil) node = [[Node alloc] initWithChar:c];
    
    if (c < node.c) {
        node.left = [self put:node.left str:str index:idx];
    } else if (c > node.c) {
        node.right = [self put:node.right str:str index:idx];
    } else {
        node.mid = [self put:node.mid str:str index:idx+1];
        node.val += 1;
    }
    
    return node;
}

@end
