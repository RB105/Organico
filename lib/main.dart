import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:organico/core/routes/router.dart';
import 'package:organico/core/theme/dark_mode.dart';
import 'package:organico/core/theme/light_mode.dart';
import 'package:organico/provider/remote/stream/home_provider.dart';
import 'package:provider/provider.dart';
import 'provider/remote/auth/sign_up_provider.dart';
import 'provider/remote/auth/sing_in_provider.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => SignUpProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => SignInProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => HomeProvider(),
      )
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        //  theme: theme,
        //  darkTheme: darkTheme,
          debugShowCheckedModeBanner: false,
          onGenerateRoute: RouteGenerator.router.onGenerate,
          initialRoute: 'splash',
        );
  }
}
