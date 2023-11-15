
// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/app_screen/login.dart';
import 'package:flutter_application_1/components/my_textfeild1.dart';


class ForgotPasswordPage extends StatefulWidget {

  const ForgotPasswordPage({super.key,});
  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPage();
}

class _ForgotPasswordPage extends State<ForgotPasswordPage> 
{
  final usernameController = TextEditingController();
   Future forgot() async
  {
   try
   {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: usernameController.text.trim());
    return showDialog( builder: (context)=>const AlertDialog(content: Text(" Reset link sent! Check your email"),), context: context);

   }
   on FirebaseAuthException catch(e)
   {
     showDialog( context: context,
     builder: (context)
     {
      return AlertDialog(
        content: Text(e.message.toString()),
      );
     });
   }
  }
  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.lock,size: 100,),
              //const Square2(imagePath: 'lib/images/onenew.jpeg'),

            const SizedBox(
              height: 20,
            ),
             Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Text(
                "Enter your email to recieve the password reset link",textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.grey[700],
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFeild1(
             
                controller: usernameController,
                hintText: "Email",
                IsobscureText: false,
                icon: Icons.person,validator: null,),
            
                 const SizedBox(
              height: 10,
            ),
             
               Container(
              padding: const EdgeInsets.all(10.0),
              margin: const EdgeInsets.symmetric(horizontal: 25),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(16.0),
              ),
              //width: double.infinity,
              child: TextButton(
               
                
                onPressed:forgot,
                 child: const Text(
                  "Reset Password",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                
              ),
            ),
               const SizedBox(
              height: 10,
            ),
            
               Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Remember your Passwod ?",),
                  TextButton(child: const Text(
                    "Sign in now",
                    style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold
                    ),
                    ),
                    onPressed: (){
                        Navigator.pushAndRemoveUntil(
                          context, MaterialPageRoute(builder:(_)=>const LoginPage1()),
                    (Route<dynamic> route)=>false);
                    },
                    )
                ],
              ),
            
          ]
          ),
  
        ),
      ),
   );
  }
}