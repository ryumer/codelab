/*
Given an index k, return the kth row of the Pascal’s triangle.

Pascal’s triangle : To generate A[C] in row R, sum up A’[C] and A’[C-1] from previous row R - 1.

Example:

Input : k = 3

Return : [1,3,3,1]
NOTE : k is 0 based. k = 0, corresponds to the row [1].
Note:Could you optimize your algorithm to use only O(k) extra space?
*/

@implementation Solution
	-(NSMutableArray *) getRow:(NSInteger) A  {
	    NSMutableArray *levels = [[NSMutableArray alloc] init];
	    
	    NSMutableArray *level0 = [[NSMutableArray alloc] init];
	    [level0 addObject:@(1)];
	    
	    [levels addObject:level0];
	    
	    for (int i=1; i<=A+1; i++) {
	        NSMutableArray *level_i = [[NSMutableArray alloc] init];
	        int prev = i-1;
	        NSMutableArray *level_i_minus_1 = [levels objectAtIndex:0];
	        
	        for (int j=0; j<i; j++) {
	            NSNumber *p = [self getIndex:j-1 from:level_i_minus_1];
	            NSNumber *n = [self getIndex:j from:level_i_minus_1];
	            NSNumber *val = @([p integerValue]+[n integerValue]);
	            [level_i addObject:val];
	        }
	        [levels addObject:level_i];
	        [levels removeObjectAtIndex:0];
	    }
	    
	    return [levels objectAtIndex:levels.count-1];
	    
	}
	
	-(NSNumber *)getIndex:(int)index from:(NSMutableArray *)arr {
	    if (index == arr.count || index == -1) {
	        return @(0);
	    } else {
	        return [arr objectAtIndex:index];
	    }
	}
@end
