import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomPhoneFormField extends StatelessWidget{
  final TextEditingController controller;
  final String title;
  const CustomPhoneFormField(this.title, this.controller, {super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 3),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border(
              top: BorderSide(color: Colors.grey),
              left: BorderSide(color: Colors.grey),
              right: BorderSide(color: Colors.grey),
              bottom: BorderSide(color: Colors.grey)
          )
      ),
      child: Row(
        children: [
            Text('  +91  ',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),),
            Padding(padding: EdgeInsets.only(top: 2,bottom: 2),child: VerticalDivider(width: 5,),),
            Expanded(child: Container(padding:EdgeInsets.symmetric(horizontal: 5),height: 50,color: Colors.white,child: _phoneTextField(title,controller))),
        ]
      )
    );
  }
  Widget _phoneTextField(String title, TextEditingController controller){
    return TextFormField(
      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
    //  keyboardType: TextInputType.phone,
      controller: controller,
    /*  inputFormatters: [
        LengthLimitingTextInputFormatter(10),
      ],*/
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
          return '';
        }
        // if (value == null || value.isEmpty) return 'Please enter mobile number';
        // if (!valid.hasMatch(value)) return 'Enter valid phone number';
        return null;
      },
    );
  }
}