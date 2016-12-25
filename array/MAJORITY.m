/*
Given an array of size n, find the majority element. The majority element is the element that appears more than floor(n/2) times.

You may assume that the array is non-empty and the majority element always exist in the array.

Example :

Input : [2, 1, 2]
Return  : 2 which occurs 2 times which is greater than 3/2. 
*/

@implementation Solution
	-(NSInteger) majorityElement:(NSArray *) A  {
	    int cnt = 1;
	    int pot_idx = 0;
	    for (int i=1; i<A.count; i++) {
	        int num = [[A objectAtIndex:i] integerValue];
	        int pot_num = [[A objectAtIndex:pot_idx] integerValue];
	        
	        if (num == pot_num) {
	            cnt++;
	        } else {
	            cnt--;
	            if (cnt == 0) {
	                pot_idx = i;
	                cnt = 1;
	            }
	        }
	    }
	    return [[A objectAtIndex:pot_idx] integerValue];
	}
@end
