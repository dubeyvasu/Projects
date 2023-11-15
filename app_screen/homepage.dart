/*required packages imported here*/
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/app_screen/navbar.dart';
import 'package:flutter_application_1/app_screen/post_property.dart';

import 'package:flutter_application_1/app_screen/veiw_property.dart';
import 'package:flutter_application_1/components/home_button.dart';
import 'package:flutter_application_1/database_work/property_controller.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
class Homepage extends StatefulWidget
{
  const Homepage({super.key});
  @override
  State<Homepage> createState()=>_HomepageState();
}
class _HomepageState extends State<Homepage>
{
  final user=FirebaseAuth.instance.currentUser!;
  final imageList=['lib/images/a3.jpg','lib/images/a2.jpg','lib/images/a1.jpg'];//list of images
  final imageList1=['lib/images/a1.jpg','lib/images/a3.jpg','lib/images/a2.jpg'];
  
  @override
  Widget build(BuildContext context)
  {
     
   
    //scaffold is material app component in which we use drawer ,navbar,appbar
    return  Scaffold(
      drawer: Navbar(),//calling navbar that is another file
      appBar: AppBar(//top of the application
        title: const Text("Own a Home"),
        backgroundColor: Colors.amber[900],
      ),
      body:Center(
        child: Container(
          padding: const EdgeInsets.all(12),
          child: SafeArea(child: 
          Column(
            children: [
              
              7.heightBox,
              
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    //swiper homes images
                    VxSwiper.builder(
                      aspectRatio: 16/4,
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 3),
                      enlargeCenterPage: true,//centre page size little bit big
                      height: MediaQuery.of(context).size.height*0.28,
                      //viewportFraction: 0.8, is used to make iamges in a single portion, min size means all images together
                      
                      
                      
                      itemCount: imageList.length, itemBuilder: (context,index)
                    {
                      return 
                         Image.asset(imageList[index],fit: BoxFit.fill,)//fil images in box
                         .box.rounded.clip(Clip.antiAlias)//make images rounds from the corner
                         .margin(const EdgeInsets.symmetric(horizontal: 4))//here we adding margin to swiper
                         .make();
                    
                    }
                    
                          ),
                  ],
                ),
              ),
          10.heightBox,
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  
                  
                  HomeButton(
                    height: context.screenHeight*0.12,
                    width: context.screenWidth/3.5,
                    icon:  'lib/images/postproperty.jpg' ,

                    title: 'Post Property',
                    
                    
                  ).onTap(() {
                   // Get.put(Property_controller());
                     Get.put(const PostPropertyPage());
                     
                     Navigator.push(
                              context, MaterialPageRoute(builder:(_)=>const PostPropertyPage()));
                      

                  }),
                  HomeButton(
                    height: context.screenHeight*0.12,
                    width: context.screenWidth/3.5,
                    icon:  'lib/images/one.jpg' ,
                    title: 'View Property',
                    
                  ).onTap(() { 
                   Get.put(const PropertylistPage());
                   Get.put(Property_controller());
                    Navigator.push(
                              context, MaterialPageRoute(builder:(_)=>const PropertylistPage()));
                       
                    
                  }),
                  
                ],
              ),
            ],
          ),
          10.heightBox,
          VxSwiper.builder(
                aspectRatio: 16/4,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
                enlargeCenterPage: true,//centre page size little bit big
                height: MediaQuery.of(context).size.height*0.28,
                //viewportFraction: 0.8, is used to make iamges in a single portion, min size means all images together
                
                itemCount: imageList1.length, itemBuilder: (context,index)
              {
                return 
                   Image.asset(imageList1[index],fit: BoxFit.fill,
                   )//fil images in box
                   .box.rounded.clip(Clip.antiAlias)//make images rounds from the corner
                   
                   .margin(const EdgeInsets.symmetric(horizontal: 4))//here we adding margin to swiper
                   .make();
              
              }
              
            ),
                       
            

            ],
          )
          ),
        ),
        
        
      ),
      
      
    );
  }
}