/*
Find out the maximum sub-array of non negative numbers from an array.
The sub-array should be continuous. That is, a sub-array created by choosing the second and fourth element and skipping the third element is invalid.

Maximum sub-array is defined in terms of the sum of the elements in the sub-array. Sub-array A is greater than sub-array B if sum(A) > sum(B).

Example:

A : [1, 2, 5, -7, 2, 3]
The two sub-arrays are [1, 2, 5] [2, 3].
The answer is [1, 2, 5] as its sum is larger than [2, 3]
NOTE: If there is a tie, then compare with segment's length and return segment which has maximum length
NOTE 2: If there is still a tie, then return the segment with minimum starting index
*/

@implementation Solution
	-(NSMutableArray *) maxset:(NSMutableArray *) A  {
	    NSInteger bestStart = -1;
	    NSInteger bestLength = 0;
	    NSInteger bestSum = 0;
	    
	    NSInteger currentStart = -1;
	    NSInteger currentLength = 0;
	    NSInteger currentSum = 0;
	    
	    for (int i=0; i<A.count; i++) {
	        NSInteger n = [[A objectAtIndex:i] integerValue];
	        
	        if (n >= 0) {
	            if (currentStart == -1) {
	                // a new sub-array begins
	                currentStart = i;
	            }
	            
	            currentLength += 1;
                currentSum += n;
	        }
	        
	        if (n<0 || i==A.count-1) {
	            if (currentStart != -1) {
	                // a sub-array has ended
	                // compare with best sub-array
	                if (currentSum > bestSum) {
	                    // sum is greater
	                    bestStart = currentStart;
	                    bestLength = currentLength;
	                    bestSum = currentSum;
	                } else if (currentSum == bestSum && currentLength>bestLength) {
	                    // length is greater
	                    bestStart = currentStart;
	                    bestLength = currentLength;
	                    bestSum = currentSum;
	                } // otherwise best starts earlier, so it is still best
	            }
	            
	            // reset current
                currentStart = -1;
        	    currentLength = 0;
        	    currentSum = 0;
	        }
	    }
        
        if (bestStart == -1) return [NSArray arrayWithObjects:nil];
        return [A subarrayWithRange:NSMakeRange(bestStart, bestLength)];
	}
@end
