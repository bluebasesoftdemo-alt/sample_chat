import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextIntFormField extends StatelessWidget{
  final TextEditingController controller;
  final String title;
  const CustomTextIntFormField(this.title, this.controller, {super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: _userTextField(title!)
    );
  }
  Widget _userTextField(String title){
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
        focusedBorder: OutlineInputBorder( // Border when the field is focused
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: Colors.grey, // Different color when focused
            )),
        helperText: '',
        //prefixIcon: const Icon(Icons.location_on, color: Colors.green,),
        prefixText: ' ',
        // suffixText: 'USD',
        // suffixStyle: const TextStyle(color: Colors.green)
      ),
      validator: (value){
        if (value == null || value.isEmpty) {
          return 'Please enter the value!';
        }
        return null;
      },
    );
  }
}