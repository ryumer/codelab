/*
Given a binary tree, check whether it is a mirror of itself (ie, symmetric around its center).

Example :

    1
   / \
  2   2
 / \ / \
3  4 4  3
The above binary tree is symmetric. 
But the following is not:

    1
   / \
  2   2
   \   \
   3    3
Return 0 / 1 ( 0 for false, 1 for true ) for this problem
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
	-(NSInteger) isSymmetric:(TreeNode *) A  {
	    TreeNode *left = A;
	    TreeNode *right = A;
	    
	    return [self traverse:left :right] ? 1 : 0;
	}
	
	- (BOOL)traverse:(TreeNode *)left :(TreeNode *)right {
	    if (left == nil && right == nil) {
	        return YES;
	    } else if (left == nil || right == nil) {
	        return NO;
	    } else if (left.val != right.val) {
	        return NO;
	    }
	    return [self traverse:left.left :right.right] && [self traverse:left.right :right.left];
	}
@end
