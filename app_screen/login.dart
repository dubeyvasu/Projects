import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:flutter_application_1/database_work/auth_controller.dart';
import 'package:flutter_application_1/app_screen/forgotPassword.dart';
import 'package:flutter_application_1/app_screen/homepage.dart';
import 'package:flutter_application_1/components/my_textfeild1.dart';
import 'package:flutter_application_1/components/square2.dart';


import 'package:flutter_application_1/app_screen/register.dart';


import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import 'package:velocity_x/velocity_x.dart';

class LoginPage1 extends StatefulWidget {

  const LoginPage1({super.key,});
  @override
  State<LoginPage1> createState() => _LoginpageState1();
}

class _LoginpageState1 extends State<LoginPage1> {
  // _LoginpageState1({super.key});
  final formkey= GlobalKey<FormState>();
   static var  controller=Get.put(Authontroller());
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  @override
 void initState()
 {
  super.initState();
 }
 @override
  void dispose()
  {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }
  Future login() async
  {
    String uid=usernameController.text.trim();
    String Password=passwordController.text.trim();
    await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: uid,
    password: Password);
    // ignore: use_build_context_synchronously
    VxToast.show(context, msg: "");
    if(uid.isEmpty)
   {
    
     Fluttertoast.showToast(
        msg: "Please enter User ID",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize:16.0);
   }
    else if(Password.isEmpty)
   {
    Fluttertoast.showToast(
        msg: "Please enter Password",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize:16.0);
   }
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      body: SafeArea(
        child: Center(
          child: Column(children: [
            const SizedBox(
              height: 50,
            ),
            const Square2(imagePath: 'lib/images/homelogo.jpeg'),
            const SizedBox(
              height: 50,
            ),
            Text(
              "Welcome back",
              style: TextStyle(
                  color: Colors.lightGreen[800],
                  fontWeight: FontWeight.bold,
                  fontSize: 24),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFeild1(
             
                controller: usernameController,
                hintText: "Email ID",
                IsobscureText: false,
                icon: Icons.person,validator: null,),
            const SizedBox(
              height: 10,
            ),
            TextFeild1(
              
                controller: passwordController,
                hintText: "Password",
                IsobscureText: true,
                icon: Icons.lock, validator: null,),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal:25.0),//forgot password ? arrange inorder with textfeild size
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [

                  GestureDetector(
                    onTap: (){
                      Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (context)
                      {
                        return const ForgotPasswordPage();
                      },
                      ),
                      (Route<dynamic> route)=>false);
                    },
                    child:  Text(
                      "Forgot Password ?",
                      style: TextStyle(
                        color: Colors.grey[700], 
                        fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.all(20.0),
              margin: const EdgeInsets.symmetric(horizontal: 25),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(25.0),
              ),
              width: double.infinity,
              child: TextButton(
                
                onPressed: ()  async{
                  try
                  {
                    //Get.testMode=true;
              
                    String email=usernameController.text;
                     String  password=passwordController.text;
                     if(email.isEmpty)
                     {
                       Fluttertoast.showToast(
                              msg: "Please enter your email",
                              toastLength: Toast.LENGTH_LONG,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 3,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize:16.0);

                     }
                      if(password.isEmpty){
                      Fluttertoast.showToast(
                              msg: "Please enter your password",
                              toastLength: Toast.LENGTH_LONG,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 3,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize:16.0);
                     }
                     
                     else{
                     await controller.loginMethod(
                      context: context,
                      email: email,
                      password: password
                     ).then((value) {
                      
                      VxToast.show(context, msg: 'logged in Successfully');
                     
                      Navigator.pushAndRemoveUntil(context,//here we can use push only(pushreplacement used to false back navigation)
                          MaterialPageRoute(builder: (_) => const Homepage()),
                         
                           (Route<dynamic> route)=>false);
                        
                      }
                     
                      );
                      }
                     }
                     
                  catch (e)
                  {
                    FirebaseAuth.instance.signOut();
                    
                    // ignore: use_build_context_synchronously
                   VxToast.show(context, msg: e.toString());
                  }
                },
                child: const Text(
                  "Sign In",
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
              children: [
                Expanded(
                    child: Divider(
                  thickness: 0.25,
                  color: Colors.grey[700],
                )
                ),
                // const Text("Or continue with"),
                // Expanded(
                //     child: Divider(
                //   thickness: 0.15,
                //   color: Colors.grey[700],
                // )
                // ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            //  Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [ Square(
            //     onTap: () => Goo_auth().signInWithGoogle(), imagePath: 'lib/images/gnew.png')],
            // ),
            
            const SizedBox(
              height: 30,
            ),
             
            
               Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Does not have an account?",
                  ),
                  TextButton(
                    child: const Text(
                      "Register now",
                      style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(context,//here we can use push only(pushreplacement used to false back navigation)
                          MaterialPageRoute(builder: (_) => RegPage1()
                          )
                          );
                    },
                  )
                ],
              ),
            
          ]),
        ),
      ),
    );
  }
}
