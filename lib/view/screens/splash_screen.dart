import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3)).then((value) {
      checkUser();
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(child: SvgPicture.asset('assets/images/Logo.svg')),
          const SizedBox(height: 20,),
          const Text("Organico",style: TextStyle(fontSize: 24),)
        ],
      )),
    );
  }

  void checkUser(){
    FirebaseAuth.instance.authStateChanges().listen((User? user) { 
      if (user != null) {
        Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
      } else {
        Navigator.pushNamedAndRemoveUntil(context, 'signUp', (route) => false);
      }
    });
  }
}