import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:home_cooking/models/plat.dart';
import 'package:home_cooking/utils/palette.dart';
import 'package:home_cooking/utils/styles.dart';
import 'package:line_icons/line_icons.dart';

class PlatCaption extends HookWidget {
  const PlatCaption({Key? key, required this.plat}) : super(key: key);
  final Plat plat;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed('/platdetails', arguments: plat),
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Card(
          color: Palette.primary,
          child: AspectRatio(
            aspectRatio: 16 / 9,
            child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Stack(
                    children: [
                      Text(plat.name,
                          style: Styles.designText(
                              bold: true, color: Palette.primary, size: 22.0)),
                      const Align(
                          alignment: Alignment.topRight,
                          child: Icon(LineIcons.shoppingBag)),
                      Align(
                          alignment: Alignment.bottomLeft,
                          child: Text("\$ ${plat.price.toString()}",
                              style: Styles.subtitle)),
                      Align(
                          alignment: Alignment.centerRight,
                          child: Hero(
                            tag: DateTime.now().toString(),
                            child: CircleAvatar(
                              radius: 100.0,
                              backgroundImage: AssetImage(plat.imageURL),
                            ),
                          )),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Column(
                            children: [
                              const SizedBox(height: 30.0),
                              Row(
                                children: [
                                  const Icon(LineIcons.userCircle),
                                  Text(plat.cuisiner.name)
                                ],
                              ),
                              Row(
                                children: [
                                  const Icon(LineIcons.mapMarker),
                                  Text(plat.cuisiner.adress)
                                ],
                              ),
                            ],
                          ))
                    ],
                  ),
                ),
                decoration: BoxDecoration(
                    color: Palette.light,
                    borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(200.0),
                        bottomLeft: Radius.elliptical(200, 100)),
                    boxShadow: const [BoxShadow()])),
          ),
        ),
      ),
    );
  }
}
