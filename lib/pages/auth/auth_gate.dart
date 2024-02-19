import 'package:firebase_auth/firebase_auth.dart';
import 'package:fl_22_auth/pages/auth/login_page.dart';
import 'package:fl_22_auth/pages/home_page.dart';
import 'package:flutter/cupertino.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot){
          if(snapshot.hasData){
            return HomePage(user: snapshot.data,);
          }else{
            return const LoginPage();
          }
      },
    );
  }
}
