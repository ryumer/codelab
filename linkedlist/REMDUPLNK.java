/*
Given a sorted linked list, delete all duplicates such that each element appear only once.

For example,
Given 1->1->2, return 1->2.
Given 1->1->2->3->3, return 1->2->3.
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
	public ListNode deleteDuplicates(ListNode a) {
	    ListNode p = a;
	    while (p != null) {
	        ListNode t = p.next;
	        if (t != null && t.val == p.val) {
	            while (t != null && p.val == t.val) {
	                t = t.next;
	            }
	            p.next = t;
	        }
	        p = p.next;
	    }
	    return a;
	}
}
