import 'package:flutter/material.dart';

import 'package:flutter_application_1/app_screen/navbar.dart';
import 'package:flutter_application_1/components/square2.dart';
class Contact extends StatelessWidget
{
  const Contact({super.key});
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      drawer: Navbar(),
      appBar: AppBar(backgroundColor: Colors.amber[900],
      title: const Text("Contact Us"),),
      body: const Center(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 30,
            ),
            Square2(imagePath: 'lib/images/homelogo.jpeg'),
            SizedBox(
              height: 50,
            ),
            ListTile(
          leading: Icon(Icons.contacts),
          title:Text("Contact Us",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
            ),
            SizedBox(
              height: 20,
            ),
            Divider(
            ),
            ListTile(
          leading: Icon(Icons.phone_in_talk),
          title: Text("Mobile number:- 9889999548"),
            ),
             Divider(),
            ListTile(
          leading: Icon(Icons.email_outlined),
          title: Text("Email:- dubeyvasuorg123@gmail.com"),
            ),
             Divider(),
             SizedBox(
              height: 20,
            ),
         
        //  Container(
        //       padding: const EdgeInsets.all(10.0),
        //       margin: const EdgeInsets.symmetric(horizontal: 25),
        //       decoration: BoxDecoration(
        //         color: Colors.amber[900],
        //         borderRadius: BorderRadius.circular(16.0),
        //       ),
        //       width: double.infinity,
        //       child: TextButton(
                
        //         onPressed:(){
        //           Navigator.pushAndRemoveUntil(context,//here we can use push only(pushreplacement used to false back navigation)
        //                   MaterialPageRoute(builder: (_) => const Homepage()),
                         
        //                    (Route<dynamic> route)=>false);
        //         },
        //         child: const Text(
        //           "Back",
        //           style: TextStyle(
        //             color: Colors.white,
        //             fontSize: 16,
        //           ),
        //         ),
        //       ),
        //     ),
          ],
        ),
      ),

    );
  }
}