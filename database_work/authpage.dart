import 'package:flutter/material.dart';
import 'package:flutter_application_1/app_screen/login.dart';
import 'package:flutter_application_1/app_screen/register.dart';


class Authpage extends StatefulWidget
{
  const Authpage({super.key});
 @override
State<Authpage> createState()=>_Authpage();
}
 class _Authpage extends State<Authpage>
 {
  bool showLoginPage=true;
  
   @override
   Widget build(BuildContext context)
   {
    if(showLoginPage)
    {
      // ignore: prefer_const_constructors
      return LoginPage1();
    }
    else{
      return RegPage1();
    }
   }

 }
  
