import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:clark/resources/auth_methods.dart';
import 'package:clark/screens/home_screen.dart';
import 'package:clark/screens/login_screen.dart';
import 'package:clark/screens/video_call_screen.dart';
import 'package:clark/utils/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Zoom Clone',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: backgroundColor,
      ),
      routes: {
        '/login': (context) => const LoginScreen(),
        '/home': (context) => const HomeScreen(),
        '/video-call': (context) => const VideoCallScreen(),
      },
      home:LoginScreen()
      // home: StreamBuilder(
      //   stream: AuthMethods().authChanges,
      //   builder: (context, snapshot) {
      //     if (snapshot.connectionState == ConnectionState.waiting) {
      //       return const Center(child: CircularProgressIndicator());
      //     }
      //     if (snapshot.hasData) {
      //       return const HomeScreen();
      //     }
      //     return const LoginScreen();
      //   },
      // ),
    );
  }
}
