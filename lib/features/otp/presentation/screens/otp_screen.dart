import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sample_chat/features/home/Homescreen.dart';
import 'package:sms_autofill/sms_autofill.dart';

import '../../../../component/custom_button/custom_button.dart';
import '../../../../component/custom_text/custom_text.dart';
import '../../../../component/custom_text_field/custom_text_field.dart';
import '../../../../core/constant/color.dart';
import '../../../../core/constant/stirng.dart';
import '../../../login/presentation/screens/login_screen.dart';

class OtpScreen extends StatelessWidget {
  String phonenumber;
  String? userotpcode;
  bool enable = false;
  TextEditingController txteditcntotpno = TextEditingController();

  OtpScreen(this.phonenumber, this.userotpcode, {super.key});

  @override
  Widget build(BuildContext context) {
    // final otpcode =  Provider.of<OtpProvider>(context, listen: false);
    if (context.mounted) {
      Future.delayed(Duration(seconds: 2), () {
        // otpcode.start();
      });
    }
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: SizedBox(
          child: GestureDetector(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: SvgPicture.asset(otpImageOne),
            ),
            onTap: () {
              Navigator.pop(context);
            },
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
                      CustomText.captionTwo('$phonenumber', Colors.black),
                    ],
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    child: Image.asset('assets/otp/options_1.png'),
                  ),
                ),
              ],
            ),
            GestureDetector(
              child: Text(
                otpTextThree,
                style: GoogleFonts.poppins(
                  fontSize: 11,
                  color: Colors.green,
                  fontWeight: FontWeight.w300,
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.green,
                ),
              ),
              onTap: () {
                enable = true;
                //   otpcode.remainingSeconds = 0;
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
            ),
            SizedBox(height: 20),
            CustomText.captionOne(
              'Enter the verification code: $userotpcode here!',
              Colors.black,
            ),
            SizedBox(height: 10),
            Center(
              child: PinFieldAutoFill(
                codeLength: 6,
                onCodeChanged: (c) {
                  if (c!.isNotEmpty) {
                    // otpcode.update(c);
                  }
                },
                autoFocus: true,
                decoration: BoxLooseDecoration(
                  strokeColorBuilder: PinListenColorBuilder(
                    Colors.blueGrey,
                    Colors.grey,
                  ), //after/before
                  bgColorBuilder: PinListenColorBuilder(
                    Colors.white,
                    Colors.white54,
                  ),
                ),
              ),
            ),
            SizedBox(height: 5),
            /*   Consumer<OtpProvider>(builder: (_,timer,_){
                  return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('$otpTextFive ${timer.remainingSeconds}s'),
                        timer.resendStatus ? TextButton(onPressed: (){
                          timer.resend();
                        }, child: Text(otpTextSix,style: TextStyle(
                          color: Colors.green,
                          decoration: TextDecoration.underline,
                          decorationThickness: 1, decorationColor: Colors.green
                        ),)): Text(''),
                      ]);
                }),*/
            SizedBox(height: 10),
            CustomButton(
              disabled: false,
              busy: false,
              title: otpTextSeven,
              onTap: () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
                //context.push('/addprofile');
                /*  if(otpcode.remainingSeconds>0){
                     if(otpcode.smsCode == userotpcode){
                      String otpResponse = await otpcode.execute(phonenumber,userotpcode!, 'authentication');
                         if(otpResponse=='landing'){
                           if(!context.mounted) return;
                          // Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>AddProfileScreen(mboileno: phonenumber,)));
                          //  Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>DashboardScreen()));
                         }else{
                           if(!context.mounted) return;

                          // Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>AddProfileScreen(mboileno: phonenumber,)));
                         }
                     }else{
                       */ /*Fluttertoast.showToast(
                         msg: "Please enter valid otp!",
                         toastLength: Toast.LENGTH_SHORT, // Duration of the toast
                         gravity: ToastGravity.BOTTOM, // Position of the toast
                         timeInSecForIosWeb: 1, // Duration for iOS and web
                         backgroundColor: Colors.black54, // Background color
                         textColor: Colors.white, // Text color
                         fontSize: 16.0, // Font size
                       );*/ /*
                     }
                  }else{
                    */ /*Fluttertoast.showToast(
                      msg: "Please enter the otp!",
                      toastLength: Toast.LENGTH_SHORT, // Duration of the toast
                      gravity: ToastGravity.BOTTOM, // Position of the toast
                      timeInSecForIosWeb: 1, // Duration for iOS and web
                      backgroundColor: Colors.black54, // Background color
                      textColor: Colors.white, // Text color
                      fontSize: 16.0, // Font size
                    );*/ /*
                  }*/
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: enable
          ? Container(
              height: 170,
              margin: EdgeInsets.symmetric(horizontal: 4.0),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: SecondaryColor,
                    blurRadius: 5,
                    spreadRadius: 5,
                  ),
                ],
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(25),
                  topLeft: Radius.circular(25),
                ),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  SizedBox(height: 20),
                  CustomFormField(
                    'Phone Number',
                    false,
                    false,
                    false,
                    true,
                    txteditcntotpno,
                  ),
                  SizedBox(height: 20),
                  CustomButton(title: otpTextEight),
                ],
              ),
            )
          : SizedBox(),
    );
  }
}
