import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
//import 'package:path/path.dart';
import 'package:velocity_x/velocity_x.dart';

class Authontroller extends GetxController
{
  
   final User? currentuser=FirebaseAuth.instance.currentUser;
   var isLoading=false.obs;
  
  //login method 
  Future<UserCredential?> loginMethod({email,password,context}) async
  {
UserCredential? userCredential;
try
{
   await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: email,
    password: password);

}
 on FirebaseAuthException catch(e)
{
VxToast.show(context, msg: e.toString());
}
return userCredential;
  }
  //singup Method
  Future<UserCredential?> SignUpMethod({email,password,context}) async
  {
  UserCredential? userCredential;
try
{
   await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: email,
    password: password);

}
 on FirebaseAuthException catch(e)
{
VxToast.show(context, msg: e.toString());
}
return userCredential;
  }
  //storing data method
   storeuserdata({userid,username,email,password}) async
  {
     DocumentReference store= FirebaseFirestore.instance.collection('users').doc(currentuser!.uid);
     store.set({
      'userid':userid,
      'username':username,
      'email':email,
      'password':password,
      'id':currentuser!.uid,
      });
  }
  
}