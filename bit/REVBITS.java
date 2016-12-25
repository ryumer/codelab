/*
Reverse bits of an 32 bit unsigned integer

Example 1:

x = 0,

          00000000000000000000000000000000  
=>        00000000000000000000000000000000
return 0

Example 2:

x = 3,

          00000000000000000000000000000011 
=>        11000000000000000000000000000000
return 3221225472

Since java does not have unsigned int, use long
*/

public class Solution {
	public long reverse(long a) {
	   // 00000000000000000000000000000011
	    long res = 0L;
	    for (long i=0, n=a; i<32; i++, n>>=1) {
	        res <<= 1;
	        res |= (n%2==1) ? 1L : 0L;
	    }
	    return res;
	}
}
