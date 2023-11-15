import 'package:flutter/material.dart';

 class  Square extends StatelessWidget {
  final String imagePath;
  final Function()? onTap;
  const Square({super.key,required this.imagePath,required this.onTap});
  @override
  Widget build(BuildContext context)
  {
return GestureDetector(
  onTap: onTap,
  child: Container(
  
    padding: const EdgeInsets.all(2),
  
    decoration: BoxDecoration(
  
      border: Border.all(color: Colors.white),
  
    borderRadius: BorderRadius.circular(10),
  
    color: Colors.grey[200],
  
    ),
  
    child: Image.asset(
  
      imagePath,
  
     height: 30,),
  
      //height: 72,
  
    
  
  ),
);
  }
 }