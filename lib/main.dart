import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user/application/Home/home_bloc.dart';
import 'package:user/application/auth/auth_bloc.dart';
import 'package:user/firebase_options.dart';
import 'package:user/presentstion/login_screen/login_screen.dart';

import 'services/push_notification_services.dart';


Future _firebaseBackgroundMessage(RemoteMessage message) async {
  if (message.notification != null) {
    print("-----------------------   notification Received  -------------------");
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );


  // init , permission , get token
  PushNotifications.init();
  //  init local notification
  PushNotifications.localNotiInit();
  // recive firebase backgroung  message
  FirebaseMessaging.onBackgroundMessage(_firebaseBackgroundMessage);

  //foreground notifications
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    if (message.notification != null) {
      // show notification
      PushNotifications.showSimpleNotification(
          title: message.notification!.title!,
          body: message.notification!.body!,
         );
    }
  });



  

  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
       providers: [
        BlocProvider(create: (ctx) => AuthBloc()),
        BlocProvider(create: (ctx) => HomeBloc()),
      ],
      child: MaterialApp(
        
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromARGB(255, 217, 7, 77)),
          useMaterial3: true,
        ),
        home:const LoginScreen(),
        
      ),
    );
  }
}