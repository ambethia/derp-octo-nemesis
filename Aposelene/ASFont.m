//
//  ASFont.m
//  Aposelene
//
//  Created by Jason L Perry on 2/19/10.
//  Copyright 2010 Ambethia. All rights reserved.
//

#import <regex.h>

#import "ASFont.h"
#import "ASTexture.h"


@interface ASFont()

- (NSString*)extractPattern:(NSString*)pattern fromLine:(NSString*)line;

@property (nonatomic, retain) ASTexture* texture;

@end


@implementation ASFont

@synthesize texture;

- (id)initWithFontFileNamed:(NSString*)fontName;
{
  if (self = [super init])
  {
    NSString* fnt = [[NSBundle mainBundle] pathForResource:fontName ofType:@"fnt"];
    NSString* png = [[NSBundle mainBundle] pathForResource:fontName ofType:@"png"];
    NSString* contents = [NSString stringWithContentsOfFile:fnt encoding:NSASCIIStringEncoding error:nil];
    NSArray* lines = [[NSArray alloc] initWithArray:[contents componentsSeparatedByString:@"\n"]];

    texture = [[ASTexture alloc] initWithImagePath:png];

    characters = calloc(kMaxCharacters, sizeof(ASFontCharacter));

    colorFilter = ASColorMake(1.0f, 1.0f, 1.0f, 1.0f);

    for (NSString* line in lines)
    {
      if([line hasPrefix:@"char id"])
      {
        ASFontCharacter character;
        character.charID = [[self extractPattern:@"char id=([-0-9]+)" fromLine:line] intValue];
        character.frame = CGRectMake([[self extractPattern:@" x=([-0-9]+)" fromLine:line] intValue],
                                     [[self extractPattern:@" y=([-0-9]+)" fromLine:line] intValue],
                                     [[self extractPattern:@"width=([-0-9]+)" fromLine:line] intValue],
                                     [[self extractPattern:@"height=([-0-9]+)" fromLine:line] intValue]);
        character.offset = CGPointMake([[self extractPattern:@"xoffset=([-0-9]+)" fromLine:line] intValue],
                                       [[self extractPattern:@"yoffset=([-0-9]+)" fromLine:line] intValue]);
        character.advance = [[self extractPattern:@"xadvance=([-0-9]+)" fromLine:line] intValue];
        characters[character.charID] = character;
      }
    }
    [lines release];
  }
  return self;
}

- (void)dealloc;
{
  if (characters)
    free(characters);

  [texture release];
  [super dealloc];
}

// TODO: Drawing the texture to OpenGL every character is not very efficient,
// but it's easy enough for now. Ideally we'd satisfy the vertices and texture
// coordinates before hand, then pass those whole arrays on to be rendered.
// TODO: Setting glColor4f will work here until we implement colors in ASTexture.
// We adjust the baseline (cursor.y) to accomodate for packing in the original graphic.
- (void)drawText:(NSString*)text atPoint:(CGPoint)point;
{
  unichar charID;
  ASFontCharacter character;
  CGPoint cursor = point;

	for (int i = 0; i < [text length]; i++)
  {
    charID = [text characterAtIndex:i];
    character = characters[charID];
    cursor.x += character.offset.x;
    cursor.y  = point.y - (character.offset.y + character.frame.size.height);
    glColor4f(colorFilter.red, colorFilter.green, colorFilter.blue, colorFilter.alpha);
    [texture drawAtPoint:cursor withRect:character.frame];
    glColor4f(1.0f, 1.0f, 1.0f, 1.0f);
    cursor.x += character.advance;
  }
}


- (NSString*)extractPattern:(NSString*)pattern fromLine:(NSString*)line;
{
  int begin, end, length, i, w=0;
  char *word = NULL;
  regex_t regex;
  regmatch_t match[2];
  regcomp(&regex, [pattern UTF8String], REG_EXTENDED);

  if ((regexec(&regex, [line UTF8String], 2, match, 0)) == 0)
  {
    begin  = (int)match[1].rm_so;
    end    = (int)match[1].rm_eo;
    length = end - begin;
    word   = malloc(length+1);
    for (i = begin; i < end; i++)
    {
      word[w] = [line UTF8String][i];
      w++;
    }
    word[w] = 0;
  }
  regfree(&regex);
  if (word)
    return [NSString stringWithCString:word encoding:NSUTF8StringEncoding];
  return @"";
}

- (void)setColorFilterRed:(float)red green:(float)green blue:(float)blue alpha:(float)alpha;
{
  colorFilter = ASColorMake(red, green, blue, alpha);
}

@end
