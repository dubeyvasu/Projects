// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_application_1/app_screen/navbar.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:velocity_x/velocity_x.dart';

class Home_details extends StatelessWidget {
  final String? title;
  final dynamic data;

  const Home_details({super.key, required this.title, this.data});
  @override
  Widget build(BuildContext context) {
    
    //whatsapp redirecting with the help of Url launcher package
    final Uri whatsapp=Uri.parse('https://wa.me/${data['Mobile_no']}');
    final Uri google=Uri.parse('https://www.google.com/maps/search/?api=1&query=${data['location']}');

    return Scaffold(
      backgroundColor: Colors.white,
      drawer: Navbar(), //calling navbar that is another file
      appBar: AppBar(
        //top of the application
        title: title!.text.make(),
        backgroundColor: Colors.amber[900],
      ),
      body: Column(
        children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(8),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  VxSwiper.builder(
                      autoPlay: true,
                      height: 270,
                      aspectRatio: 16 / 9,
                      itemCount: data['images'].length,
                      itemBuilder: (context, index)
                          //vxswiper use to swipe images automatically within application
                          {
                        return Image.network(
                          //mistakly i write index after image :)
                          data['images'],
                          width: double.infinity,
                          fit: BoxFit.cover,
                        );
                      }),
                  10.heightBox,
                  title!.text.size(18).semiBold.color(Colors.grey[600]).make(),
                  10.heightBox,
                  "House Model: ${data['housemodel']}"
                      .text
                      .color(Colors.grey)
                      .semiBold
                      .size(15)
                      .semiBold
                      .make(),
                  10.heightBox,
                  "House Price: Rs ${data['house_price']}"
                      .text
                      .color(Colors.grey)
                      .semiBold
                      .size(15)
                      .make(),
                  20.heightBox,
                  Row(
                    children: [
                      Expanded(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          "${data['location']}"
                              .text
                              .color(Colors.blue)
                              .bold
                              .size(15)
                              .make(),
                        ],
                      )),
                      const CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.location_on,
                        ),
                      ),
                    ],
                  )
                      .box
                      .height(70)
                      .padding(const EdgeInsets.symmetric(horizontal: 16))
                      .color(Colors.grey.shade300)
                      .make().onTap(() async {
                        await launchUrl(google);
                      }),
                ],
              ),
            ),
          )),
          SizedBox(
            height: 60,
            width: double.infinity,
            child: TextButton(
              onPressed: () async {
                await launchUrl(whatsapp);
              },
              child: const Text(
                "Chat on Whatsapp",
                style: TextStyle(
                  color: Colors.green,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
