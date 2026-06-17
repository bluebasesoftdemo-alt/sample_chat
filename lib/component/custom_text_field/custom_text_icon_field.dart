
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class CustomIconFormField extends StatelessWidget{
  final TextEditingController controller;
  final String title;
  final bool user;
  const CustomIconFormField(this.title, this.user, this.controller, {super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: user ? _userTextField(title!,controller) : _phoneTextField(title,controller)
    );
  }
  Widget _userTextField(String title,TextEditingController controller){
    return TextFormField(
      controller: controller,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
          hintText: title,
          hintStyle: TextStyle(fontSize:13,color: Colors.grey),
          border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide:BorderSide(color: Colors.grey)
         ),
          suffixIcon: Icon(Icons.perm_contact_cal_rounded,color: Colors.black,size: 16,)
      ),
      validator: (value){
        if(value!.isEmpty){
          return 'Please Enter the Value!';
        }
        return null;
      },
    );
  }
  Widget _phoneTextField(String title, TextEditingController controller){
    return TextFormField(
      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
      keyboardType: TextInputType.phone,
      controller: controller,
      inputFormatters: [
        LengthLimitingTextInputFormatter(10),
      ],
      //keyboardType: TextInputType.numberWithOptions(signed: false,decimal: false),
      //inputFormatters: [new LengthLimitingTextInputFormatter(1),FilteringTextInputFormatter.digitsOnly],
      decoration: InputDecoration(
          hintText: title,
          hintStyle: TextStyle(fontSize:13,color: Colors.grey),
          border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        borderSide:BorderSide(color: Colors.grey)
    ),
          suffixIcon: IconButton(icon:Icon(Icons.dangerous_outlined,size: 16),onPressed: (){
            controller.clear();
          },)
      ),
      validator: (value){
        if(value!.isEmpty){
          return 'Please Enter value';
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