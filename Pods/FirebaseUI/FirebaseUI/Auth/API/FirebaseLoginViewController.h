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

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

#import <Firebase/Firebase.h>

#if LOCAL_BUILD
#import <GoogleSignIn/GoogleSignIn.h>
#else
#import <Google/SignIn.h>
#endif

#import "FirebaseAuthDelegate.h"
#import "FirebaseTwitterAuthProvider.h"
#import "FirebaseFacebookAuthProvider.h"
#import "FirebaseGoogleAuthProvider.h"
#import "FirebasePasswordAuthProvider.h"
#import "FirebaseLoginButton.h"

/**
 * FirebaseLoginViewController is a subclass of UIViewController that provides a
 * set of helper methods for Firebase authentication providers. FirebaseLoginViewController
 * also provides a premade UI which handles login and logout with arbitrary providers, as well as
 * error handling.
 * This also serves as a template for developers interested in developing custom login UI.
 */
@interface FirebaseLoginViewController
    : UIViewController<FirebaseAuthDelegate, TwitterAuthDelegate, GIDSignInUIDelegate>

/**
 * Container view for login activity which wraps the header text and cancel button.
 */
@property(weak, nonatomic) IBOutlet UIView *headerView;

/**
 * Header text, defaults to "Please Sign In"
 */
@property(weak, nonatomic) IBOutlet UILabel *headerText;

/**
 * Cancel button, defaults to Grey 500 material cancel image.
 */
@property(weak, nonatomic) IBOutlet UIButton *cancelButton;

/**
 * Container view for email and password textfields as well as the email/password login button.
 */
@property(weak, nonatomic) IBOutlet UIView *emailPasswordView;

/**
 * Email text field.
 */
@property(weak, nonatomic) IBOutlet UITextField *emailTextField;

/**
 * Password text field.
 */
@property(weak, nonatomic) IBOutlet UITextField *passwordTextField;

/**
 *Container for ------or------ line.
 */
@property(weak, nonatomic) IBOutlet UIView *separatorView;

/**
 * Container view for social provider login button.
 */
@property(weak, nonatomic) IBOutlet UIView *socialView;

/**
 * Container view for full login UI.
 */
@property(weak, nonatomic) IBOutlet UIView *loginView;

/**
 * Height constraint for social view.
 */
@property(weak, nonatomic) IBOutlet NSLayoutConstraint *socialHeightConstraint;

/**
 * Height constraint for login view view.
 */
@property(weak, nonatomic) IBOutlet NSLayoutConstraint *totalHeightConstraint;

/**
 * The Firebase database reference which to authenticate against.
 */
@property(strong, nonatomic) Firebase *ref;

/**
 * The provider object for Twitter Authentication. This object handles the
 * requests against the Twitter API and uses the response to authenticate
 * against the Firebase database.
 */
@property(strong, nonatomic) FirebaseTwitterAuthProvider *twitterAuthProvider;

/**
 * The provider object for Facebook Authentication. This object handles the
 * requests against the Facebook SDK and uses the response to authenticate
 * against the Firebase database.
 */
@property(strong, nonatomic) FirebaseFacebookAuthProvider *facebookAuthProvider;

/**
 * The provider object for Google Authentication. This object handles the
 * requests against the Google SDK and uses the response to authenticate
 * against the Firebase database.
 */
@property(strong, nonatomic) FirebaseGoogleAuthProvider *googleAuthProvider;

/**
 * The provider object for Email/Password Authentication. This object handles the
 * requests to the Firebase user authentication system to authenticate users to
 * the Firebase database.
 */
@property(strong, nonatomic) FirebasePasswordAuthProvider *passwordAuthProvider;

/**
 * Create an instance of FirebaseLoginViewController, which allows for easy authentication to
 * Firebase
 * via a number of identity providers such as Email/Password, Google, Facebook, and Twitter.
 * @param ref The Firebase reference to use for authentication
 * @return FirebaseLoginViewController
 */
- (instancetype)initWithRef:(Firebase *)ref;

/**
 * Enables a given identity provider and allows for login and logout actions against it.
 * @param provider A string representing the desired identity provider to log in with
 * @return FirebaseLoginViewController
 */
- (instancetype)enableProvider:(NSString *)provider;

/**
 * Logs the currently authenticated user out of both Firebase and the currently logged in identity
 * provider (if any).
 * @return void
 */
- (void)logout;

/**
 * Returns the currently authenticated user or nil if no user is authenticated.
 * @return FAuthData
 */
- (FAuthData *)currentUser;

@end
