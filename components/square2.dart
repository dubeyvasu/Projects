import 'package:flutter/material.dart';

 class  Square2 extends StatelessWidget {
  final String imagePath;
  const Square2({super.key,required this.imagePath,});
  @override
  Widget build(BuildContext context)
  {
return Container(
  padding: const EdgeInsets.all(8),
  margin: const EdgeInsets.symmetric(horizontal: 10),
  decoration: BoxDecoration(
    border: Border.all(color: Colors.white),
  borderRadius: BorderRadius.circular(16),
  color: Colors.white,
  ),
  child: Image.asset(
    imagePath,
   height: 72,),
    //height: 72,
  
);
  }
 }