/*
Given a binary tree, return the zigzag level order traversal of its nodes’ values. (ie, from left to right, then right to left for the next level and alternate between).

Example : 
Given binary tree

    3
   / \
  9  20
    /  \
   15   7
return

[
         [3],
         [20, 9],
         [15, 7]
]
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
	-(NSMutableArray *) zigzagLevelOrder:(TreeNode *) A  {
	    NSMutableArray *levels = [[[NSMutableArray alloc] init] autorelease];
	   // NSMutableArray *level_0 = [[[NSMutableArray alloc] init] autorelease];
	   // [level_0 addObject:@(A.val)];
	    
	   // NSMutableArray *level_i = [[[NSMutableArray alloc] init] autorelease];
	   // if (A.right) [level_i addObject:A.right];
	   // if (A.left) [level_i addObject:A.left];
	    
	    
	   // NSMutableArray *q = [[[NSMutableArray alloc] init] autorelease];
	   // [q addObject:A];
	   // while (q.count > 0) {
	   //     TreeNode *b = [q objectAtIndex:0];
	   //     [q removeObjectAtIndex:0];
	        
	   //     NSMutableArray *level_i = [[[NSMutableArray alloc] init] autorelease];
	   //     [level_i addObject:@(b.val)];
	   //     if (b.left) [q addObject:b.left];
	   //     if (b.right) [q addObject:b.right];
	   // }
	    [self zigzag:A arr:levels level:0];
	    
	    for (int i=1; i<levels.count; i+=2) {
	        NSMutableArray *level = [levels objectAtIndex:i];
	        level = [[level reverseObjectEnumerator] allObjects];
	        [levels replaceObjectAtIndex:i withObject:level];
	       // [levels removeObjectAtIndex:i];
	       // [levels insertObject:level atIndex:i];
	    }
	    return levels;
	}
	
	-(void)zigzag:(TreeNode *)A arr:(NSMutableArray *)levels level:(int)level{
	    if (level >= levels.count) [levels addObject:[[[NSMutableArray alloc] init] autorelease]];
	    
	    NSMutableArray *levelArr = [levels objectAtIndex:level];
	    [levelArr addObject:@(A.val)];
	    if (A.left) [self zigzag:A.left arr:levels level:level+1];
	    if (A.right) [self zigzag:A.right arr:levels level:level+1];
	}
@end
