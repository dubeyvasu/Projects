import 'package:flutter/material.dart';

 class  Square3 extends StatelessWidget {
  final String imagePath;
  const Square3({super.key,required this.imagePath, });
  @override
  Widget build(BuildContext context)
  {
return Container(
  padding: const EdgeInsets.all(7),
  decoration: BoxDecoration(
    border: Border.all(color: Colors.grey),
  borderRadius: BorderRadius.circular(20),
  color: Colors.white,
  ),
  child: Image.asset(
    imagePath,
   height: 250,),
    //height: 72,
  
);
  }
 }