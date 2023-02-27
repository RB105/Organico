import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:organico/core/widgets/loading_widget.dart';
import 'package:organico/provider/remote/sign_up_provider.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    SignUpProvider provider = Provider.of<SignUpProvider>(context);
    return ChangeNotifierProvider(
      create: (context) => SignUpProvider(),
      builder: (context, child) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: provider.isLoading
              ? const Center(
                  child: LoadingWidget(),
                )
              : SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: Center(
                            child: SizedBox(
                              child:
                                  SvgPicture.asset('assets/images/Welcome.svg'),
                            ),
                          ),
                        ),
                        Row(
                          children: const [
                            Text(
                              "Welcome",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Row(
                          children: const [
                            Text(
                              """Welcome to Organico Mobile Apps. Please fill in 
the field below to sign in""",
                              style: TextStyle(
                                  color: Color(0xff92929D), fontSize: 16),
                            )
                          ],
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
                                      : const Icon(
                                          Icons.remove_red_eye_outlined)),
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            InkWell(
                              onTap: () {},
                              child: const Text(
                                "Forgot password",
                                style: TextStyle(
                                    color: Color(0xff2ECC71), fontSize: 16),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () async {
                                await provider.signUp().then((response) {
                                  if (response) {
                                    Navigator.pushNamedAndRemoveUntil(
                                        context, '/', (route) => false);
                                  } else if (response == false &&
                                      provider.isRegisteredBefore) {
                                    Navigator.pushNamed(context, 'signIn');
                                  }
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                  shape: const StadiumBorder(),
                                  padding: const EdgeInsets.all(15)),
                              child: const Text("Sign Up"),
                            )),
                      ],
                    ),
                  ),
                ),
        );
      },
    );
  }
}
