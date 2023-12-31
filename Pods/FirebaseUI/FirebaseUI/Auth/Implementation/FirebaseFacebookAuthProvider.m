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

#import "FirebaseFacebookAuthProvider.h"

@implementation FirebaseFacebookAuthProvider {
  FBSDKLoginManager *_loginManager;
}

- (instancetype)initWithRef:(Firebase *)ref authDelegate:(id<FirebaseAuthDelegate>)authDelegate {
  self = [super initWithRef:ref authDelegate:authDelegate];
  if (self) {
    self.provider = kFacebookAuthProvider;
    [self configureProvider];
  }
  return self;
}

- (void)configureProvider {
  NSString *facebookAppId = [[NSBundle mainBundle] objectForInfoDictionaryKey:kFacebookAppId];
  NSString *facebookDisplayName =
      [[NSBundle mainBundle] objectForInfoDictionaryKey:kFacebookDisplayName];

  if (!(facebookAppId && facebookDisplayName)) {
    [NSException raise:NSInternalInconsistencyException
                format:@"Please set FacebookAppID, FacebookDisplayName, and\nURL types > Url "
                       @"Schemes in `Supporting Files/Info.plist` according to "
                       @"https://developers.facebook.com/docs/ios/getting-started"];
  }

  _loginManager = [[FBSDKLoginManager alloc] init];
}

- (void)login {
  [_loginManager
      logInWithReadPermissions:@[ kFacebookEmailScope ]
            fromViewController:(UIViewController *)self.delegate
                       handler:^(FBSDKLoginManagerLoginResult *result, NSError *error) {

                         if (error) {
                           [self.delegate authProvider:self onProviderError:error];
                         } else if (result.isCancelled) {
                           // TODO: clean up this error
                           NSError *cancelError =
                               [NSError errorWithDomain:@"" code:-1 userInfo:@{}];
                           [self.delegate authProvider:self onProviderError:cancelError];
                         } else {
                           NSString *accessToken =
                               [[FBSDKAccessToken currentAccessToken] tokenString];

                           [self.ref authWithOAuthProvider:kFacebookAuthProvider
                                                     token:accessToken
                                       withCompletionBlock:^(NSError *error, FAuthData *authData) {
                                         if (error) {
                                           [self handleError:error];
                                         }
                                       }];
                         }
                       }];
}

- (void)logout {
  [_loginManager logOut];
  [super logout];
}

@end