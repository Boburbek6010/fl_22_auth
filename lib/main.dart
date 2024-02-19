import 'package:firebase_core/firebase_core.dart';
import 'package:fl_22_auth/pages/auth/auth_gate.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

void main()async{

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AuthGate(),
    );
  }
}
