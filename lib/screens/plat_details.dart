import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:home_cooking/models/plat.dart';
import 'package:home_cooking/utils/utils.dart';

class PlatDetails extends HookWidget {
  const PlatDetails({Key? key, required this.plat}) : super(key: key);
  final Plat plat;
  static const routeName = '/platdetails';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Palette.primary,
        body:
            CustomScrollView(slivers: [SliverAppBar(title: Text(plat.name))]));
  }
}
