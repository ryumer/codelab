/*
Write a function that takes an unsigned integer and returns the number of 1 bits it has.

Example:

The 32-bit integer 11 has binary representation

00000000000000000000000000001011
so the function should return 3.

Note that since Java does not have unsigned int, use long for Java
*/

public class Solution {
	public int numSetBits(long a) {
	    if (a==0) {
            return 0;
        }
        int numSetBits = 0;
        
        for (int i=1; i<33; i++) {
            numSetBits += a % 2;
            a = a / 2;
            if (a == 0) {
                break;
            }
        }
        return numSetBits;
	}
	
}
