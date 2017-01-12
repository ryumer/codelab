/*
Compare two version numbers version1 and version2.

If version1 > version2 return 1,
If version1 < version2 return -1,
otherwise return 0.
You may assume that the version strings are non-empty and contain only digits and the . character.
The . character does not represent a decimal point and is used to separate number sequences.
For instance, 2.5 is not "two and a half" or "half way to version three", it is the fifth second-level revision of the second first-level revision.

Here is an example of version numbers ordering:

0.1 < 1.1 < 1.2 < 1.13 < 1.13.4
*/

@interface NSString (Additions)
- (NSString *)removeZeroes;
- (NSComparisonResult)versionCompare:(NSString *)other;
@end

@implementation NSString (Additions)
- (NSString *)removeZeroes
{
    if (self.length == 0) return @"0";
    if (self.length == 1) return self;
    for (int i=0; i<self.length-1; i++) {
        unichar c = [self characterAtIndex:i];
        if (c != '0') {
            return [self substringFromIndex:i];
        }
    }
    return [self substringFromIndex:self.length-1];
}

- (NSComparisonResult)versionCompare:(NSString *)other
{
    
    if (self.length > other.length) return NSOrderedDescending;
    if (other.length > self.length) return NSOrderedAscending;
    
    for (int i=0; i<self.length; i++) {
        unichar c1 = [self characterAtIndex:i];
        unichar c2 = [other characterAtIndex:i];
        if (c1>c2) return NSOrderedDescending;
        if (c1<c2) return NSOrderedAscending;
    }
    return NSOrderedSame;
}

@end

@implementation Solution
	-(NSInteger) compareVersion:(NSMutableString *) A :(NSMutableString *) B  {
	    NSArray *arrA = [A componentsSeparatedByString:@"."];
	    NSString *majorA=@"0", *minorA=@"0", *revA=@"0";
	    
	    if (arrA.count > 0) majorA = [[arrA objectAtIndex:0] removeZeroes];
	    if (arrA.count > 1) minorA = [[arrA objectAtIndex:1] removeZeroes];
	    if (arrA.count > 2) revA = [[arrA objectAtIndex:2] removeZeroes];
	    
	    NSArray *arrB = [B componentsSeparatedByString:@"."];
	    NSString *majorB=@"0", *minorB=@"0", *revB=@"0";
	    
	    if (arrB.count > 0) majorB = [[arrB objectAtIndex:0] removeZeroes];
	    if (arrB.count > 1) minorB = [[arrB objectAtIndex:1] removeZeroes];
	    if (arrB.count > 2) revB = [[arrB objectAtIndex:2] removeZeroes];
	    
	    if ([majorA versionCompare:majorB] == NSOrderedAscending) return -1;
	    if ([majorA versionCompare:majorB] == NSOrderedDescending) return 1;
	    if ([minorA versionCompare:minorB] == NSOrderedAscending) return -1;
	    if ([minorA versionCompare:minorB] == NSOrderedDescending) return 1;
	    if ([revA versionCompare:revB] == NSOrderedAscending) return -1;
	    if ([revA versionCompare:revB] == NSOrderedDescending) return 1;
	    
	    return 0;
	}
@end


