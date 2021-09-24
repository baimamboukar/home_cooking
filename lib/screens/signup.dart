import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/utils.dart';
import 'package:home_cooking/models/models.dart';
import 'package:home_cooking/providers/auth_providers.dart';
import 'package:home_cooking/utils/palette.dart';
import 'package:home_cooking/utils/styles.dart';
import 'package:home_cooking/utils/utils.dart';
import 'package:home_cooking/widgets/widgets.dart';
import 'package:line_icons/line_icons.dart';

class Signup extends ConsumerWidget {
  const Signup({Key? key}) : super(key: key);
  static const routeName = '/signup';
  static final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final emailController = TextEditingController();
    final usernameController = TextEditingController();
    final passwordController = TextEditingController();
    final adressController = TextEditingController();

    final _auth = watch(authProvider);

    return Scaffold(
        backgroundColor: Palette.primary,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                  height: 150.0,
                  child: Column(
                    children: [
                      const SizedBox(height: 10.0),
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
                        top: Radius.elliptical(Screen.width(context), 100.0))),
                child: Form(
                    key: _formKey,
                    child: Column(children: [
                      const SizedBox(height: 30.0),
                      Input(
                        icon: LineIcons.userCircle,
                        context: context,
                        type: TextInputType.text,
                        controller: usernameController,
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
                        icon: Icons.email,
                        context: context,
                        type: TextInputType.text,
                        controller: emailController,
                        label: "email",
                        hint: "Enter your username",
                        isPassword: false,
                        isPhone: false,
                        validator: (value) {
                          return !GetUtils.isEmail(value!)
                              ? "Entrez un nom valide"
                              : null;
                        },
                      ),
                      Input(
                        icon: LineIcons.mapMarked,
                        context: context,
                        type: TextInputType.text,
                        controller: adressController,
                        label: "adress",
                        hint: "Enter your adress",
                        isPassword: false,
                        isPhone: false,
                        validator: (value) {
                          return !(value!.length > 8)
                              ? "Entrez une adresse valide"
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
                          return !(value!.length > 5)
                              ? "Entrez un mot de passe valide"
                              : null;
                        },
                      ),
                      const SizedBox(height: 10.0),
                      GestureDetector(
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            Cuisinier _cuisinier = Cuisinier(
                                name: usernameController.value.text,
                                email: emailController.value.text,
                                adress: passwordController.value.text);
                            _auth.signupUser(
                                mail: emailController.value.text,
                                pass: passwordController.value.text,
                                cuisinier: _cuisinier);
                          }
                        },
                        child: Button(
                          label: "Signup",
                          icon: LineIcons.userPlus,
                          color: Palette.primary,
                        ),
                      ),
                      const SizedBox(height: 6.0),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed('/login');
                        },
                        child: Text("Already have an account ? Signup there !",
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
                          label: "Signup with facebook",
                          color: Colors.blueAccent),
                      const SocialButton(
                          icon: LineIcons.googleLogo,
                          label: "Signup with google",
                          color: Colors.redAccent)
                    ])),
              ),
            ],
          ),
        ));
  }
}
