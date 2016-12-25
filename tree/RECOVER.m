/*
Two elements of a binary search tree (BST) are swapped by mistake.
Tell us the 2 values swapping which the tree will be restored.

Note:
A solution using O(n) space is pretty straight forward. Could you devise a constant space solution?
Example :


Input : 
         1
        / \
       2   3

Output : 
       [1, 2]

Explanation : Swapping 1 and 2 will change the BST to be 
         2
        / \
       1   3
which is a valid BST          
*/

/**
 * Definition for binary tree
 * @interface TreeNode: NSObject {
 *     NSInteger val;
 *     TreeNode *left;
 *     TreeNode *right;
 * }
 * @end
 */
@implementation Solution
	-(NSMutableArray *) recoverTree:(TreeNode *) A  {
	    TreeNode *prev, *first, *middle, *last;
	    prev=first=middle=last=nil;
	    
	    [self inorder:A prev:&prev first:&first middle:&middle last:&last];
	    
	    // Fix (or correct) the tree
        if( first && last )
            return [NSArray arrayWithObjects:@(last.val), @(first.val)];
        else if( first && middle ) // Adjacent nodes swapped
            return [NSArray arrayWithObjects:@(middle.val), @(first.val)];
	}
	
	- (void)inorder:(TreeNode*)root prev:(TreeNode **)prev first:(TreeNode**)first middle:(TreeNode**)middle last:(TreeNode**)last{
	    if (root == nil) return;
	    
	    [self inorder:root.left prev:prev first:first middle:middle last:last];
	    
	    if (*prev && root.val < (*prev).val) {
	        // violation
	        
	        if (!*first) {
	            *first = *prev;
	            *middle = root;
	        } else {
	            *last = root;
	        }
	    }
	    *prev = root;
	    [self inorder:root.right prev:prev first:first middle:middle last:last];
	}
@end
