/*
Given a collection of numbers, return all possible permutations.

Example:

[1,2,3] will have the following permutations:

[1,2,3]
[1,3,2]
[2,1,3] 
[2,3,1] 
[3,1,2] 
[3,2,1]
NOTE

No two entries in the permutation sequence should be the same.
For the purpose of this problem, assume that all the numbers in the collection are unique.
Warning : DO NOT USE LIBRARY FUNCTION FOR GENERATING PERMUTATIONS.
Example : next_permutations in C++ / itertools.permutations in python.
If you do, we will disqualify your submission retroactively and give you penalty points.
*/

@implementation Solution
	-(NSMutableArray *) permute:(NSMutableArray *) a  {
	    NSMutableArray *result = [[[NSMutableArray alloc] init] autorelease];
	    [self permute:a :0 :&result];
	    return result;
	}
	
	-(void)permute:(NSMutableArray *)a :(NSInteger)k :(NSMutableArray **)result {
	    for (int i=k; i<a.count; i++) {
	        [a exchangeObjectAtIndex:i withObjectAtIndex:k];
	        [self permute:a :k+1 :result];
	        [a exchangeObjectAtIndex:k withObjectAtIndex:i];
	    }
	    if (k == a.count-1) {
	        [*result addObject:[NSArray arrayWithArray:a]];
	    }
	}
@end
