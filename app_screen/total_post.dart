import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


import 'package:flutter/material.dart';

import 'package:flutter_application_1/app_screen/navbar.dart';
import 'package:flutter_application_1/database_work/firebase_work.dart';
import 'package:flutter_application_1/database_work/property_controller.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';


class Post extends StatefulWidget
{
    Post({super.key});

  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {
   

   var controller=Get.put(Property_controller());

  //final userCollection=FirebaseFirestore.instance.collection('house');

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
backgroundColor: Colors.grey,
 drawer: Navbar(),
    appBar: AppBar(
      backgroundColor: Colors.amber[900],
      title:const Text("Manage your Property.."),
    ),
    body: StreamBuilder(stream: FirestoreServices.getHouse(current: FirebaseAuth.instance.currentUser!.uid),
                builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot)
                {
                  if (!snapshot.hasData) {
                 return const Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(Colors.red,),
                  ),
                  
                );
              }
              // ignore: unnecessary_null_comparison
             else if(snapshot.data!.docs.isEmpty)
             {
                 return Center(
                   child: "No property posted yet....".text
                                          .bold
                                          .size(20).make(),
                 );
             }
              else {
                var data = snapshot.data!.docs;
                
                return Column(
                  children: [
                   
                    5.heightBox,
                    //purpose of expanded and singlechildscrollview is make page drawable up-down
                    Expanded(
                      child: SingleChildScrollView(
                        physics: const AlwaysScrollableScrollPhysics(),
                        child: GridView.builder(
                            shrinkWrap: true,
                            itemCount: 
                            data.length, //it shows data that is stored in database
                            gridDelegate: //it control the layout of children within gridview
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    mainAxisSpacing: 8,
                                    crossAxisSpacing: 8,
                                    mainAxisExtent: 275),
                            itemBuilder: (context, index) {
                              //final single=data[index];
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.network(
                                    data[index]['images']
                                        , //access images from database,and some useful things
                                    height: 170,
                                    width: 200,
                                    fit: BoxFit.fill,
                                  ),
                                  const Spacer(),
                                  10.heightBox,
                                  "${data[index]['housetype']}"
                                      .text
                                      .color(Colors.grey)
                                      .semiBold
                                      .size(10)
                                      .make(),
                                  5.heightBox,
                                  "${data[index]['house_price']}"
                                      .numCurrencyWithLocale(locale: 'en_in').replaceAll('INR', '₹ ')
                                      .text
                                      .color(Colors.blue)
                                      .semiBold
                                      .size(10)
                                      .make(),
                                    
                                      
                                ],
                              )
                                  .box
                                  .blue100
                                  .margin(const EdgeInsets.symmetric(
                                      horizontal: 4))
                                  .roundedSM
                                  .padding(const EdgeInsets.all(12))
                                  .make().onTap(() { 
                                    showDialog(context: context, builder: (context) 
                                    {
                                      return AlertDialog(
                                        title: const Text("Delete"),
                                        content: const Text("Are you sure you want to delete this property"),
                                        actions: [
                                          ElevatedButton(onPressed: (){
                                           

                                          controller.deleteHouseDetails(context: context,productid: data[index].id);

                                          }, child: const Text("Yes Delete it"))
                                        ],
                                      );
                                    } );
                                  });
                                  
                            }
                            ),
                      ),
                    )
                  ],
                );
              }
                }
                ),
    );
  }
}