/*
Given 2 non negative integers m and n, find gcd(m, n)

GCD of 2 integers m and n is defined as the greatest integer g such that g is a divisor of both m and n.
Both m and n fit in a 32 bit signed integer.

Example

m : 6
n : 9

GCD(m, n) : 3 
NOTE : DO NOT USE LIBRARY FUNCTIONS
*/

@implementation Solution
	-(NSInteger) gcd:(NSInteger) A :(NSInteger) B  {
	    if (A==0 || B==0) return MAX(A, B);
	    int g = MIN(A, B);
	    for (int i=g; i>0; i--) {
	        if (A%i == 0 && B%i == 0) {
	            return i;
	        }
	    }
	    return 1;
	}
@end
