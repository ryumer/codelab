/*
Remove Duplicates from Sorted Array

Given a sorted array, remove the duplicates in place such that each element can appear atmost twice and return the new length.

Do not allocate extra space for another array, you must do this in place with constant memory.

Note that even though we want you to return the new length, make sure to change the original array as well in place

For example,
Given input array A = [1,1,1,2],

Your function should return length = 3, and A is now [1,1,2].
*/

public class Solution {
	public int removeDuplicates(ArrayList<Integer> a) {
	    int cnt = 0;
	    int numCnt = 1;
        Integer lastNum = null;
	    
	    for (int i=0; i<a.size(); i++) {
	        if (a.get(i).equals(lastNum)) {
	            numCnt++;
	            if (numCnt > 2) {
	                cnt++;
	            } else {
	                a.set(i - cnt, a.get(i));
	            }
	        } else {
	            numCnt = 1;
	            a.set(i - cnt, a.get(i));
	        }
	        lastNum = a.get(i);
	    }
	    
	    for (int i=0; i<cnt; i++) {
	        a.remove(a.size()-1);
	    }
	    return a.size();
	}
}
