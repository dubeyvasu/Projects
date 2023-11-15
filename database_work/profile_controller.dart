import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:path/path.dart';

class Profile extends GetxController
{
 final namecontroller=TextEditingController();
final dobcontroller=TextEditingController();
final oldpasswordcontroller=TextEditingController();
final newpasswordcontroller=TextEditingController();
    var profileImagePath=''.obs;
    var profileimagelink='';
    var  isLoading=false.obs;
  
    @override
      void dispose()
    {
      namecontroller.dispose();
      dobcontroller.dispose();
      oldpasswordcontroller.dispose();
      newpasswordcontroller.dispose();
      super.dispose();
    }
    void c2()
    {
      oldpasswordcontroller.clear();
      newpasswordcontroller.clear();
      

    }
  changeImage(context) async
  {
    try{
    final  img= await ImagePicker().pickImage(source: ImageSource.gallery,imageQuality: 70);
  
    if(img==null) return;
      profileImagePath.value=img.path;
      VxToast.show(context, msg: profileImagePath.toString());
    
    }
     on PlatformException catch(e)
    {
       VxToast.show(context, msg:e.toString());
    }
      }
      uploadProfileImage() async
      {
         var filename=basename(profileImagePath.value);
         var destination='images/${FirebaseAuth.instance.currentUser!.uid}/$filename';
         Reference ref=FirebaseStorage.instance.ref().child(destination);
         await ref.putFile(File(profileImagePath.value));
         profileimagelink= await ref.getDownloadURL();
      }
      updateProfile( {UserName,DateofBirth,newpassword}) async
      {
        var store=FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser!.uid);
        await store.set({
        'UserName':UserName,
        'DateofBirth':DateofBirth,
        'password':newpassword
        

        },SetOptions(merge: true));
        isLoading(false);
      }
      changeAuthpassword({email,password,newpassword}) async
      {
        final cred=EmailAuthProvider.credential(email: email, password: password);
        await FirebaseAuth.instance.currentUser!.reauthenticateWithCredential(cred).then((value) {
           FirebaseAuth.instance.currentUser!.updatePassword(newpassword);
        }).catchError((error)
        {
          // ignore: avoid_print
          print(error.toString());
        });
      }
}