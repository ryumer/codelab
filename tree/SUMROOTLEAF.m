/*
Given a binary tree containing digits from 0-9 only, each root-to-leaf path could represent a number.

An example is the root-to-leaf path 1->2->3 which represents the number 123.

Find the total sum of all root-to-leaf numbers % 1003.

Example :

    1
   / \
  2   3
The root-to-leaf path 1->2 represents the number 12.
The root-to-leaf path 1->3 represents the number 13.

Return the sum = (12 + 13) % 1003 = 25 % 1003 = 25.
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
	-(NSInteger) sumNumbers:(TreeNode *) A  {
	   // NSInteger n = [self traverse:A stack:[[[NSMutableArray alloc] init] autorelease]];
	    NSInteger n = [self traverse:A num:0];
	    return n % 1003;
	}
	
	- (NSInteger)traverse:(TreeNode*)A num:(NSInteger)num {
	    NSInteger n = (num*10+A.val) % 1003;
	    
	    if (!A.left && !A.right) {
	        return n;
	    }
	    
	    NSInteger leftSum = 0;
	    NSInteger rightSum = 0;
	    
	    if (A.left) {
	        leftSum = [self traverse:A.left num:n];
	    }
	    
	    if (A.right) {
	        rightSum = [self traverse:A.right num:n];
	    } 
	    return leftSum + rightSum;
	}
	
	- (NSInteger)traverse:(TreeNode*)A stack:(NSMutableArray*)stack {
	    NSMutableArray *currentStack = [NSMutableArray arrayWithArray:stack];
	    [currentStack addObject:@(A.val)];
	    
	    if (!A.left && !A.right) {
	        return [self numberFromStack:currentStack];
	    }
	    
	    NSInteger leftSum = 0;
	    NSInteger rightSum = 0;
	    
	    if (A.left) {
	        leftSum = [self traverse:A.left stack:currentStack];
	    }
	    
	    if (A.right) {
	        rightSum = [self traverse:A.right stack:currentStack];
	    } 
	    return leftSum + rightSum;
	}
	
	- (NSInteger)numberFromStack:(NSMutableArray*)stack {
	    NSInteger num = 0;
	    for (int i=0; i<stack.count; i++) {
	        int n = [[stack objectAtIndex:i] integerValue];
	        num = num*10+n;
	        num %= 1003;
	    }
	    return num;
	}
@end
