import 'package:firebase_auth/firebase_auth.dart';
import 'package:fl_22_auth/pages/auth/login_page.dart';
import 'package:fl_22_auth/services/auth_service.dart';
import 'package:flutter/material.dart';

import 'auth/register_page.dart';

class HomePage extends StatefulWidget {
  final User? user;
  const HomePage({super.key, this.user});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.user!.email.toString()),
        actions: [
          IconButton(
            onPressed: ()async{
              await AuthService.logOut();
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
            }, icon: const Icon(Icons.delete))
          ],
        ),
      ),
    );
  }
}
