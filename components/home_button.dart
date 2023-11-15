import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

    Widget HomeButton({width,height , icon, String? title})
    {
    return Column(
        children: [
          Image.asset(icon,width: 100,),
          
          10.heightBox,
         // title!.text.make()
         Text(title!,style: TextStyle(
          color: Colors.amber[900],
          fontWeight: FontWeight.bold
         ),
         
         ),
         
          //onPressed()
          
        ],

    ).box.rounded.white.size(width,height).shadowSm.make();
  }
