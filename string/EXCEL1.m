/*
Given a column title as appears in an Excel sheet, return its corresponding column number.

Example:

    A -> 1
    
    B -> 2
    
    C -> 3
    
    ...
    
    Z -> 26
    
    AA -> 27
    
    AB -> 28 
*/

@implementation Solution
	-(NSInteger) titleToNumber:(NSMutableString *) A  {
	    NSInteger result = 0;
	    NSInteger factor = 1;
	    for (int i=A.length-1; i>=0; i--) {
	        unichar c = [A characterAtIndex:i];
	        c = c - 'A' + 1;
	        result += c * factor;
	        factor *= 26;
	    }
	    return result;
	}
@end
