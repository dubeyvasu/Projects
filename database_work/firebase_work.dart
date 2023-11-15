import 'package:cloud_firestore/cloud_firestore.dart';


class FirestoreServices
{

  //get user data
  static getUser(uid)
  {
    return FirebaseFirestore.instance.collection('users').where('id',isEqualTo: uid).snapshots();
  }
  static getProducts()
  {
    return FirebaseFirestore.instance.collection('house').snapshots();
    
  }
  static searchHome(title)
  {
    return FirebaseFirestore.instance.collection('house').get();
  }
  static getHouse({current})
  {
        return FirebaseFirestore.instance.collection('house').where('houseid',isEqualTo: current).snapshots();
  }
}