// ignore_for_file: avoid_single_cascade_in_expression_statements

import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:no_stunting/firebase_options.dart';
import 'package:no_stunting/screens/child/login.dart';
import 'package:no_stunting/screens/choose_roles/choose_roles.dart';
import 'package:no_stunting/services/notification_services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

NotificationsService notificationsService = NotificationsService();

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();
  AndroidNotification? android = message.notification?.android;
  RemoteNotification? notification = message.notification;

  if (notification != null && android != null) {
    notificationsService.sendNotification(
        notification.title.toString(), notification.body.toString());
  }
}

void main() async {
  void mainCloudMessagingInit() async {
    WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
    FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
    notificationsService.initializeNotification();

    // ignore: unused_local_variable
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      if (message.notification != null) {
        AndroidNotification? android = message.notification?.android;
        RemoteNotification? notification = message.notification;

        if (notification != null && android != null) {
          notificationsService.sendNotification(
              notification.title.toString(), notification.body.toString());
        }
      }
    });
  }

  mainCloudMessagingInit();

  runApp(const MyApp());
  Future.delayed(const Duration(seconds: 2), () {
    FlutterNativeSplash.remove();
  });
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const SafeArea(child: ChooseRolesLogin()),
    );
  }
}
