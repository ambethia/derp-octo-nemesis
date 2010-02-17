//
//  ASViewDelegate.h
//  Aposelene
//
//  Created by Jason L Perry on 2/17/10.
//  Copyright 2010 Ambethia. All rights reserved.
//

@class ASView;

@protocol ASViewDelegate <NSObject>

- (void)update:(float)delta;
- (void)draw:(ASView*)view;
- (void)setup:(ASView*)view;

@end
