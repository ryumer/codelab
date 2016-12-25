/*

For Given Number N find if its COLORFUL number or not

Return 0/1

COLORFUL number:

A number can be broken into different contiguous sub-subsequence parts. 
Suppose, a number 3245 can be broken into parts like 3 2 4 5 32 24 45 324 245. 
And this number is a COLORFUL number, since product of every digit of a contiguous subsequence is different
Example:

N = 23
2 3 23
2 -> 2
3 -> 3
23 -> 6
this number is a COLORFUL number since product of every digit of a sub-sequence are different. 

Output : 1

*/

@implementation Solution
    -(NSInteger) colorful:(NSInteger) A  {
        NSMutableArray *digits = [[NSMutableArray alloc] init];
        NSString *s = [NSString stringWithFormat:@"%ld", (long)A];
        for (int i=0; i<s.length; i++) {
            for (int j=1; j<s.length+1-i; j++) {
                [digits addObject:[s substringWithRange:NSMakeRange(i, j)]];
            }
        }
        
        NSMutableSet *products = [[NSMutableSet alloc] init];
        
        for (int i=0; i<digits.count; i++) {
            NSString *s = [digits objectAtIndex:i];
            
            long product = [self productOfDigits:s];
            if (![products containsObject:@(product)]) {
                [products addObject:@(product)];
            } else {
                [digits release];
                [products release];
                return 0;
            }
        }
        [digits release];
        [products release];
        return 1;
    }
    
    -(NSInteger)productOfDigits:(NSString *)s {
        int product = 1;
        for (int i=0; i<s.length; i++) {
            NSString *digit = [s substringWithRange:NSMakeRange(i, 1)];
            product = product * [digit intValue];
        }
        return product;
    }
@end
