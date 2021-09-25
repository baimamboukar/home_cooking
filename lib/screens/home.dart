import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:home_cooking/providers/auth_providers.dart';
import 'package:home_cooking/providers/providers.dart';
import 'package:home_cooking/utils/palette.dart';
import 'package:home_cooking/utils/utils.dart';
import 'package:home_cooking/widgets/widgets.dart';
import 'package:line_icons/line_icons.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

class Home extends HookWidget {
  const Home({Key? key}) : super(key: key);
  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                  bottom: Radius.elliptical(Screen.width(context), 100.0))),
          title: const Text("Home Cooking"),
          actions: [
            GestureDetector(
                onTap: () {
                  Get.toNamed('/login');
                },
                child: const Icon(LineIcons.alternateSignOut)),
            GestureDetector(
                onTap: () {
                  useProvider(authProvider).logoutUser();
                },
                child: const Icon(LineIcons.bell))
          ],
          bottom: PreferredSize(
            preferredSize: Size(Screen.width(context), 120),
            child: Container(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(14.0) +
                        const EdgeInsets.only(left: 10.0, right: 10.0),
                    child: Container(
                      child: const TextField(
                        decoration: InputDecoration(
                            icon: Icon(LineIcons.search),
                            border: InputBorder.none,
                            hintText: "Search..."),
                      ),
                      height: 50,
                      decoration: BoxDecoration(
                          color: Palette.light,
                          borderRadius: BorderRadius.circular(8.0)),
                    ),
                  ),
                  const Center(child: Icon(LineIcons.pizzaSlice, size: 48.0))
                ],
              ),
              height: 150.0,
              decoration: BoxDecoration(
                  color: Colors.teal,
                  borderRadius: BorderRadius.vertical(
                      bottom: Radius.elliptical(Screen.width(context), 75.0))),
            ),
          ),
        ),
        body: tab(),
        bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 3.0,
          child: SizedBox(
            height: 60.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                NavItem(icon: LineIcons.home, position: 0, label: "Home"),
                NavItem(icon: Icons.food_bank, position: 1, label: "Foods"),
                NavItem(icon: Icons.local_drink, position: 2, label: "Drinks"),
                NavItem(
                    icon: LineIcons.userCircle, position: 3, label: "Profile")
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            print("visiting shopping cart");
          },
          child: const Icon(LineIcons.shoppingCart),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}

Widget label(String label, IconData icon) {
  return Column(
    children: [Icon(icon), Text(label)],
  );
}

Widget tab() {
  return SingleChildScrollView(
      child: Column(
    children: [
      const Text("Proposes"),
      const SizedBox(
        height: 10.0,
      ),
      Container(
        height: 200.0,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (context, index) {
            return food();
          },
        ),
      ),
      Center(
          child: Text(
              useProvider(cuisinierControllerProvider.notifier).cuisinier.name))
    ],
  ));
}

Widget food() {
  return Padding(
    padding: const EdgeInsets.all(14.0),
    child: Card(
      color: Palette.primary.withOpacity(0.2),
      child: Container(
          height: 120.0,
          width: 200.0,
          child: Column(
            children: [
              const SizedBox(height: 20.0),
              Image.asset("assets/images/flutter_logo.png"),
              const Text("Nom de la recette"),
              const Text("Cuisinier pro"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text("Prix: \$12.0"),
                  Icon(LineIcons.shoppingBag),
                ],
              )
            ],
          )),
    ),
  );
}
