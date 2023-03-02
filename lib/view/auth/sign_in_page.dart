import 'package:flutter/material.dart';
import 'package:organico/core/widgets/loading_widget.dart';
import 'package:provider/provider.dart';

import '../../provider/remote/auth/sing_in_provider.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    SignInProvider provider = Provider.of<SignInProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Sign in",
        ),
      ),
      body: provider.isLoading
          ? const Center(child: LoadingWidget())
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    """It looks like you have an account on this email. Please use Sign in  for registering""",
                    style: TextStyle(fontSize: 20),
                  ),
                  TextFormField(
                    controller: provider.emailController,
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.email),
                        hintText: "Email",
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color(0xffEAEAEA), width: 2),
                            borderRadius: BorderRadius.circular(100)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color(0xffEAEAEA), width: 2),
                            borderRadius: BorderRadius.circular(100))),
                  ),
                  TextFormField(
                    controller: provider.passwordController,
                    obscureText: provider.isHide,
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.lock),
                        suffixIcon: IconButton(
                            onPressed: () {
                              provider.changeObscure();
                            },
                            icon: provider.isHide
                                ? const Icon(Icons.remove_red_eye_rounded)
                                : const Icon(Icons.remove_red_eye_outlined)),
                        hintText: "Password",
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color(0xffEAEAEA), width: 2),
                            borderRadius: BorderRadius.circular(100)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color(0xffEAEAEA), width: 2),
                            borderRadius: BorderRadius.circular(100))),
                  ),
                  SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () async {
                          await provider.signIn().then((response) {
                            if (response) {
                              Navigator.pushNamedAndRemoveUntil(
                                  context, '/', (route) => false);
                            }
                          });
                        },
                        style: ElevatedButton.styleFrom(
                            shape: const StadiumBorder(),
                            padding: const EdgeInsets.all(15)),
                        child: const Text("Sign in"),
                      )),
                ],
              ),
            ),
    );
  }
}
