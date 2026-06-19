import '../../features/home/data/model/ChatModel.dart';
/*Splash Screen*/

//String
const String splashTextOne = 'Let Strat the Chat ';
const String splashTextTwo = 'from the inside.';
const String splashTextThree = 'The one stop solution to all your';
const String splashTextFour = 'health queries';
const String splashButtonOne = 'Lets go!';
//Variable
//Image
const String splashImageOne = 'assets/splash/ellipse_11.svg';
const String splashImageTwo = 'assets/splash/ellipse_10.svg';
const String splashImageThree = 'assets/splash/chat_icon.svg';
const String splashImageFour = 'assets/splash/vector_195.svg';
const String splashImageFive = 'assets/splash/vector_194.svg';
/*Login Screen */
//Image
const String loginImageOne = 'assets/login/group_85.svg';
const String loginImageTwo = 'assets/login/group_172.svg';
const String loginImageThree = 'assets/splash/chat_icon.svg';
const String loginImageFour = 'assets/login/group_83.svg';
const String loginImageFive = 'assets/login/group_86.svg';
//Text
const String loginTextOne = 'Sign in to Continue';
const String loginButtonOne = 'Continue';
const String loginTextTow = 'By Signing in you agree to our ';
const String loginTextThree = 'Terms & conditions';
const String loginTextFour = 'and';
const String loginTextFive = 'Privacy policy';
/*Otp Screen*/
//Image
const String otpImageOne = 'assets/login/group_172.svg';
//Text
const String otpTextOne = 'Verify Email Address';
const String otpTextTwo = 'A 6 digit code has been sent to:';
const String otpTextThree = 'Edit Email Address';
const String otpTextFour = 'Enter the verification code here!';
const String otpTextFive = 'Resend in';
const String otpTextSix = 'Resend OTP';
const String otpTextSeven = 'Verify';
const String otpTextEight = 'Change';

/* Profile Screen */
//Text
const String profileTextOne = 'Enter Name';
const String profileTextTwo = 'Enter Name';
const String profileTextThree = 'DOB';
const String profileTextFour = 'Gender';
const String profileTextFive = 'Email';
const String profileTextSix = 'Continue';

/* Google Map */
//Text
/* New Address */
//Text
/* DashBoard */
//Text
/* Home */
//Text
List<ChatModel> chatmodels = [
  ChatModel(
    name: "Dev Stack",
    isGroup: false,
    currentMessage: "Hi Everyone",
    time: "4:00",
    icon: "person.svg",
    id: 1,
  ),
  ChatModel(
    name: "Kishor",
    isGroup: false,
    currentMessage: "Hi Kishor",
    time: "13:00",
    icon: "person.svg",
    id: 2,
  ),

  ChatModel(
    name: "Collins",
    isGroup: false,
    currentMessage: "Hi Dev Stack",
    time: "8:00",
    icon: "person.svg",
    id: 3,
  ),

  ChatModel(
    name: "Balram Rathore",
    isGroup: false,
    currentMessage: "Hi Dev Stack",
    time: "2:00",
    icon: "person.svg",
    id: 4,
  ),
];
