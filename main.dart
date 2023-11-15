import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'database_work/firebase_options.dart';
import 'package:flutter_application_1/app_screen/splash.dart';
 //package import due to some functionality,some things that not available in dart,or to use some widgets
void main() async
{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const Myapp());
 //Entry point of application,main fn is compulsry and everything start from this fn,we can see any fn definition with some cmnd
//runApp=> is used to show whatever things is passed as parameteer,simply we can say something to show on screen 
} 
class Myapp extends StatelessWidget
{
  const Myapp({super.key});
  @override
  Widget build(BuildContext context)
  {
    return  const  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "OWN a HOME",
      home:  Splash(),
    );
  }
}