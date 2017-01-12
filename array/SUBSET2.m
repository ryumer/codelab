/*
Given a collection of integers that might contain duplicates, S, return all possible subsets.

Note:

Elements in a subset must be in non-descending order.
The solution set must not contain duplicate subsets.
The subsets must be sorted lexicographically.
Example :
If S = [1,2,2], the solution is:

[
[],
[1],
[1,2],
[1,2,2],
[2],
[2, 2]
]
*/

@implementation Solution
	-(NSMutableArray *) subsetsWithDup:(NSMutableArray *) a  {
	    [a sortUsingSelector:@selector(compare:)];
	    NSMutableArray *result = [[[NSMutableArray alloc] init] autorelease];
	    [self generateSubsets:a :[[[NSMutableArray alloc] init] autorelease] :0 :result];
	    [result sortUsingFunction:sortLex context:NULL];
	    return result;
	    
	    // recursive solution by fixing one element at a time
	   // NSMutableArray *subsets = [self subsetsWithDup2:a];
	   // [subsets sortUsingFunction:sortLex context:NULL];
	   // return subsets;
	    
	    // subsets with k elements solution
	   // NSMutableArray *result = [[[NSMutableArray alloc] init] autorelease];
	    
	   // for (int i=0; i<a.count+1; i++) {
	   //     NSMutableArray *indexes = [self combine:a.count :i];
	   //     for (int j=0; j<indexes.count; j++) {
	   //         NSMutableArray *indexList = [indexes objectAtIndex:j];
	   //         NSMutableArray *subset = [[[NSMutableArray alloc] init] autorelease];
	   //         for (int k=0; k<indexList.count; k++) {
	   //             [subset addObject:[a objectAtIndex:[[indexList objectAtIndex:k] integerValue]]];
	   //         }
	   //         [result addObject:subset];
	   //     }
	   // }
	   // //  order of this is based on subset count (empty - 1 element - 2 element - ...)
	   // [subsets sortUsingFunction:sortLex context:NULL];
	   // return result;
	}
	
	NSComparisonResult sortLex(NSArray *arr1, NSArray *arr2, void *context) {
	    int minCount = MIN(arr1.count, arr2.count);
	    
	    for (int i = 0; i < minCount; i++) {
            
            NSComparisonResult res = [[arr1 objectAtIndex:i] compare:[arr2 objectAtIndex:i]];
            if (res != NSOrderedSame) return res;
        }
        return [@(arr1.count) compare:@(arr2.count)];
    }
    
    - (void)generateSubsets:(NSMutableArray *)a :(NSMutableArray *)ans :(int)index :(NSMutableArray *)result {
        if (index >= a.count) {
            NSMutableArray *answer = [ans mutableCopy];
            [result addObject:answer];
            return;
        }
        
        int curIndex = index + 1;
        
        // find the number of repeating elements
        while (curIndex < a.count && [[a objectAtIndex:curIndex] isEqual:[a objectAtIndex:index]])
            curIndex++;

        // There are curIndex - index number of repeating entries. 
        // Now we loop over the number of entries to include in our subset.
        for (int i = 0; i <= (curIndex - index); i++) {
            for (int j = 0; j < i; j++)
                [ans addObject:[a objectAtIndex:index]];
                
            [self generateSubsets:a :ans :curIndex :result];
            
            for (int j = 0; j < i; j++)
                [ans removeObjectAtIndex:ans.count-1];
        }
    }
	
	- (NSMutableArray *)subsetsWithDup2:(NSMutableArray *) a {
	
	    NSMutableArray *result = [[[NSMutableArray alloc] init] autorelease];
	    if (a.count==0) {
	        NSMutableArray *set = [[[NSMutableArray alloc] init] autorelease];
	        [result addObject:set];
	        return result;
	    }
	    
	    NSNumber *head = [a objectAtIndex:0];
	    NSMutableArray *rest = [a subarrayWithRange:NSMakeRange(1, a.count-1)];
	    
	    for (NSArray *set in [self subsetsWithDup2:rest]) {
	        [result addObject:set];
	        NSMutableArray *currentSet = [NSMutableArray array];
	        [currentSet addObject:head];
	        [currentSet addObjectsFromArray:set];
	        [result addObject:currentSet];
	    }
	    return result;
	}
	
	-(NSMutableArray *) combine:(int)n :(int)k {
	    NSMutableArray *combinationList = [[[NSMutableArray alloc] init] autorelease];
	    if (k > n) return combinationList;
	    // initial subset: 1, 2
        NSMutableArray *subset = [[[NSMutableArray alloc] init] autorelease];
        for (int i=0; i<k; i++) {
            [subset addObject:@(i)];
        }
        [combinationList addObject:subset];
	    while (true) {
	        
	        
	        // check which element can be updated from right
	        int i = subset.count-1; // 0
	        while (i>=0) {
	            NSInteger index = [[subset objectAtIndex:i] integerValue];
	            if (index < n-k+i) { // 1 <  2-1+0+1=2
	                subset = [NSMutableArray arrayWithArray:subset]; // make a copy of subset
	                // increment the element
	                [subset replaceObjectAtIndex:i withObject:@(index+1)];
	                // fill the rest
	                for (int j=i+1; j<k; j++) {
	                    [subset replaceObjectAtIndex:j withObject:@(index+j-i)];
	                }
	                // add to list
	                [combinationList addObject:subset];
	                
	                // reset possible increment index
	                i = subset.count-1;
	                continue;
	            }
	            i--;
	        }
	        
	        if (i < 0) break;
	    }
	    return combinationList;
	}
	
@end
