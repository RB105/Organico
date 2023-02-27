import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:organico/core/routes/router.dart';
import 'package:organico/provider/remote/sign_up_provider.dart';
import 'package:organico/provider/remote/sing_in_provider.dart';
import 'package:provider/provider.dart';

import 'view/auth/sign_up_page.dart';

void main(List<String> args)async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => SignUpProvider(),),
    ChangeNotifierProvider(create: (context) => SignInProvider(),)
  ],child: const MyApp(),));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteGenerator.router.onGenerate,
      initialRoute: 'splash',
    );
  }
}
