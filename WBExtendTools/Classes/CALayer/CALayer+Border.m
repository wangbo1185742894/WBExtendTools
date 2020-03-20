//
//  CALayer+Border.m
//  WBExtendTools
//
//  Created by Azir on 2019/11/5.
//  Copyright © 2019 Azir. All rights reserved.
//

#import "CALayer+Border.h"

@implementation CALayer (Border)

- (void)setBorderUIColor:(UIColor *)color {
    self.borderColor = color.CGColor;
}

@end
