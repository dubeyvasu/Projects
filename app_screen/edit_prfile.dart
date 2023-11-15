// ignore_for_file: camel_case_types, must_be_immutable

import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/app_screen/navbar.dart';
import 'package:flutter_application_1/components/my_textfeild1.dart';
import 'package:flutter_application_1/database_work/profile_controller.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:share_plus/share_plus.dart';
import 'package:velocity_x/velocity_x.dart';

class Edit_Profile extends StatelessWidget {
  final dynamic data;
  var profileimagelink = '';
  Uint8List? selectedImagesInBytes;
  XFile? file;
  String? selectfile;
  Edit_Profile({super.key, this.data});
  
  @override
  Widget build(BuildContext context) {
    var controller = Get.find<Profile>();
    //namecontroller.text=Profile.dat[''];

    return Scaffold(
      drawer: Navbar(),
      appBar: AppBar(
        title: const Text("Profile"),
        backgroundColor: Colors.amber[900],
      ),
      body: Obx(
        () => Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            controller.profileImagePath.isEmpty
                ? Image.asset(
                    'lib/images/download.jpeg',
                    width: 130,
                    fit: BoxFit.cover,
                  ).box.roundedFull.clip(Clip.antiAlias).make()

                : Image.file(File(controller.profileImagePath.value)),
                
                // Image.asset(
                //     'lib/images/download.jpeg',
                //     width: 130,
                //     fit: BoxFit.cover,
                //   ).box.roundedFull.clip(Clip.antiAlias).make(),
            10.heightBox,
            // TextButton(
            //     onPressed: () {
            //       controller.changeImage(context);
            //     },
            //     child: "change".text.make()
            //     ),
            const Divider(),
            20.heightBox,
            TextFeild1(
                controller: controller.namecontroller,
                hintText: "Name",
                IsobscureText: false,
                icon: Icons.person_outline,
                validator: null),
            10.heightBox,
            TextFeild1(
                controller: controller.dobcontroller,
                hintText: "Date of birth",
                IsobscureText: false,
                icon: Icons.date_range,
                validator: null),
            10.heightBox,
            TextFeild1(
                controller: controller.oldpasswordcontroller,
                hintText: "Old Password",
                IsobscureText: true,
                icon: Icons.date_range,
                validator: null),
            10.heightBox,
            TextFeild1(
                controller: controller.newpasswordcontroller,
                hintText: " New Password",
                IsobscureText: true,
                icon: Icons.date_range,
                validator: null),
            20.heightBox,
            TextButton(
              onPressed: () async {
                //controller.isLoading(true);
                //await controller.uploadProfileImage();

                if (data['password'] == controller.oldpasswordcontroller.text) {
                  await controller.changeAuthpassword(
                      email: data['email'],
                      password: controller.oldpasswordcontroller.text,
                      newpassword: controller.newpasswordcontroller.text);
                  await controller.updateProfile(
                      UserName: controller.namecontroller.text,
                      DateofBirth: controller.dobcontroller.text,
                      newpassword: controller.newpasswordcontroller.text);
                      controller.c2();

                  // ignore: use_build_context_synchronously
                  VxToast.show(context, msg: "Updated");
                } else {
                  VxToast.show(context, msg: "Wrong old password",);
                }
              },
              child: const Text(
                "Save",
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        )
            .box
            .white
            .shadowSm
            .padding(const EdgeInsets.all(16))
            .margin(const EdgeInsets.only(top: 50, left: 12, right: 12))
            .rounded
            .make(),
      ),
    );
  }
}
