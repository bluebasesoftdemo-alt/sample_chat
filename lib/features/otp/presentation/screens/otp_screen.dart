import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:toastification/toastification.dart';

import '../../../../component/custom_button/custom_button.dart';
import '../../../../component/custom_text/custom_text.dart';
import '../../../../core/constant/color.dart';
import '../../../../core/constant/stirng.dart';
import '../../../../core/utils/constant.dart';
import '../../../../core/utils/logger.dart';
import '../../../home/presentation/screens/Homescreen.dart';
import '../../../login/presentation/screens/login_screen.dart';
import '../provider/otp_provider.dart';

class OtpScreen extends StatelessWidget {
  String email;

  OtpScreen(this.email, {super.key});

  @override
  Widget build(BuildContext context) {
    Constant.revokeState = false;
    final kOtpProvider = Provider.of<OtpProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: SizedBox(
          child: GestureDetector(child: Padding(padding: EdgeInsets.all(10), child: SvgPicture.asset(otpImageOne),),
            onTap: () {Navigator.pop(context);},
          ),
        ),
        backgroundColor: mPrimaryColor,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  flex: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText.headingFive('', Colors.black),
                      CustomText.headingFive(otpTextOne, Colors.black),
                      CustomText.captionOne(otpTextTwo, Colors.black),
                      CustomText.captionTwo('$email', Colors.black),
                    ],
                  ),
                ),
                Expanded(child: SizedBox(child: Image.asset('assets/otp/options_1.png'),),),
              ],
            ),
            GestureDetector(
              child: Text(otpTextThree, style: GoogleFonts.poppins(fontSize: 11, color: Colors.green, fontWeight: FontWeight.w300, decoration: TextDecoration.underline, decorationColor: Colors.green,),),
              onTap: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()),);
              },
            ),
            SizedBox(height: 20),
            CustomText.captionOne('Enter the verification code here!', Colors.black,),
            SizedBox(height: 10),
            Center(child: PinFieldAutoFill(codeLength: 6, onCodeChanged: (c) {
                  if (c!.isNotEmpty) {
                    kOtpProvider.update(c);
                  }
                },
                autoFocus: true,
                decoration: BoxLooseDecoration(strokeColorBuilder: PinListenColorBuilder(Colors.blueGrey, Colors.grey,), //after/before
                  bgColorBuilder: PinListenColorBuilder(Colors.white, Colors.white54,),
                ),
              ),
            ),
            SizedBox(height: 5),
            SizedBox(height: 10),
            CustomButton(disabled: false, busy: false, title: otpTextSeven,
              onTap: () async {
                bool otpResponse = await kOtpProvider.execute(email);
                if (otpResponse) {
                  if (!context.mounted) return;
                    Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen(user_email: email, user_id: kOtpProvider.otpResponse.user_id, user_token: kOtpProvider.otpResponse.token,),),);
                    Log.i('Passing Data :: HomeScreen : Details :: user_email: $email :: user_id : ${kOtpProvider.otpResponse.user_id} :: user_token: ${kOtpProvider.otpResponse.token}');
                } else {
                  toastification.show(type: ToastificationType.error, alignment: Alignment.bottomCenter, title: Text('InValid Otp!'), autoCloseDuration: const Duration(seconds: 5),);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
