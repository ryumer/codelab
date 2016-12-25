/*
Given an integer n, return the number of trailing zeroes in n!.

Note: Your solution should be in logarithmic time complexity.

Example :

n = 5
n! = 120 
Number of trailing zeros = 1
So, return 1
*/

@implementation Solution
	-(NSInteger) trailingZeroes:(NSInteger) A  {
	    int cnt2 = 0;
	    int cnt5 = 0;
	    for (int i=A; i>0; i--) {
	        int num = i;
	        while (num % 2 == 0) {
	            cnt2++;
	            num /= 2;
	        }
	        num = i;
	        while (num % 5 == 0) {
	            cnt5++;
	            num /= 5;
	        }
	    }
	    
	    return MIN(cnt2, cnt5);
	}
@end
