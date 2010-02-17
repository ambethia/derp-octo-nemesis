//
//  ASScene.h
//  Aposelene
//
//  Created by Jason L Perry on 2/17/10.
//  Copyright 2010 Ambethia. All rights reserved.
//

@class ASView;


@protocol ASScene <NSObject>

- (void)update:(float)delta;

- (void)draw:(ASView*)view;

- (void)setup:(ASView*)view;

- (void)touchesBegan:(NSSet*)touches withEvent:(UIEvent*)event inView:(ASView*)view;

- (void)touchesMoved:(NSSet*)touches withEvent:(UIEvent*)event inView:(ASView*)view;

- (void)touchesEnded:(NSSet*)touches withEvent:(UIEvent*)event inView:(ASView*)view;


@end
