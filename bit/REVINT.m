/*
Reverse digits of an integer.

Example1:

x = 123,

return 321
Example2:

x = -123,

return -321

Return 0 if the result overflows and does not fit in a 32 bit signed integer
*/

@implementation Solution
	-(NSInteger) reverse:(NSInteger) A  {
	    int negativeFactor = 1;
	    if (A < 0) {
	        negativeFactor = -1;
	        A = -A;
	    }
	    
	    NSInteger rev = 0;
	    while (A != 0) {
	        int d = A%10;
	        rev = rev*10 + d;
	        A = A/10;
	    }
	    NSInteger res = rev * negativeFactor;
	    if (res < -2147483648 || res > 2147483647) return 0;
	    return res;
	    
	   // NSString *str = [NSString stringWithFormat:@"%d", A];
	    
	   // NSInteger rev = 0;
	   // BOOL negativeFactor = 1;
	   // for (int i=str.length-1; i>=0; i--) {
	   //     unichar c = [str characterAtIndex:i];
	   //     if (c=='-') {
	   //         negativeFactor = -1;
	   //         continue;
	   //     }
	        
	   //     unichar val = c - '0';
	   //     rev = rev*10 + val;
	   // }
	   // return rev * negativeFactor;
	}
@end
