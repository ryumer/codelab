/*
Given an even number ( greater than 2 ), return two prime numbers whose sum will be equal to given number.

NOTE A solution will always exist. read Goldbach’s conjecture

Example:


Input : 4
Output: 2 + 2 = 4

If there are more than one solutions possible, return the lexicographically smaller solution.

If [a, b] is one solution with a <= b,
and [c,d] is another solution with c <= d, then

[a, b] < [c, d] 

If a < c OR a==c AND b < d. 
*/

public class Solution {
    
    public ArrayList<Integer> primesum(int a) {
        ArrayList<Integer> list = new ArrayList<Integer>();
        for (int i=2; i<a/2+1; i++) {
            if (isPrime(i) && isPrime(a-i)) {
                list.add(i);
                list.add(a-i);
                break;
            }
        }
        return list;
    }
    
    private boolean isPrime(int a) {
        if (a == 2) {
            return true;
        }
        //check if n is a multiple of 2
        if (a%2==0) return false;
        //if not, then just check the odds
        for(int i=3;i*i<=a;i+=2) {
            if(a%i==0)
                return false;
        }
        
        return true;
    }
}
