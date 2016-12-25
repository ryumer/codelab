/*
Given numRows, generate the first numRows of Pascal’s triangle.

Pascal’s triangle : To generate A[C] in row R, sum up A’[C] and A’[C-1] from previous row R - 1.

Example:

Given numRows = 5,

Return

[
     [1],
     [1,1],
     [1,2,1],
     [1,3,3,1],
     [1,4,6,4,1]
]
*/

@implementation Solution
	-(NSMutableArray *) generate:(NSInteger) A  {
	    
	    NSMutableArray *levels = [[[NSMutableArray alloc] init] autorelease];
	    if (A < 1) return levels;
	    NSMutableArray *level0 = [[[NSMutableArray alloc] init] autorelease];
	    [level0 addObject:@(1)];
	    
	    [levels addObject:level0];
	    
	    for (int i=1; i<A; i++) {
	        NSMutableArray *level_i = [[[NSMutableArray alloc] init] autorelease];
	        int prev = i-1;
	        NSMutableArray *level_i_minus_1 = [levels objectAtIndex:prev];
	        
	        for (int j=0; j<i+1; j++) {
	            NSNumber *p = [self getIndex:j-1 from:level_i_minus_1];
	            NSNumber *n = [self getIndex:j from:level_i_minus_1];
	            NSNumber *val = @([p integerValue]+[n integerValue]);
	            [level_i addObject:val];
	        }
	        [levels addObject:level_i];
	       // [levels removeObjectAtIndex:0];
	    }
	    
	    return levels;
	    
	}
	
	-(NSNumber *)getIndex:(int)index from:(NSMutableArray *)arr {
	    if (index == arr.count || index == -1) {
	        return @(0);
	    } else {
	        return [arr objectAtIndex:index];
	    }
	}
@end
