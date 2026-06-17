import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sample_chat/component/custom_text_field/custom_text_field.dart';
import 'package:toastification/toastification.dart';
import '../../component/app_color.dart';
import '../../component/custom_button/custom_button.dart';
import '../../component/custom_text/custom_text.dart';
import '../../component/custom_text_field/custom_phone_text_field.dart';
import '../../core/constant/stirng.dart';
import '../../core/utils/logger.dart';
import '../otp/otp_screen.dart';
class LoginScreen extends StatelessWidget{
  final _formKey = GlobalKey<FormState>();
  final Uri _appUrl = Uri.parse('https://policies.google.com/terms?hl=en');
  TextEditingController email = TextEditingController();
  TextEditingController username = TextEditingController();
  LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
   // final loginprovider = Provider.of<LoginProvider>(context, listen: false);
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, dynamic) async{
        mShowAlertBox(context);
      },
      child: Scaffold(backgroundColor: mPrimaryColor,
        body: Center(
            child: Form(
              key: _formKey,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(top: 32,height: 100,width: 110, child: SvgPicture.asset(loginImageOne),),
                  Positioned(top: 50,left: 18,height: 42,width: 42, child: GestureDetector(
                    child: SvgPicture.asset(loginImageTwo),
                    onTap: (){
                      mShowAlertBox(context);
                    },
                  ),),
                  Positioned(left:50, right: 100,top: 210, child: SvgPicture.asset(loginImageThree)),
                  Positioned(left:MediaQuery.of(context).size.width - 100, top: 180, child: SvgPicture.asset(loginImageFour)),
                  Positioned(left:81, bottom:MediaQuery.of(context).size.height * 0.4,height: 100,width: 110, child: SvgPicture.asset(loginImageFive),),
                  Positioned(bottom:0,left:0, right: 0, child: Container(padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(color: Colors.white,
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(25), topRight: Radius.circular(25))
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 20,),
                        CustomText.bodyBold(loginTextOne, Colors.black),
                        SizedBox(height: 20,),
                        SizedBox(height: 70,child: CustomFormField('Enter your Name',true,false,false,false,username),),
                        SizedBox(height: 20,),
                        SizedBox(height: 70,child: CustomFormField('Enter your email',false,true,false,false,email),),
                        SizedBox(height: MediaQuery.of(context).size.height * 0.05,),
                        CustomButton(busy:false, disabled: false,title: loginButtonOne,onTap:()async{

                          if(_formKey.currentState!.validate()){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => OtpScreen(email.text.toString(),'123456')));
                            final loginResponse = true;//await loginprovider.execute(mobileno.text, 'authentication');
                            if(loginResponse){
                              Log.i('LoginScreen :: Login Successfully!');
                              if (!context.mounted) return;

                             // Navigator.push(context, MaterialPageRoute(builder: (context) => OtpScreen(mobileno.text.toString(), loginprovider.loginResponse.otp_code)));
                            }else{
                              Log.i('LoginScreen :: Login Failed!');
                              if (!context.mounted) return;
                             // Navigator.push(context, MaterialPageRoute(builder: (context) => OtpScreen(mobileno.text.toString(),'123456')));
                            }
                          }else{
                         //   Navigator.push(context, MaterialPageRoute(builder: (context) => OtpScreen(email.text.toString(),'123456')));
                            toastification.show(
                              type: ToastificationType.error,
                              alignment: Alignment.bottomCenter,
                              context: context, // optional if you use ToastificationWrapper
                              title: Text('Please,fill all details!'),
                              autoCloseDuration: const Duration(seconds: 5),
                            );
                          }

                        },),
                        SizedBox(height: 20,),
                        Align(
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomText.caption(loginTextTow, Colors.grey[600]!),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    child:  Text(loginTextThree,style: GoogleFonts.poppins(
                                        fontSize: 11,
                                        color: Colors.green,
                                        fontWeight: FontWeight.w300,
                                        decoration:  TextDecoration.underline,
                                        decorationColor: Colors.green
                                    ),),
                                    onTap: () async{
                                      await _launchUrl();
                                    },
                                  ),
                                  SizedBox(width: 4,),
                                  CustomText.caption(loginTextFour, Colors.grey[600]!),
                                  SizedBox(width: 4,),
                                  GestureDetector(
                                    child:  Text(loginTextFive,style: GoogleFonts.poppins(
                                        fontSize: 11,
                                        color: Colors.green,
                                        fontWeight: FontWeight.w300,
                                        decoration:  TextDecoration.underline,
                                        decorationColor: Colors.green
                                    ),),
                                    onTap: () async{
                                      await _launchUrl();
                                    },
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 10,),
                        SizedBox(height: MediaQuery.of(context).viewPadding.bottom),
                      ],
                    ),
                  )),
                ],
              ),
            )
        ),
        /* bottomNavigationBar:Padding(padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            height: 300,
            decoration: BoxDecoration(color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(25), topRight: Radius.circular(25))
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20,),
                CustomText.bodyBold(loginTextOne, Colors.black),
                SizedBox(height: 20,),
                SizedBox(height: 50,child: CustomPhoneFormField('Enter 10 digit mobile number',mobileno),),
                SizedBox(height: MediaQuery.of(context).size.height * 0.05,),
                CustomButton(busy:loginprovider.isLoading, disabled: loginprovider.isLoading,title: loginButtonOne,onTap:()async{

                  if(_formKey.currentState!.validate()){
                    final loginResponse = await loginprovider.execute(mobileno.text, 'authentication');
                    if(loginResponse){
                      Log.i('LoginScreen :: Login Successfully!');
                      if (!context.mounted) return;
                      Navigator.push(context, MaterialPageRoute(builder: (context) => OtpScreen(mobileno.text.toString(), loginprovider.loginResponse.otp_code)));
                    }else{
                      Log.i('LoginScreen :: Login Failed!');
                      if (!context.mounted) return;
                      Fluttertoast.showToast(
                        msg: "Server Error!",
                        toastLength: Toast.LENGTH_SHORT, // Duration of the toast
                        gravity: ToastGravity.BOTTOM, // Position of the toast
                        timeInSecForIosWeb: 1, // Duration for iOS and web
                        backgroundColor: Colors.black54, // Background color
                        textColor: Colors.white, // Text color
                        fontSize: 16.0, // Font size
                      );
                    }
                  }else{
                    Fluttertoast.showToast(
                      msg: "Invalid Phone Number",
                      toastLength: Toast.LENGTH_SHORT, // Duration of the toast
                      gravity: ToastGravity.BOTTOM, // Position of the toast
                      timeInSecForIosWeb: 1, // Duration for iOS and web
                      backgroundColor: Colors.black54, // Background color
                      textColor: Colors.white, // Text color
                      fontSize: 16.0, // Font size
                    );
                  }

                },),
                SizedBox(height: 20,),
                Align(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText.caption(loginTextTow, Colors.grey[600]!),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            child:  Text(loginTextThree,style: GoogleFonts.poppins(
                                fontSize: 11,
                                color: Colors.green,
                                fontWeight: FontWeight.w300,
                                decoration:  TextDecoration.underline,
                                decorationColor: Colors.green
                            ),),
                            onTap: () async{
                              await _launchUrl();
                            },
                          ),
                          SizedBox(width: 4,),
                          CustomText.caption(loginTextFour, Colors.grey[600]!),
                          SizedBox(width: 4,),
                          GestureDetector(
                            child:  Text(loginTextFive,style: GoogleFonts.poppins(
                                fontSize: 11,
                                color: Colors.green,
                                fontWeight: FontWeight.w300,
                                decoration:  TextDecoration.underline,
                                decorationColor: Colors.green
                            ),),
                            onTap: () async{
                              await _launchUrl();
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).viewPadding.bottom),
              ],
            ),
          ),

        )*/
      ),
    );
  }
  Future<void> _launchUrl() async {
  /*  if (!await launchUrl(_appUrl)) {
      throw Exception('Could not launch $_appUrl');
    }*/
  }
  Future mShowAlertBox(BuildContext context){
    return showDialog(context: context, builder: (context)=>AlertDialog(
      actions: [
        SizedBox(
          child:Column(
            children: [
              SizedBox(height: 20,),
              // Icon(Icons.location_pin,color: Colors.red,),
              SizedBox(height: 10,),
              Text("Do you really want to exit this screen?"),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(onPressed: () => SystemNavigator.pop(), child: Text('Yes')),
                  SizedBox(width: 10,),
                  ElevatedButton(onPressed: () => Navigator.of(context).pop(false), child: Text('No'))

                ],
              )
            ],
          ),
        )
      ],
    ));
  }
}