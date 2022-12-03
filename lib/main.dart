import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:otp_auth/home.dart';
import 'package:otp_auth/otp.dart';
import 'package:otp_auth/phone.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp( );
  

  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'phone',
      routes: {
        'phone': (context) => MYPhone(),
        'otp': ((context) => MyOtp()),
        'home':((context) => MyHome()),
      }));
}
