import 'package:flutter/material.dart';                                 //package import due to some functionality,some things that not available in dart,or use some widgets
void main()
{
  runApp(const MyFlutterApp());
                                                       //Entry point of application,main fn is compulsry and everything start from this fn,we can see any fn definition with some cmnd
                                                         //runApp=> is used to show whatever things is passed as parameteer,simply we can say something to show on screen 
}
class MyFlutterApp extends StatelessWidget
{
  const MyFlutterApp({super.key});
   /*class MyFlutterApp extends StatelessWidget=>StatelessWidget is superclass and MyfluuterApp is subclass
   statelesswidget=the widget that return in this class that does not contain any state and never change in furure */                                                                             
 @override
  Widget build(BuildContext context) {
    return MaterialApp(                                                               //is used materialdesign,make attractive design of scrren
      debugShowCheckedModeBanner: false,                                             //debugShowCheckedModeBanner is used to remove debug banner from right most of the screen
    title: "My flutter Application",
    home:Scaffold(                                                                    //is used to place appbar on the top of the application
      appBar: AppBar(title: const Text("My first App Screen"),),                                                   //it used to give title of application
      body: const Material(                                                                                      //here material allow us to use color
      color: Colors.blueAccent,
      child: Center(child: Text(
    "Hello World",textDirection: TextDirection.ltr,                                                          //ltr=left to right direction
    style: TextStyle(color: Colors.white,fontSize: 40.0),                                                  //fontsize is double properties so font size in decimal
    )                                                                //here we use centre widget to centre the hlw world within the screen,text is also widget (widget-UI element)
    ) ,
    
    ),
    )    
        
    );
  }

}
