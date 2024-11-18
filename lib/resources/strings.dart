class AppStrings {
  static final AppStrings _appStrings = AppStrings._internal();
  factory AppStrings() {
    return _appStrings;
  }
  AppStrings._internal();

  String get email => 'Email';

  String get emailHint => 'john12doe@gmail.com';
  String get alert => 'Alert';
  String get yourAuthExpired =>
      'Your authentication has expired please login again';
  String get weUnable =>
      'We\'re unable to process your request.\nPlease try again.';
  String get retry => 'Retry';
  String get weUnableCheckData => 'We Unable to Check your Data';
  String get login => 'Login';
  String get ok => 'Ok';
  String get getOTP => 'GET OTP';
  String get welcomeBack => 'Welcome back, you\'ve been missed!';
  String get password => 'Password';
  String get username => 'Username';
  String get letsSignIn => 'Lets sign you in';
  String get usernameOrEmail => 'Email or Phone';
  String get signIn => 'SIGN IN';
  String get signUp => 'Sign Up';
  String get or => 'Or';
  String get phoneVerification => "Phone Verification";
  String get alreadyAccount => 'Already have a account?';
  String get dontHaveAccount => 'Don\'t have a account?';
  String get editNumber => "Edit Phone Number ?";
  String get singingPrivacyPolicy =>
      'By Registering with us or signing up  you are agree to our privacy policy and term and condition';
  String get privacyPolicy =>
      'By Signing in you are agree to our privacy policy and term and condition';
  String get register => 'register';
  String get createAccount => 'Create your account';
  String get afterComplete => 'After your registration is complete';
  String get opportunity => 'you can see our opportunity products.';

  String get reSend => 'Resend';
  String get reSendCode => 'Resend OTP in';
  String get forget => 'Forget Password';
}

AppStrings appStrings = AppStrings();
