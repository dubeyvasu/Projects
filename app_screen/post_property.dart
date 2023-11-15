
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/app_screen/navbar.dart';
import 'package:flutter_application_1/components/my_textfeild1.dart';

import 'package:flutter_application_1/database_work/property_controller.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:velocity_x/velocity_x.dart';
class PostPropertyPage extends StatefulWidget
{
  const PostPropertyPage({super.key});
  @override
  State<PostPropertyPage> createState()=>_PropertyPage();
}
class _PropertyPage extends State<PostPropertyPage>
{
  
  
  final user=FirebaseAuth.instance.currentUser;
  var controller=Get.put(Property_controller());
  String selectedFile='';
  XFile? file;
  Uint8List? selectedImageInBytes;
  String? imageUrl;
   selectFile() async
  {
    //file=await ImagePicker().pickImage(source: ImageSource.gallery);
    FilePickerResult? filePickerResult=await FilePicker.platform.pickFiles();
    if(filePickerResult!=null)
    {
      setState(()
      {
        selectedFile=filePickerResult.files.first.name;
        selectedImageInBytes=filePickerResult.files.first.bytes;
      });
      
    }
    
  }
  upload() async
  {
   try{
     UploadTask uploadTask;
     Reference ref=FirebaseStorage.instance.ref().child('name').child('/'+selectedFile);
     //uploadTask=ref.putFile(File(file!.path));
     final metadata=SettableMetadata(contentType: "image/jpeg");
     
     uploadTask=ref.putData(selectedImageInBytes!,metadata);
     await uploadTask.whenComplete(() => null);
       imageUrl=await ref.getDownloadURL();
       var store=FirebaseFirestore.instance.collection('house').doc();
                       await store.set({
                         'house_price':controller.pricecontroller.text,
                         'housemodel':controller.modelcontroller.text,
                         'housetype':controller.typecontroller.text,
                         'location':controller.locationcontroller.text,
                         'houseid':FirebaseAuth.instance.currentUser!.uid,
                         'images':imageUrl,
                         'Mobile_no':controller.mobilecontroller.text
                       },SetOptions(merge: true));
                       controller.cl();
                        // ignore: use_build_context_synchronously
                        VxToast.show(context, msg: "Uploaded Successfully");
       
       
       
      

    
   }catch(e){
    // ignore: use_build_context_synchronously
    VxToast.show(context, msg: e.toString());
   }
  }
  
  @override
  Widget build(BuildContext context) {
    
   
   return Scaffold(
    backgroundColor: Colors.grey[300],
    drawer: Navbar(),
    appBar: AppBar(
      backgroundColor: Colors.amber[900],
      title:const Text("Post Property"),
    ),
    body: Center(
      child:SingleChildScrollView(
        child: Column(
            children: [
               30.heightBox,
               selectedFile.isEmpty
                  ? Image.network(
                      'lib/images/download.jpeg',
                      width: 130,
                      fit: BoxFit.cover,
                    ).box.roundedFull.clip(Clip.antiAlias).make()
      
                  : Image.memory(selectedImageInBytes!,width: 130,fit: BoxFit.cover).box.roundedFull.clip(Clip.antiAlias).make(),
               
              //Image.asset('lib/images/check.jpg',width: 230,height: 200,fit: BoxFit.cover,).box.roundedFull.clip(Clip.antiAlias).make(),
              5.heightBox,
              const Icon(Icons.camera_alt).onTap(() {
                
               selectFile();
      
                
              }),
            30.heightBox,
                TextFeild1(controller: controller.locationcontroller, hintText: "Enter your location", IsobscureText: false, icon: Icons.location_on_outlined, validator: null),
              
            20.heightBox,
            
                TextFeild1(controller: controller.typecontroller, hintText: "Enter your house type like for boys,girls...", IsobscureText: false, icon: Icons.house_outlined, validator: null),
             
            20.heightBox,
            
                TextFeild1(controller: controller.pricecontroller, hintText: "Enter your price", IsobscureText:false, icon: Icons.currency_rupee_outlined, validator: null),
                20.heightBox,
            
                TextFeild1(controller: controller.modelcontroller, hintText: "Enter your house model like 2bhk 3bhk..", IsobscureText:false, icon: Icons.mode_outlined, validator: null),
             
             20.heightBox,
            
                TextFeild1(controller: controller.mobilecontroller, hintText: "Enter your Mobile no.", IsobscureText:false, icon: Icons.call, validator: null),
             
            20.heightBox,
            TextButton(child: const Text(
                      "Post Property",
                      style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold
                      ),
                      ),
                      onPressed: () async{
                        upload();
                        //print(imageUrl);
                        
                       

                        

                          
                      },
                      ),
            
          ],
          ),
      ),
      ),
    );


  }
}