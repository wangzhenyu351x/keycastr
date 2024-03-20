//	Copyright (c) 2009 Stephen Deken
//	All rights reserved.
// 
//	Redistribution and use in source and binary forms, with or without modification,
//	are permitted provided that the following conditions are met:
//
//	*	Redistributions of source code must retain the above copyright notice, this
//		list of conditions and the following disclaimer.
//	*	Redistributions in binary form must reproduce the above copyright notice,
//		this list of conditions and the following disclaimer in the documentation
//		and/or other materials provided with the distribution.
//	*	Neither the name KeyCastr nor the names of its contributors may be used to
//		endorse or promote products derived from this software without specific
//		prior written permission.
//
//	THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
//	AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
//	WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
//	IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT,
//	INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
//	BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
//	DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
//	LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
//	OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
//	ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.


#import "KCVisualizer.h"

@interface KCVisualizer (Private)

+(NSMutableDictionary*) _registry;

@end

@implementation KCVisualizer

+(NSMutableDictionary*) _registry
{
	static NSMutableDictionary* registry = nil;
	if (registry == nil)
		registry = [[NSMutableDictionary alloc] initWithCapacity:2];
	return registry;
}

+(void) registerVisualizerFactory:(id<KCVisualizerFactory>)factory withName:(NSString*)name
{
	[[KCVisualizer _registry] setObject:factory forKey:name];
}

+(id<KCVisualizer>) visualizerWithName:(NSString*)visualizerName
{
	return [[[KCVisualizer _registry] objectForKey:visualizerName] constructVisualizer];
}

+(NSArray*) availableVisualizerFactories
{
	return [[KCVisualizer _registry] allValues];
}

-(NSView*) preferencesView
{
	return preferencesView;
}

-(NSString*) visualizerName
{
	[self doesNotRecognizeSelector:_cmd];
	return nil;
}

-(void) showVisualizer:(id)sender
{
    [self doesNotRecognizeSelector:_cmd];
}

-(void) hideVisualizer:(id)sender
{
    [self doesNotRecognizeSelector:_cmd];
}

-(void) deactivateVisualizer:(id)sender
{
    [self doesNotRecognizeSelector:_cmd];
}

- (void)noteKeyEvent:(KCKeycastrEvent *)event
{
    [self doesNotRecognizeSelector:_cmd];
}

- (void)noteFlagsChanged:(NSEventModifierFlags)flags
{
    /**
     NSEventModifierFlagCapsLock           = 1 << 16, // Set if Caps Lock key is pressed.
     NSEventModifierFlagShift              = 1 << 17, // Set if Shift key is pressed.
     NSEventModifierFlagControl            = 1 << 18, // Set if Control key is pressed.
     NSEventModifierFlagOption             = 1 << 19, // Set if Option or Alternate key is pressed.
     NSEventModifierFlagCommand 
     */
	// Default implementation does nothing.

}

- (void)noteMouseEvent:(KCMouseEvent *)mouseEvent
{
    [self doesNotRecognizeSelector:_cmd];
}

@end

@implementation KCVisualizerFactory

-(NSString*) visualizerNibName
{
    [self doesNotRecognizeSelector:_cmd];
    return nil;
}

-(Class) visualizerClass
{
    [self doesNotRecognizeSelector:_cmd];
	return nil;
}

-(id<KCVisualizer>) constructVisualizer
{
	Class c = [self visualizerClass];
	id<KCVisualizer> v = [[[c alloc] init] autorelease];
	NSNib* nib = [[[NSNib alloc] initWithNibNamed:[self visualizerNibName] bundle:[NSBundle bundleForClass:[self class]]] autorelease];
	if (![nib instantiateWithOwner:v topLevelObjects:nil])
		return nil;
	return v;
}

-(NSString*) visualizerName
{
	[self doesNotRecognizeSelector:_cmd];
	return nil;
}

@end
