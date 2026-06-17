import 'package:flutter/material.dart';
class CustomDobTextField extends StatelessWidget{
  final String mTitle;
  final TextEditingController dobController;
  final VoidCallback onClick;
  const CustomDobTextField(this.mTitle, this.dobController, this.onClick, {super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextFormField(
        controller: dobController,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
          hintText: mTitle,
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
          suffixIcon: const Icon(Icons.calendar_month, color: Colors.grey,),
          prefixText: ' ',
          // suffixText: 'USD',
          // suffixStyle: const TextStyle(color: Colors.green)
        ),
        validator: (value){
          if(value!.isEmpty){
            return 'Please enter the value!';
          }
          return null;
        },
        onTap: onClick,
      )
    );
  }
}