// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
class TextFeild1 extends StatelessWidget
{
  //const TextFeild({super.key});
   final  TextEditingController controller;
  final String hintText;
  final   bool IsobscureText;
  final TextInputType inputType;
  final IconData icon;
     const TextFeild1({
    super.key,
     required this.controller,
    required this.hintText,
   required this.IsobscureText,
    this.inputType=TextInputType.text,
    required this.icon, required validator,
});
  @override
  Widget build(BuildContext context)
  {
    return  Container(
             
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextFormField(
                controller: controller,
                obscureText: IsobscureText,
                keyboardType: inputType,
                validator:(val){
                  if(val==null || val.isEmpty)
                  {
                    return "Please enter $hintText";
                  }
                  return null;
                },
            
                onSaved:(val)=>controller.text=val.toString(),
                
                
               
                decoration: InputDecoration(
                  enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  prefixIcon: Icon(icon),
                  focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  fillColor: Colors.grey.shade200,
                  filled: true,
                  hintText: hintText,
                ),
              ),
            );
  }
}