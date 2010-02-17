//
//  ASDirector.h
//  Aposelene
//
//  Created by Jason L Perry on 2/17/10.
//  Copyright 2010 Ambethia. All rights reserved.
//

#import "ASViewDelegate.h"


@interface ASDirector : NSObject
{
  id <ASViewDelegate> scene;
}

+ (ASDirector*)instance;

- (void)load:(NSString*)sceneClassName;

@property (nonatomic, retain) id <ASViewDelegate> scene;

@end
