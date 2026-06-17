import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../component/custom_button/custom_button.dart';
import '../../component/custom_text/custom_text.dart';
import '../../core/constant/color.dart';
import '../../core/constant/stirng.dart';
import '../login/login_screen.dart';
class SplashScreen extends StatelessWidget{
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
  //  getVersion();
  //  getDeviceId();
    return Scaffold(
        backgroundColor: mPrimaryColor,
        body: Center(
          child:Stack(
            clipBehavior: Clip.antiAlias,
            children: [
              Positioned(bottom: MediaQuery.of(context).size.height * 0.5, child: SvgPicture.asset(splashImageOne,width: MediaQuery.of(context).size.width,)),
              Positioned(bottom: MediaQuery.of(context).size.height * 0.518, child: SvgPicture.asset(splashImageTwo,width: MediaQuery.of(context).size.width,)),
              Positioned(bottom: MediaQuery.of(context).size.height * 0.6,left:120,right:120,child: SvgPicture.asset(splashImageThree)),
              Positioned(left:50, right:50,bottom: MediaQuery.of(context).size.height * 0.38, child:Column(
                children: [CustomText.headingFour(splashTextOne,Colors.white), CustomText.headingFour(splashTextTwo,Colors.white),],
              )),
             /* Positioned(bottom: MediaQuery.of(context).size.height * 0.3, left:90,child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [CustomText.body(splashTextThree,Colors.white), CustomText.body(splashTextFour,Colors.white),],
              )),*/
              Positioned( bottom: MediaQuery.of(context).size.height * 0.2,left: 60,right: 60, child: CustomButton(title: splashButtonOne,onTap: (){
                Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>LoginScreen()));
              /*  if(PrefUtils().getLoginStatus() == 'true'){
                  Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>DashboardScreen()));
                }else{
                  Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>LoginScreen()));
                }*/
                // Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>LoginScreen()));
              },),),
              Positioned(bottom: 0,child: SvgPicture.asset(splashImageFour,width: MediaQuery.of(context).size.width,)),
              Positioned(bottom: 0,child: SvgPicture.asset(splashImageFive,width: MediaQuery.of(context).size.width,)),
            ],
          ),
        )
    );
  }
 /* Future getVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    final kVersion = packageInfo.version;
    Log.i('App Build Version : $kVersion');
  }*/
 /* Future<String?> getDeviceId() async {
    final deviceInfo = DeviceInfoPlugin();
    if (Platform.isIOS) {
      final iosInfo = await deviceInfo.iosInfo;
      return iosInfo.identifierForVendor; // may reset on reinstall
    } else if (Platform.isAndroid) {
      String? devicId = await AndroidId().getId();
      Log.i('App Device Id : $devicId');
     // PrefUtils().setDeviceId(devicId);
      return await const AndroidId().getId(); // scoped ANDROID_ID:contentReference[oaicite:3]{index=3}
    }
    return null;
  }*/
}