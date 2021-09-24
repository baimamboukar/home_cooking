import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:home_cooking/utils/palette.dart';
import 'package:home_cooking/utils/styles.dart';
import 'package:home_cooking/utils/utils.dart';
import 'package:home_cooking/widgets/widgets.dart';
import 'package:line_icons/line_icons.dart';

final stayConnectedProvider = StateProvider<bool>((ref) => false);

class Login extends ConsumerWidget {
  const Login({Key? key}) : super(key: key);
  static const routeName = '/login';

  static final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final stayConnected = watch(stayConnectedProvider);

    return SafeArea(
      child: Scaffold(
          backgroundColor: Palette.primary,
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                    height: 150.0,
                    child: Column(
                      children: [
                        const SizedBox(height: 20.0),
                        Image.asset("assets/images/flutter_logo.png"),
                        const SizedBox(height: 20.0),
                        Text("Home Cooking", style: Styles.subtitle),
                      ],
                    )),
                Container(
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 25.0,
                            spreadRadius: 6.0,
                            color: Palette.light)
                      ],
                      color: Palette.light,
                      borderRadius: BorderRadius.vertical(
                          top:
                              Radius.elliptical(Screen.width(context), 100.0))),
                  child: Form(
                      key: _formKey,
                      child: Column(children: [
                        const SizedBox(height: 30.0),
                        Input(
                          icon: LineIcons.userCircle,
                          context: context,
                          type: TextInputType.text,
                          controller: emailController,
                          label: "username",
                          hint: "Enter your username",
                          isPassword: false,
                          isPhone: false,
                          validator: (value) {
                            return !(value!.length > 5)
                                ? "Entrez un nom valide"
                                : null;
                          },
                        ),
                        Input(
                          icon: LineIcons.lockOpen,
                          context: context,
                          type: TextInputType.text,
                          controller: passwordController,
                          label: "password",
                          hint: "Enter your password",
                          isPassword: true,
                          isPhone: false,
                          validator: (value) {
                            return !GetUtils.isEmail(value!)
                                ? "Entrez un email valide"
                                : null;
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0) +
                              const EdgeInsets.only(left: 20.0, right: 25.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CupertinoSwitch(
                                value: stayConnected.state,
                                onChanged: (value) {
                                  stayConnected.state = value;
                                },
                                activeColor: Palette.primary,
                              ),
                              Text("Stay connected?", style: Styles.subtitle)
                            ],
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        GestureDetector(
                          onTap: () {
                            _formKey.currentState?.validate();
                          },
                          child: Button(
                            label: "Login",
                            icon: LineIcons.signature,
                            color: Palette.primary,
                          ),
                        ),
                        const SizedBox(height: 6.0),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed('/signup');
                          },
                          child: Text("Don't have an account ? Signup there !",
                              style: Styles.designText(
                                  color: Palette.primary,
                                  bold: false,
                                  size: 18.0)),
                        ),
                        const SizedBox(height: 10.0),
                        const Text("OR"),
                        const SizedBox(height: 14.0),
                        const SocialButton(
                            icon: LineIcons.facebookF,
                            label: "Login with facebook",
                            color: Colors.blueAccent),
                        const SocialButton(
                            icon: LineIcons.googleLogo,
                            label: "Login with google",
                            color: Colors.redAccent)
                      ])),
                ),
              ],
            ),
          )),
    );
  }
}
