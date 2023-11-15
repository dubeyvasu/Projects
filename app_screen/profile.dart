import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/app_screen/edit_prfile.dart';
import 'package:flutter_application_1/app_screen/navbar.dart';
import 'package:flutter_application_1/database_work/firebase_work.dart';
import 'package:flutter_application_1/database_work/profile_controller.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class profile_page extends StatelessWidget {
  const profile_page({super.key});
  @override
  Widget build(BuildContext context) {
    var controller=Get.put(Profile());

    return Scaffold(
      
        drawer: Navbar(), //calling navbar that is another file
        appBar: AppBar(
          //top of the application
          title: const Text("Profile"),
          backgroundColor: Colors.amber[900],
        ),
        body: StreamBuilder(
            stream: FirestoreServices.getUser(
                FirebaseAuth.instance.currentUser!.uid),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                 return const Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(Colors.red,),
                  ),
                );
              } else {
                var dat = snapshot.data!.docs[0];

                return SafeArea(
                  child: Column(
                    children: [
                      10.heightBox,
                      Container(
                        color: Colors.amber[700],
                        padding: const EdgeInsets.all(15),
                        margin: const EdgeInsets.symmetric(horizontal: 25),
                        child: Column(
                          children: [
                            const Align(
                                alignment: Alignment.topRight,
                                child: Icon(
                                  Icons.edit,
                                  color: Colors.white,
                                )).onTap(() {
                                   controller.namecontroller.text=dat['UserName'];
                                  controller.dobcontroller.text=dat['DateofBirth'];
                              Navigator.pushAndRemoveUntil(context,//here we can use push only(pushreplacement used to false back navigation)
                          MaterialPageRoute(builder: (_) =>  Edit_Profile(data: dat,)),
                         
                          (Route<dynamic> route)=>false);
                          
                            }),
                            Row(
                              children: [
                                Image.asset(
                                        'lib/images/download.jpeg',
                                        width: 130,
                                        fit: BoxFit.cover,
                                      )
                                        .box
                                        .roundedFull
                                        .clip(Clip.antiAlias)
                                        .make(),
                                    
                                10.widthBox,
                                Expanded(
                                    child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    "${dat['UserName']}"
                                        .text
                                        .color(const Color.fromARGB(
                                            255, 116, 13, 134))
                                        .bold
                                        .make(),
                                    5.heightBox,
                                    "${dat['email']}"
                                        .text
                                        .color(const Color.fromARGB(
                                            255, 116, 13, 134))
                                        .bold
                                        .make(),
                                  ],
                                )),
                              ],
                            ),
                          ],
                        ),
                      ),
                      50.heightBox,
                      Container(
                        padding: const EdgeInsets.all(8),
                        margin: const EdgeInsets.symmetric(horizontal: 25),
                        color: Colors.white,
                        child: Column(
                          children: [
                            ListTile(
                              leading: const Icon(Icons.person),
                              title: "${dat['UserName']}".text.make(),
                            ),
                            const Divider(),
                            ListTile(
                              leading: const Icon(Icons.date_range_outlined),
                              title: "${dat['DateofBirth']}".text.make(),
                            ),
                            const Divider(),
                            ListTile(
                              leading: const Icon(Icons.email_outlined),
                              title: "${dat['email']}".text.make(),
                            ),
                            const Divider(),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }
              
            }));
  }
}
