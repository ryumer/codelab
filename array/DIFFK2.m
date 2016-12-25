/*
Given an array A of integers and another non negative integer k, find if there exists 2 indices i and j such that A[i] - A[j] = k, i != j.

Example :

Input :

A : [1 5 3]
k : 2
Output :

1
as 3 - 1 = 2

Return 0 / 1 for this problem.
*/

@implementation Solution
	-(NSInteger) diffPossible:(NSArray *) A :(NSInteger) B  {
	    NSMutableDictionary *dict = [[[NSMutableDictionary alloc] init] autorelease];
	   // for (int i=0; i<A.count; i++) {
	   //     int num = [[A objectAtIndex:i] integerValue];
	   //     int target = num + B;
	   //     [dict setObject:@(i) forKey:@(num)];
	   // }
	    
	    for (int i=0; i<A.count; i++) {
	        int num = [[A objectAtIndex:i] integerValue];
	        int target = num + B;
	        NSNumber *index = [dict objectForKey:@(target)];
	        if (index) {
	            if ([index integerValue] != i) return 1;
	        }
	        target = num - B;
	        index = [dict objectForKey:@(target)];
	        if (index) {
	            if ([index integerValue] != i) return 1;
	        }
	        [dict setObject:@(i) forKey:@(num)];
	    }
	    return 0;
	}
@end
