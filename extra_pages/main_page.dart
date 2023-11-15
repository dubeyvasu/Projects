// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/database_work/authpage.dart';
import 'package:flutter_application_1/app_screen/homepage.dart';

class MainPage extends StatelessWidget
{
  const MainPage({super.key});
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot)
        {
          if(snapshot.hasData)
          {
            return Homepage();
          }
          else{
            return Authpage();
          }
        },
      ),
    );
  }
}