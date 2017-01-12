/*
Given two integers n and k, return all possible combinations of k numbers out of 1 2 3 ... n.

Make sure the combinations are sorted.

To elaborate,
1. Within every entry, elements should be sorted. [1, 4] is a valid entry while [4, 1] is not.
2. Entries should be sorted within themselves.

Example :
If n = 4 and k = 2, a solution is:

[
  [1,2],
  [1,3],
  [1,4],
  [2,3],
  [2,4],
  [3,4],
]
Warning : DO NOT USE LIBRARY FUNCTION FOR GENERATING COMBINATIONS.
Example : itertools.combinations in python.
If you do, we will disqualify your submission retroactively and give you penalty points.
*/

public class Solution {
	public ArrayList<ArrayList<Integer>> combine(int n, int k) {
	    ArrayList<ArrayList<Integer>> combinationList = new ArrayList<ArrayList<Integer>>();
	    if (k > n) return combinationList;
	    // initial subset: 1, 2
        ArrayList<Integer> subset = new ArrayList<Integer>();
        for (int i=1; i<k+1; i++) {
            subset.add(i);
        }
        combinationList.add(subset);
	    while (true) {
	        
	        
	        // check which element can be updated from right
	        int i = subset.size()-1; // 0
	        while (i>=0) {
	            if (subset.get(i) < n-k+i+1) { // 1 <  2-1+0+1=2
	                subset = new ArrayList<Integer>(subset); // make a copy of subset
	                // increment the element
	                subset.set(i, subset.get(i)+1);
	                // fill the rest
	                for (int j=i+1; j<k; j++) {
	                    subset.set(j, subset.get(i)+j-i);
	                }
	                // add to list
	                combinationList.add(subset);
	                
	                // reset possible increment index
	                i = subset.size()-1;
	                continue;
	            }
	            i--;
	        }
	        
	        if (i < 0) break;
	    }
	    return combinationList;
	}
	
}
