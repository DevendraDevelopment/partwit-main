class Constant {
  static String baseUrl = "";
  static String imageURL = "";
  static const USER_ID = 'userID';




  static const USER_EMAIL = 'Email Address';
  static const USER_PASSWORD = 'Password';
  static const RE_ENTER_PASSWORD = 'Re-enter Password';
  static const FACE_ID = 'Use Face ID';
  static const FORGOT_PASSWORD = 'Forgot Password?';
  static const USER_LOGIN = 'Login';


 static const LOCATION_TEXT='Location';
 static const ALLOW_TEXT1='Allow \'PartWit\' to access this ';
 static const ALLOW_TEXT2='device\'s location?';
 static const ALWAYS='Always';
 static const WHILE_USING_APP='While using the app';
 static const NEVER='Never';

 static const ENTER_SOCIAL_MEDIA='Enter via social media';

 static const ALREADY_AN_ACC='Already have an account?';
 static const SIGNIN_HERE='Sign In here';

  static const SIGNUP = 'Sign Up';
  static const AGREE = ' I agree with';
  static const TERMS = 'Terms & Condition';
  static const AND = 'and';
  static const POLICY = 'Privacy Policy';

  static const CONFIRM_PSW = 'Confirm Password';
  static const REGISTER = 'Register';
  static const RESETNEWPASSWORD = 'Set New Password';
  static const RESETNEWPASS = 'Set the new password for your account so you can login and access all the features';

  static const VERIFICATION = 'Verification';
  static const ENTER_VERIFICATION = 'Please enter the verification code';
  static const SEND_VERIFICATION = 'send to albert.red@gamil.com';
  static const SUBMIT = 'Submit';

  static const DONT_RECEIVE = 'Did\'t receive a text?';
  static const RESEND_CODE = 'Resend Code';

  static const CREATE_PROFILE = 'Create Profile';
  static const UPLOAD_PROFILE = 'Upload Profile Photo';
  static const YOUR_NAME = 'Your Name';
  static const CONTINUE = 'Continue';


  static const WELCOME = 'Welcome to PartWit!';
  static const LOREM = 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.'
      ' Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.';

  static const FORGOT_PSW = 'Forgot Password';
  static const EMAIL_TEXT = 'Please enter email address associated';
  static const EMAIL_TEXT1 = 'with your account';
  static const DONT_HAVE = 'Don\'t have an account?';
  static const SIGNUP_HERE = 'Sign up here';

  static const PASS_VALUE = 'forgot_Screen';
  static const REGISTRATION_OTP = 'registration_otp';
  static const FORGET_PASSWORD = 'forget_password';


  static const USER_NAME = 'userName';
  static const USER_LOGIN_STATUS = 'userLoginStatus';
  static const USER_PROFILE_PIC_URL = "userProfilePicURL";
  static const USER_INFO = "userInfo";
  static const JWT = "jwt";
  static const USER_RATING = "userRating";
  static const SUBSCRIPTION = "subscription";
  static const double padding = 20;
  static const double avatarRadius = 45;
  static const ADS_IMAGE_URL = "";
  static const RECENT_CASIONS = "recentCasions";
  static const USER_PROFILE_PIC_VERSION = "userProfilePicVersion";
  static const USER_PROFILE_PIC_ID = "userProfilePicID";
  static const USER_LANG = "userLang";
  bool isEmail(String em) {
   String p =
       r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

   RegExp regExp = new RegExp(p);

   return regExp.hasMatch(em);
  }
  static const String googleMapDark =
      '[{"elementType":"geometry","stylers":[{"color":"#242f3e"}]},{"elementType":"labels.text.fill","stylers":[{"color":"#746855"}]},{"elementType":"labels.text.stroke","stylers":[{"color":"#242f3e"}]},{"featureType":"administrative.locality","elementType":"labels.text.fill","stylers":[{"color":"#d59563"}]},{"featureType":"poi","elementType":"labels.text.fill","stylers":[{"color":"#d59563"}]},{"featureType":"poi.park","elementType":"geometry","stylers":[{"color":"#263c3f"}]},{"featureType":"poi.park","elementType":"labels.text.fill","stylers":[{"color":"#6b9a76"}]},{"featureType":"road","elementType":"geometry","stylers":[{"color":"#38414e"}]},{"featureType":"road","elementType":"geometry.stroke","stylers":[{"color":"#212a37"}]},{"featureType":"road","elementType":"labels.text.fill","stylers":[{"color":"#9ca5b3"}]},{"featureType":"road.highway","elementType":"geometry","stylers":[{"color":"#746855"}]},{"featureType":"road.highway","elementType":"geometry.stroke","stylers":[{"color":"#1f2835"}]},{"featureType":"road.highway","elementType":"labels.text.fill","stylers":[{"color":"#f3d19c"}]},{"featureType":"transit","elementType":"geometry","stylers":[{"color":"#2f3948"}]},{"featureType":"transit.station","elementType":"labels.text.fill","stylers":[{"color":"#d59563"}]},{"featureType":"water","elementType":"geometry","stylers":[{"color":"#17263c"}]},{"featureType":"water","elementType":"labels.text.fill","stylers":[{"color":"#515c6d"}]},{"featureType":"water","elementType":"labels.text.stroke","stylers":[{"color":"#17263c"}]}]';
}
