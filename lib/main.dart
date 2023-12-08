import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:user/firebase_options.dart';
import 'package:user/presentstion/login_screen/login_screen.dart';

void main()async {
   WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 217, 7, 77)),
        useMaterial3: true,
      ),
      home: LoginScreen(),
    );
  }
}
