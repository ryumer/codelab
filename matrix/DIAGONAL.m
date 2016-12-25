/*
Give a N*N square matrix, return an array of its anti-diagonals. Look at the example for more details.

Example:

		
Input: 	

1 2 3
4 5 6
7 8 9

Return the following :

[ 
  [1],
  [2, 4],
  [3, 5, 7],
  [6, 8],
  [9]
]


Input : 
1 2
3 4

Return the following  : 

[
  [1],
  [2, 3],
  [4]
]

*/

@implementation Solution
	-(NSMutableArray *) diagonal:(NSMutableArray *) A  {
	    NSMutableArray *result = [[NSMutableArray alloc] init];
	    int N = A.count;
	    
	    for (int j=0; j<N*2-1; j++) {
	        NSMutableArray *diagonal = [[[NSMutableArray alloc] init] autorelease];
	        
	        int j_back = j;
	        for (int i=0; i<N && j_back >=0; i++, j_back--) {
	            if (j_back < N) {
	                NSMutableArray *arr = [A objectAtIndex:i];
	                [diagonal addObject:[arr objectAtIndex:j_back]];
	            }
	        }
	        
	        [result addObject:diagonal];
	    }
	    return [result autorelease];
	}
@end
