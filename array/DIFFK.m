/*
Given an array ‘A’ of sorted integers and another non negative integer k, find if there exists 2 indices i and j such that A[i] - A[j] = k, i != j.

Example:

Input :
    A : [1 3 5] 
    k : 4
Output : YES

as 5 - 1 = 4
Return 0 / 1 ( 0 for false, 1 for true ) for this problem

Try doing this in less than linear space complexity.
*/

@implementation Solution
	-(NSInteger) diffPossible:(NSMutableArray *) A :(NSInteger) B  {
	    int j = 0;
	    for (int i=0; i<A.count; i++) {
	        int num = [[A objectAtIndex:i] integerValue];
	        int target = num + B;
	        j = MAX(i+1, j);
	        while (j < A.count) {
	            if ([[A objectAtIndex:j] integerValue] == target) return 1;
	            if ([[A objectAtIndex:j] integerValue] > target) break;
	            j++;
	        }
	    }
	    return 0;
	}
@end
