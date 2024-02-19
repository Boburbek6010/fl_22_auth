
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../pages/home_page.dart';

class AuthService{
  static final _auth = FirebaseAuth.instance;

  static Future<User?> registerUser(BuildContext context, {required String fullName, required String email, required String password})async{
   try{
     UserCredential userCredential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
     if(userCredential.user != null){
       await userCredential.user!.updateDisplayName(fullName);
       Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));
       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Registered")));
       return userCredential.user;
     }
   }catch(e){
     Future.delayed(Duration.zero).then((value) {
       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
     });
     return null;
   }
   return null;
  }

  static Future<User?> loginUser(BuildContext context, {required String email, required String password})async{
    try{
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(email: email, password: password);
      if(userCredential.user != null){
        return userCredential.user;
      }else{
        return null;
      }
    }catch(e){
      Future.delayed(Duration.zero).then((value) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
      });
      return null;
    }
  }

  static Future<void> logOut()async{
    await _auth.signOut();
  }

  static Future<void> deleteAccount()async{
    await _auth.currentUser?.delete();
  }

  static Future<User?> signInWithGoogle()async{
    GoogleSignInAccount? googleSignInAccount = await GoogleSignIn().signIn();
    if(googleSignInAccount != null){
      GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;
      OAuthCredential oAuthCredential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(oAuthCredential);
      return userCredential.user;
    }else{
      return null;
    }
  }

}