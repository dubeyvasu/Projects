

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';


class Property_controller extends GetxController
{
  final pricecontroller=TextEditingController();
  final typecontroller=TextEditingController();
  final modelcontroller=TextEditingController();
  final locationcontroller=TextEditingController();
  final mobilecontroller=TextEditingController();
  final searchcontroller=TextEditingController();
  final user=FirebaseAuth.instance.currentUser;
  
  
 
  @override
   void dispose()
  {
    pricecontroller.dispose();
    typecontroller.dispose();
    modelcontroller.dispose();
    locationcontroller.dispose();
    mobilecontroller.dispose();
    searchcontroller.dispose();
    super.dispose();
  }
 void cl()
  {
    mobilecontroller.clear();
    typecontroller.clear();
    pricecontroller.clear();
    searchcontroller.clear();
    locationcontroller.clear();
    modelcontroller.clear();
  }
  void c2()
  {
    searchcontroller.clear();
    
  }
  
  updateHouseDetails({price,type,model,location,images,mobile}) async
      {
        var store=FirebaseFirestore.instance.collection('house').doc();
        await store.set({
        'house_price':price,
        'housemodel':model,
        'housetype':type,
        'location':location,
        'houseid':FirebaseAuth.instance.currentUser,
        'images':images,
        'Mobile_no':mobile
        },SetOptions(merge: true));
        
        
        
      }
      final CollectionReference _product=FirebaseFirestore.instance.collection('house');
    deleteHouseDetails({context,productid}) async
    {
      
      await _product.doc(productid).delete().then((value) {
        Navigator.pop(context);
      });
      
      /*//var store=FirebaseFirestore.instance.collection('house').doc('qsnNtfgmMNWEwO3mRFlp');
      
     
      ///await store.delete().then((value) {
       // Navigator.pop(context);
     // });*///single delete manually with doc id
    }
     
}