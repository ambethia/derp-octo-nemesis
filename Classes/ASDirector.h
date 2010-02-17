//
//  ASDirector.h
//  Aposelene
//
//  Created by Jason L Perry on 2/17/10.
//  Copyright 2010 Ambethia. All rights reserved.
//

#import "Aposelene.h"


@interface ASDirector : NSObject
{
  id <ASScene> scene;
  ASView* view;
}

+ (ASDirector*)instance;

+ (void)load:(NSString*)sceneClassName;

@property (nonatomic, retain) id <ASScene> scene;
@property (nonatomic, retain) ASView* view;

@end
