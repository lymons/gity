// Copyright Aaron Smith 2009
// 
// This file is part of Gity.
// 
// Gity is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
// 
// Gity is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
// 
// You should have received a copy of the GNU General Public License
// along with Gity. If not, see <http://www.gnu.org/licenses/>.

#import "GTOpExportZip.h"

@implementation GTOpExportZip

- (id) initWithGD:(GittyDocument *)_gd andPath:(NSString *) _path andCommit:(NSString *) _commit {
	path = [_path copy];
	commit = [_commit copy];
	self = [super initWithGD:_gd];
	return self;
}

- (void) setArguments {
	if([self isCancelled]) return;
	[self setArgumentsWithPythonScript:[GTPythonScripts exportZip] setArgsOnTask:true];
	[args addObject:[@"-m " stringByAppendingString:commit]];
	[args addObject:[@"-m " stringByAppendingString:path]];
	[self updateArguments];
}

- (void) dealloc {
	#ifdef GT_PRINT_DEALLOCS
	printf("DEALLOC GTOpExportZip\n");
	#endif
	GDRelease(path);
	GDRelease(commit);
}

@end
