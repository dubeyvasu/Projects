
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';



class Goo_auth
{
  
  //google sign in
  Future<void> signInWithGoogle() async
  {
    
    final GoogleSignIn googleSingIn=GoogleSignIn();
    
//begin sign in process
try
{
  GoogleSignInAccount? gUser=await googleSingIn.signIn();
  
//obtain auth details from request
if(gUser!=null)
{
final  gAuth=await gUser.authentication;
//create a new credential for user
final credential=GoogleAuthProvider.credential(
  accessToken:gAuth.accessToken ,idToken: gAuth.idToken);
//finally lets sign in with credentials
 await FirebaseAuth.instance.signInWithCredential(credential);
 


 
  }
} on Exception catch(error)
{
 
   // ignore: avoid_print
   print(error);
  
}
  }
}