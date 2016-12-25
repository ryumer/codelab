/*
Given N and M find all stepping numbers in range N to M

The stepping number:

A number is called as a stepping number if the adjacent digits have a difference of 1.
e.g 123 is stepping number, but 358 is not a stepping number

Example:

N = 10, M = 20
all stepping numbers are 10 , 12 
Return the numbers in sorted order.
*/

@implementation Solution
	-(NSMutableArray *) stepnum:(NSInteger) A :(NSInteger) B  {
	    NSMutableArray *stepNumbers = [[NSMutableArray alloc] init];
	    for (int i=A; i<=B; i++) {
	        if ([self isStepNumber:i]) {
	            [stepNumbers addObject:@(i)];
	        }
	    }
	    return [stepNumbers autorelease];
	}
	
	-(BOOL)isStepNumber:(NSInteger)A {
	    // negative numbers are not step numbers
	    if (A < 0) return NO;
	    // one digit numbers are step numbers
	    if (A/10 == 0) return YES;
	    
	    int lastDigit = A % 10;
	    A = A / 10;
	    while (A > 0) {
	        int digit = A % 10;
	        if (abs(digit-lastDigit) != 1) {
	            return NO;
	        }
	        A = A / 10;
	        lastDigit = digit;
	    }
	    return YES;
	}
@end
