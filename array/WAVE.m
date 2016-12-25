/*
Given an array of integers, sort the array into a wave like array and return it, 
In other words, arrange the elements into a sequence such that a1 >= a2 <= a3 >= a4 <= a5.....

Example

Given [1, 2, 3, 4]

One possible answer : [2, 1, 4, 3]
Another possible answer : [4, 1, 3, 2]
NOTE : If there are multiple answers possible, return the one thats lexicographically smallest. 
So, in example case, you will return [2, 1, 4, 3]
*/

@implementation Solution
	-(NSMutableArray *) wave:(NSMutableArray *) A  {
	    [A sortUsingSelector:@selector(compare:)];
        NSMutableArray *res = [[[NSMutableArray alloc] init] autorelease];
        for (int i=0; i<A.count-1; i +=2) {
            [res addObject:[A objectAtIndex:i+1]];
            [res addObject:[A objectAtIndex:i]];
        }
        
        if (A.count != res.count) [res addObject:[A objectAtIndex:A.count-1]];
        return res;
    }
@end
