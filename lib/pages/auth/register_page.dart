import 'package:fl_22_auth/services/auth_service.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register Page"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              TextField(
                controller: fullNameController,
                decoration: const InputDecoration(
                    hintText: "User name"
                ),
              ),

              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                    hintText: "Email"
                ),
              ),

              TextField(
                controller: passwordController,
                decoration: const InputDecoration(
                    hintText: "Password"
                ),
              ),

              MaterialButton(
                onPressed: ()async{
                  await AuthService.registerUser(context, fullName: fullNameController.text.trim().toString(), email: emailController.text.trim().toString(), password: passwordController.text);
                },
                color: Colors.blue,
                child: const Text("Register"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
