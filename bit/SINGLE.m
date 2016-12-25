/*
Given an array of integers, every element appears twice except for one. Find that single one.

Note: Your algorithm should have a linear runtime complexity. Could you implement it without using extra memory?

Example :

Input : [1 2 2 3 1]
Output : 3
*/

@implementation Solution
	-(NSInteger) singleNumber:(NSArray *) A  {
	    NSInteger bits = 0;
	    
	    for (int i=0; i<A.count; i++) {
	        NSNumber *n = [A objectAtIndex:i];
	        bits = bits^[n integerValue];
	    }
	    
	    return bits;
	}
@end
