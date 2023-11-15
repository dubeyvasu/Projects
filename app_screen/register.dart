import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/database_work/auth_controller.dart';
import 'package:flutter_application_1/app_screen/homepage.dart';
import 'package:flutter_application_1/components/my_textfeild1.dart';
import 'package:flutter_application_1/components/square2.dart';
import 'package:flutter_application_1/app_screen/login.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';



class RegPage1 extends StatefulWidget {

  @override
  State<RegPage1> createState() => _RegPage1();
  
}

class _RegPage1 extends State<RegPage1> {
   
  final formkey= GlobalKey<FormState>();
  //here we create instance for AuthController class
  static  var controller=Get.put(Authontroller());
  
  
  final userIdController=TextEditingController();
  final nameController=TextEditingController();
  final emailController=TextEditingController();
  final passwordController=TextEditingController();
  final repasswordController=TextEditingController();
  
 
  @override
  void initState()
  {
super.initState();
  }
  @override
  void dispose()
  {
    userIdController.dispose();
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    repasswordController.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
  
     
    return Scaffold(
      backgroundColor: Colors.grey[400],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
          child: Column(children: [
            const SizedBox(
              height: 10,
            ),
            const Square2(imagePath: 'lib/images/homelogo.jpeg'),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Register Now",
              style: TextStyle(
                  color: Colors.lightGreen[800],
                  fontWeight: FontWeight.bold,
                  fontSize: 24),
            ),
            const SizedBox(
              height: 10,
            ),
           TextFeild1(controller: userIdController, hintText:"Name", IsobscureText: false, icon: Icons.person,validator:null,),
           const SizedBox(
              height: 10,
            ),
            TextFeild1(controller: nameController, hintText:"Date of Birth",IsobscureText: false, icon: Icons.person_outline,validator: null),
            const SizedBox(
              height: 10,
            ),
            TextFeild1(controller: emailController, hintText:"Email", IsobscureText: false, icon: Icons.email,validator: null),
            const SizedBox(
              height: 10,
            ),
            TextFeild1(controller: passwordController, hintText:"Password", IsobscureText: true, icon: Icons.lock,validator: null),
            const SizedBox(
              height: 10,
            ),
            TextFeild1(controller: repasswordController, hintText:"Confirm Password", IsobscureText: true, icon: Icons.lock,validator: null),
            
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
                onPressed: () async{
                  try
                  {
                    Get.testMode=true;
                    String? name=userIdController.text;
                   String? dob=nameController.text;
                    String? email=emailController.text;
                     String? Password=passwordController.text;
                     if(name.isEmpty)
                     {
                      Fluttertoast.showToast(
                      msg: "Please enter your name",
                      toastLength: Toast.LENGTH_LONG,
                      gravity: ToastGravity.SNACKBAR,
                      timeInSecForIosWeb: 3,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize:16.0);

                     }
                     else if(dob.isEmpty)
                     {
                      Fluttertoast.showToast(
                      msg: "Please enter your date of birth",
                      toastLength: Toast.LENGTH_LONG,
                      gravity: ToastGravity.SNACKBAR,
                      timeInSecForIosWeb: 3,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize:16.0);              
                      
                     }              
                    else if(email.isEmpty)
                     {
                      Fluttertoast.showToast(
                      msg: "Please enter your email",
                      toastLength: Toast.LENGTH_LONG,
                      gravity: ToastGravity.SNACKBAR,
                      timeInSecForIosWeb: 3,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize:16.0);
                     }
                     else if(Password.isEmpty)
                     {
                      Fluttertoast.showToast(              
                      msg: "Please enter Password",
                      toastLength: Toast.LENGTH_LONG,
                      gravity: ToastGravity.SNACKBAR,
                      timeInSecForIosWeb: 3,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize:16.0);
                      
                     }
                     else if(passwordController.text!=repasswordController.text)
                     {
                            Fluttertoast.showToast(              
                      msg: "Password Mismatch",
                      toastLength: Toast.LENGTH_LONG,
                      gravity: ToastGravity.SNACKBAR,
                      timeInSecForIosWeb: 3,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize:16.0);
                     }
                    
                   else{
                     await controller.SignUpMethod(
                      context: context,
                      email: email,
                      password: Password).then((value) {
                        return FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser!.uid).set({
                        'UserName':name.trim(),
                         'DateofBirth':dob.trim(),
                         'email':emailController.text.trim(),
                         'password':passwordController.text.trim(),
                         
                         'id':FirebaseAuth.instance.currentUser!.uid
                        });
                      }
                      ).then((value) {
                        VxToast.show(context, msg: 'logged in Successfully');
                        //Get.offAll( const Homepage());
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
                child: const  Text(
                  "Sign Up",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            
           
             
             const SizedBox(
              height: 30,
            ),
              
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Already have an account ?",),
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
          ]),
        ),
      ),
      ),
    );
  }
  
}