/*
Given a positive integer which fits in a 32 bit signed integer, find if it can be expressed as A^P where P > 1 and A > 0. A and P both should be integers.

Example

Input : 4
Output : True  
as 2^2 = 4. 
*/

/*
check powers of 2
0000000
0000011
0000101
0011011
1010001
*/

public class Solution {
    public boolean isPower(int a) {
        if (a==1) {
            return true;
        }
        for (int i=2; i<a; i++) {
            if (isPowerOf(a, i)) {
                return true;
            }
        }
        return false;
    }
    
    private boolean isPowerOf(int a, int base) {
        if (a==1) return true;
        if (a%base == 0) {
            return isPowerOf(a/base, base);
        } else {
            return false;
        }
    }
}
