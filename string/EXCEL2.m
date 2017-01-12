/*
Given a positive integer, return its corresponding column title as appear in an Excel sheet.

For example:

    1 -> A
    2 -> B
    3 -> C
    ...
    26 -> Z
    27 -> AA
    28 -> AB 
*/

@implementation Solution
	-(NSMutableString *) convertToTitle:(NSInteger) A  {
	    NSMutableString *result = [[[NSMutableString alloc] initWithString:@""] autorelease];
	    NSMutableArray *arr = [[[NSMutableArray alloc] init] autorelease];
	    NSInteger base = 26;
	    while (A != 0) {
	        A -= 1;
	        unichar c = A % base;
	        [arr addObject:[NSString stringWithFormat:@"%c",c+'A']];
	        A /= base;
	    }
	    
	    for (int i=arr.count-1; i>=0; i--) {
	        [result appendString:[arr objectAtIndex:i]];
	    }
	    return result;
	}
@end
