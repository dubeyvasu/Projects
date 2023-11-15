

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/app_screen/home_details.dart';
import 'package:flutter_application_1/app_screen/navbar.dart';
import 'package:flutter_application_1/database_work/firebase_work.dart';
import 'package:velocity_x/velocity_x.dart';

// ignore: camel_case_types
class Search_screen extends StatelessWidget
{
   final String? title;
  const Search_screen({super.key,this.title});
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      backgroundColor: Colors.white,
       drawer: Navbar(),
        appBar: AppBar(
          backgroundColor: Colors.amber[900],
          title: title!.text.make(),
          
        ),
        body: FutureBuilder(future: FirestoreServices.searchHome(title), 
        builder: (BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot)
        {//taking time to load
           if(!snapshot.hasData)
           {
               return const Center(child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(Colors.red),),);
           }
           //some data not available that is entered by user
           else if(snapshot.data!.docs.isEmpty)
           {
              return Center(
                   child: "No property found....".text
                                          .bold
                                          .size(20).make(),
                 );

              
           }
           //if everything okay
           else{
            var data=snapshot.data!.docs;
            var filer=data.where((element) => element['location'].toString().toLowerCase().contains(title!.toLowerCase()),).toList();
           return Padding(
             padding: const EdgeInsets.all(8.0),
             child: GridView(
             
              gridDelegate: //it control the layout of children within gridview
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      mainAxisSpacing: 8,
                                      crossAxisSpacing: 8,
                                      mainAxisExtent: 275),
                                       children: filer.mapIndexed((currentValue, index) => Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image.network(
                                      filer[index]['images']
                                          , //access images from database,and some useful things
                                      height: 170,
                                      width: 200,
                                      fit: BoxFit.fill,
                                    ),
                                    const Spacer(),
                                    10.heightBox,
                                    "${filer[index]['housetype']}"
                                        .text
                                        .color(Colors.grey)
                                        .semiBold
                                        .size(10)
                                        .make(),
                                    5.heightBox,
                                    
                                    "${filer[index]['house_price']}"
                                        .numCurrencyWithLocale(locale: 'en_in').replaceAll('INR', '₹ ')
                                        .text
                                        .color(Colors.blue)
                                        .semiBold
                                        .size(10)
                                        .make()
                                  ],
           
                                       ).box
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
                                                "${filer[index]['housetype']}",
                                            data: filer[index],
                                          )
                                          ),
                                );
                              })
                                       ).toList(),
                                      ),
           );
           }
        }
        ),
    );
  }
}