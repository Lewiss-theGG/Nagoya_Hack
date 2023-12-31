// clang-format off

/*
 * Firebase UI Bindings iOS Library
 *
 * Copyright © 2015 Firebase - All Rights Reserved
 * https://www.firebase.com
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *
 * 1. Redistributions of source code must retain the above copyright notice, this
 * list of conditions and the following disclaimer.
 *
 * 2. Redistributions in binaryform must reproduce the above copyright notice,
 * this list of conditions and the following disclaimer in the documentation
 * and/or other materials provided with the distribution.
 *
 * THIS SOFTWARE IS PROVIDED BY FIREBASE AS IS AND ANY EXPRESS OR
 * IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
 * MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO
 * EVENT SHALL FIREBASE BE LIABLE FOR ANY DIRECT,
 * INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
 * BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
 * LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
 * OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
 * ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

// clang-format on

#import "FirebaseLoginButton.h"

@implementation FirebaseLoginButton

- (instancetype)initWithProvider:(NSString *)provider {
  self = [super initWithFrame:CGRectZero];
  if (self) {
    self.provider = provider;
    [self setBackgroundColor:[self backgroundColorForProvider:provider]];
    [self setTitle:[self titleForProvider:provider] forState:UIControlStateNormal];
    [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
  }
  return self;
}

- (UIColor *)backgroundColorForProvider:(NSString *)provider {
  if ([provider isEqualToString:kGoogleAuthProvider]) {
    return [UIColor colorWithRed:221.0f / 255.0f
                           green:75.0f / 255.0f
                            blue:57.0f / 255.0f
                           alpha:255.0f / 255.0f];
  } else if ([provider isEqualToString:kFacebookAuthProvider]) {
    return [UIColor colorWithRed:59.0f / 255.0f
                           green:89.0f / 255.0f
                            blue:152.0f / 255.0f
                           alpha:255.0f / 255.0f];
  } else if ([provider isEqualToString:kTwitterAuthProvider]) {
    return [UIColor colorWithRed:0.0f / 255.0f
                           green:172.0f / 255.0f
                            blue:237.0f / 255.0f
                           alpha:255.0f / 255.0f];
  } else if ([provider isEqualToString:kPasswordAuthProvider]) {
    return [UIColor colorWithRed:22.0f / 255.0f
                           green:150.0f / 255.0f
                            blue:243.0f / 255.0f
                           alpha:255.0f / 255.0f];
  } else {
    return [UIColor blackColor];
  }
}

- (NSString *)titleForProvider:(NSString *)provider {
  if ([provider isEqualToString:kGoogleAuthProvider]) {
    return @"Google";
  } else if ([provider isEqualToString:kFacebookAuthProvider]) {
    return @"Facebook";
  } else if ([provider isEqualToString:kTwitterAuthProvider]) {
    return @"Twitter";
  } else if ([provider isEqualToString:kPasswordAuthProvider]) {
    return @"Login";
  } else {
    return @"Unknown Provider";
  }
}

@end
