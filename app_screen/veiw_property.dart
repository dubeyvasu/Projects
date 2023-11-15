import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/app_screen/home_details.dart';
import 'package:flutter_application_1/app_screen/navbar.dart';
import 'package:flutter_application_1/app_screen/search_screen.dart';
import 'package:flutter_application_1/database_work/firebase_work.dart';
import 'package:flutter_application_1/database_work/property_controller.dart';
import 'package:get/get.dart';

import 'package:velocity_x/velocity_x.dart';

class PropertylistPage extends StatefulWidget
{
 
  const PropertylistPage({super.key});
  @override
  State<PropertylistPage> createState() => _PropertylistPage();
}

class _PropertylistPage extends State<PropertylistPage> {
  final user = FirebaseAuth.instance.currentUser!;
    String c='Rs';

  @override
  Widget build(BuildContext context) {
     var controller=Get.find<Property_controller>();
    return Scaffold(
        drawer: Navbar(),
        appBar: AppBar(
          backgroundColor: Colors.amber[900],
          title: const Text(" View Properties"),
        ),
        //purpose of making body as streambuilder bcz we access data from database and render it our applivation
        body: StreamBuilder(
            stream: FirestoreServices.getProducts(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                //here we use this indicator for waiting purpose only ,when user data doesn't load and user have to wait for some time
                return const Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(Colors.red),
                  ),
                );
              } else {
                //if snapshot has data then we will show on the screen
                var data = snapshot.data!.docs;
                controller.c2();
                return Column(
                  children: [
                    5.heightBox,
                    TextFormField(
                      decoration:  InputDecoration(
                        suffixIcon: const Icon(
                            Icons.search).onTap(() {
                              if(controller.searchcontroller.text.isNotEmptyAndNotNull){ 
                              Navigator.push(context,MaterialPageRoute(
                                builder: (_)=>Search_screen(title: controller.searchcontroller.text,)
                                )
                                );
                                
                              }
                              
                            }
                            ),
                             //search icon added in search box
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "Search here...",
                        
                        hintStyle: const TextStyle(color: Colors.grey),
                      ),
                      controller: controller.searchcontroller,
                      
                    ),
                    5.heightBox,
                    //purpose of expanded and singlechildscrollview is make page drawable up-down
                    Expanded(
                      child: SingleChildScrollView(
                        physics: const AlwaysScrollableScrollPhysics(),
                        child: GridView.builder(
                            shrinkWrap: true,
                            itemCount: data
                                .length, //it shows data that is stored in database
                            gridDelegate: //it control the layout of children within gridview
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,//it divides grid into column and row with 2*2
                                    mainAxisSpacing: 8,//it set spacing between items along main axis
                                    crossAxisSpacing: 8,//it set spacing between items along cross axis
                                    mainAxisExtent: 270//
                                    ),
                            itemBuilder: (context, index) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.network(
                                    data[index]['images']
                                        , //access images from database,and some useful things
                                    height: 160,
                                    width: 200,
                                    fit: BoxFit.fill,
                                  ),
                                  const Spacer(),
                                  10.heightBox,
                                  "${data[index]['housetype']}"
                                      .text
                                      .color(Colors.grey)
                                      .semiBold
                                      .size(5)
                                      .make(),
                                  5.heightBox,
                                  "${data[index]['house_price']}"
                                      .numCurrencyWithLocale(locale: 'en_in').replaceAll('INR', '₹ ')
                                      .text
                                      .color(Colors.blue)
                                      .semiBold
                                      .size(10)
                                      .make()
                                ],
                              )
                                  .box
                                  .blue100
                                  .margin(const EdgeInsets.symmetric(
                                      horizontal: 4))
                                  .roundedSM
                                  .padding(const EdgeInsets.all(12))
                                  .make()
                                  .onTap(() {
                                //Get.to(const Home_details(title: "House Details"));
                                Navigator.push(
                                  context, //here we can use push only(pushreplacement used to false back navigation)
                                  MaterialPageRoute(
                                      builder: (_) => Home_details(
                                            title:
                                                "${data[index]['housetype']}",
                                            data: data[index],
                                          )
                                          ),
                                );
                              });
                            }),
                      ),
                    )
                  ],
                );
              }
            }));
  }
}
