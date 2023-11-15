import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/app_screen/homepage.dart';
import 'package:flutter_application_1/app_screen/login.dart';
//import 'package:flutter_application_1/components/square_splash.dart';
//import 'package:flutter_application_1/app_screen/main_page.dart';
//import 'package:get/get.dart';




class Splash extends StatefulWidget
{
  const Splash({super.key});
  //void initstate(){}
  @override
  // ignore: library_private_types_in_public_api
  _Splash createState()=>_Splash();
  
}
class _Splash extends State<Splash>
{
  @override
  
  void initState()
  {
    
    
    super.initState();
    
     Timer( const Duration(seconds: 2), () { 
      FirebaseAuth.instance.authStateChanges().listen((User? user) { 
        if(user==null && mounted)
        {
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=>const LoginPage1(),),);
        }
      else{

      
       Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=>const Homepage(),),);
      }
      
     });

  });
  }
  
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      backgroundColor: Colors.grey[55],
      body:  SafeArea(
        child:  Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
               Image.asset('lib/images/home_logo.jpeg',width: MediaQuery.of(context).size.width, fit: BoxFit.contain,),
             const SizedBox(
            height: 50,
            ),
           const Text("OWN a HOME" ,
           style: TextStyle(
            color: Color.fromARGB(255, 36, 146, 236),
            fontSize: 30,decoration: TextDecoration.underline,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.normal),),
            const SizedBox(
              height: 20,
            ),
            
            
            //Square3(imagePath: 'lib/images/home_logo.jpeg')
          ],
        ),
      ),
      
        ); 
  
}
  
    
  }
