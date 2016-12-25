/*
Given a linked list, return the node where the cycle begins. If there is no cycle, return null.

Try solving it using constant additional space.

Example :

Input : 

                  ______
                 |     |
                 \/    |
        1 -> 2 -> 3 -> 4

Return the node corresponding to node 3. 
*/

/**
 * Definition for singly-linked list.
 * class ListNode {
 *     public int val;
 *     public ListNode next;
 *     ListNode(int x) { val = x; next = null; }
 * }
 */
public class Solution {
	public ListNode detectCycle(ListNode a) {
	    if (a == null || a.next == null) {
	        return null;
	    }
	    
	    boolean hasCycle = false;
	    ListNode f = a;
	    ListNode s = a;
	    while (s != null && f != null && f.next != null) {
	        s = s.next;
	        f = f.next.next;
	        if (s == f) {
	            hasCycle = true;
	            break;
	        }
	    }
	    
	    if (!hasCycle) {
	        return null;
	    } else {
	        f = a;
	        while (f != s) {
	            f = f.next;
	            s = s.next;
	        }
	        return s;
	    }
	}
}
