//
//  ASDirector.h
//  Aposelene
//
//  Created by Jason L Perry on 2/17/10.
//  Copyright 2010 Ambethia. All rights reserved.
//

#import "ASScene.h"

@class ASView;

@interface ASDirector : NSObject
{
  id <ASScene> scene;
  ASView* view;
  bool landscapeMode;
}

+ (ASDirector*)instance;
+ (ASView*)view;
+ (void)load:(NSString*)sceneClassName;

- (void)setupOpenGL;

@property (nonatomic, retain, readonly) id <ASScene> scene;
@property (nonatomic, assign) bool landscapeMode;

@end
