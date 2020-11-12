#import <Foundation/Foundation.h>
#import "ExampleClass-Swift.h"

int main(int argc, char** argv)
{
	ExampleClass *obj = [[ExampleClass alloc] init];
	[obj increment];
	NSLog(@"Testing");
}