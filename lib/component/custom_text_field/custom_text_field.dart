import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomFormField extends StatelessWidget{
  final TextEditingController mController;
  final String mTitle;
  final bool mUser;
  final bool mEmail;
  final bool mPin;
  final bool mMobile;
  const CustomFormField(this.mTitle,this.mUser, this.mEmail, this.mPin, this.mMobile, this.mController, {super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: mUser ? _userTextField(mTitle) :
      mEmail ? _emailTextField(mTitle) :
      mPin ? _pinTextField(mTitle) :
      mMobile ? _phoneTextField(mTitle,mController) : null ,
    );
  }
  Widget _userTextField(String title){
    return TextFormField(
      controller: mController,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        hintText: title,
        hintStyle: TextStyle(fontSize:13,color: Colors.grey),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide:BorderSide(color: Colors.grey)
        ),
        focusedBorder: OutlineInputBorder( // Border when the field is focused
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
            color: Colors.grey, // Different color when focused
        )),
        helperText: '',
        //prefixIcon: const Icon(Icons.person, color: Colors.green,),
        //prefixText: ' ',
        // suffixText: 'USD',
        // suffixStyle: const TextStyle(color: Colors.green)
      ),
      validator: (value){
        if (value == null || value.isEmpty) {
          return 'Please enter the value!';
        }
        final RegExp nameRegExp = RegExp(r"^[a-zA-Z\s'-]+$");
        if (!nameRegExp.hasMatch(value)) {
          return 'Invalid characters in name';
        }
        return null;
      },
    );
  }
  Widget _emailTextField(String title){
    RegExp _emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    return TextFormField(
      controller: mController,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        hintText: title,
        hintStyle: TextStyle(fontSize:13,color: Colors.grey),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide:BorderSide(color: Colors.grey)
        ),
        focusedBorder: OutlineInputBorder( // Border when the field is focused
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: Colors.grey, // Different color when focused
            )),
        helperText: '',
       // prefixIcon: const Icon(Icons.email, color: Colors.green,),
        //prefixText: ' ',
        // suffixText: 'USD',
        // suffixStyle: const TextStyle(color: Colors.green)
      ),
      validator: (value){
        if(!_emailRegex.hasMatch(value!)) return 'Email address is not valid';
       /* if(value.endsWith('.')==true) return null;
        return 'Email must end with .';*/
        return null;
      },
    );
  }
  Widget _pinTextField(String title) {
    return TextFormField(
      controller: mController,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
          hintText: title,
          hintStyle: TextStyle(fontSize:13,color: Colors.grey),
          border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide:BorderSide(color: Colors.grey)
      ),
        focusedBorder: OutlineInputBorder( // Border when the field is focused
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: Colors.grey, // Different color when focused
            )),
      ),
      keyboardType: TextInputType.phone,
      inputFormatters: [
        LengthLimitingTextInputFormatter(6),
      ],
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter the value!';
        }
        if(value.length<6){
          return 'Please enter 6 Digit Pin ';
        }
        return null;
      },
    );
  }
  Widget _phoneTextField(String title, TextEditingController controller){
    return TextFormField(
      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: controller,
      keyboardType: TextInputType.numberWithOptions(signed: false,decimal: false),
      inputFormatters: [new LengthLimitingTextInputFormatter(10),FilteringTextInputFormatter.digitsOnly],
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(top: 0,left: 5),
          hintText: title,
          hintStyle: TextStyle(fontSize:13,color: Colors.grey),
          border: InputBorder.none
      ),
      validator: (value){
        if(value!.isEmpty){
          return '';
        }else if(value!.length!=10){
          return 'Please enter mobile number';
        }
        return null;
      },
    );
  }
  Widget _pwdTextField(String title) {
    return TextFormField(
      controller: mController,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
          hintText: title,
          hintStyle: TextStyle(fontSize:13,color: Colors.grey),
          border: InputBorder.none
      ),
      keyboardType: TextInputType.phone,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter the Value!';
        }
        return null;
      },
    );
  }
}