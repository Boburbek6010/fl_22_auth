import 'package:fl_22_auth/pages/login_page.dart';
import 'package:fl_22_auth/pages/register_page.dart';
import 'package:fl_22_auth/services/auth_service.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: ()async{
              await AuthService.logOut();
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const LoginPage()));
              },
            icon: const Icon(Icons.logout),
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Home Page", style: TextStyle(
              fontSize: 26
            ),),
            IconButton(onPressed: ()async{
              await AuthService.deleteAccount();
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const RegisterPage()));
            }, icon: const Icon(Icons.delete))
          ],
        ),
      ),
    );
  }
}
