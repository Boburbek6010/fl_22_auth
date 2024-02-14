import 'package:fl_22_auth/pages/home_page.dart';
import 'package:fl_22_auth/pages/register_page.dart';
import 'package:fl_22_auth/services/auth_service.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
                  await AuthService.loginUser(context, email: emailController.text, password: passwordController.text);
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomePage()));
                },
                color: Colors.blue,
                child: const Text("Login"),
              ),

              MaterialButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const RegisterPage()));
                },
                color: Colors.yellow,
                child: const Text("Don't have an account? Create new account"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
