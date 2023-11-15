import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/app_screen/contactus.dart';
import 'package:flutter_application_1/app_screen/homepage.dart';
import 'package:flutter_application_1/app_screen/login.dart';
import 'package:flutter_application_1/app_screen/total_post.dart';
import 'package:flutter_application_1/app_screen/profile.dart';
import 'package:flutter_application_1/app_screen/veiw_property.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:share_plus/share_plus.dart';
import 'package:velocity_x/velocity_x.dart';

class Navbar extends StatelessWidget {
 Navbar({super.key});
  final user = FirebaseAuth.instance.currentUser!;
  //var controller=Get.put(Profile());
  signout1() async {
    try {
      VxToast.show(context as BuildContext, msg: 'Logged out Successfully');
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      VxToast.show(context as BuildContext, msg: e.toString());
    }
  }
  signout() async
  {
    
    FirebaseAuth.instance.signOut();
    Navigator.pushAndRemoveUntil(
                  context as BuildContext, //here we can use push only(pushreplacement used to false back navigation)
                  MaterialPageRoute(builder: (_) => const LoginPage1()),
                  (Route<dynamic> route) => false);
                  VxToast.show(context as BuildContext, msg: "Logged out Successfully");
    
    
    
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text(
              'Welcome Back',
              style: TextStyle(
                  color: Colors.red, fontWeight: FontWeight.bold, fontSize: 22),
            ),
            accountEmail: Text(user.email!),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.asset(
                  'lib/images/download.jpeg',
                  width: 90,
                  height: 90,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            decoration: const BoxDecoration(
              color: Colors.amber,
            ),
          ),
          ListTile(
              leading: const Icon(Icons.home),
              title: const Text("Home"),
              onTap: () => {
                    Navigator.pushAndRemoveUntil(
                        context, //here we can use push only(pushreplacement used to false back navigation)
                        MaterialPageRoute(builder: (_) => const Homepage()),
                        (Route<dynamic> route) => false)
                  } //Scaffold.of(context).closeDrawer(),
              ),
          const Divider(),
          ListTile(
              leading: const Icon(Icons.person_outline),
              title: const Text("Profile"),
              onTap: () => {
                    Navigator.pushAndRemoveUntil(
                        context, //here we can use push only(pushreplacement used to false back navigation)
                        MaterialPageRoute(builder: (_) => const profile_page()),
                        (Route<dynamic> route) => false)
                  }),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.share),
            title: const Text("Share"),
            onTap: () => {Share.share('com.example.flutter_application_1')},
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.rate_review_outlined),
            title: const Text("Contact Us"),
            onTap: () => {
              Navigator.pushAndRemoveUntil(
                  context, //here we can use push only(pushreplacement used to false back navigation)
                  MaterialPageRoute(builder: (_) => const Contact()),
                  (Route<dynamic> route) => false)
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text("Total Property Posted"),
            onTap: () => {
              Get.put(const PropertylistPage()),
              Navigator.pushAndRemoveUntil(
                  context, //here we can use push only(pushreplacement used to false back navigation)
                  MaterialPageRoute(builder: (_) =>  Post()),
                  (Route<dynamic> route) => false)
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text("Log Out"),
            onTap: () => {
              FirebaseAuth.instance.signOut(),
    Navigator.pushAndRemoveUntil(
                  context , //here we can use push only(pushreplacement used to false back navigation)
                  MaterialPageRoute(builder: (_) => const LoginPage1()),
                  (Route<dynamic> route) => false),
                  VxToast.show(context , msg: "Logged out Successfully")
              
            },
          ),
        ],
      ),
    );
  }
}
