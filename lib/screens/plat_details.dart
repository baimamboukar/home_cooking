import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:home_cooking/models/plat.dart';
import 'package:home_cooking/utils/utils.dart';
import 'package:home_cooking/widgets/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:line_icons/line_icons.dart';

final numberOfCommandProvider = StateProvider<int>((ref) => 0);

class PlatDetails extends StatefulHookWidget {
  const PlatDetails({Key? key, required this.plat}) : super(key: key);
  final Plat plat;
  static const routeName = '/platdetails';

  @override
  State<PlatDetails> createState() => _PlatDetailsState();
}

class _PlatDetailsState extends State<PlatDetails> {
  @override
  Widget build(BuildContext context) {
    final numberOfCommand = useProvider(numberOfCommandProvider);
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                  bottom: Radius.elliptical(Screen.width(context), 100.0))),
          title: Text(widget.plat.name),
          expandedHeight: 150.0,
          flexibleSpace: SizedBox(
              height: 200,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 18.0, top: 20.0),
                        child: Text("${widget.plat.price.toString()} \$",
                            style: Styles.subtitle),
                      )),
                  Positioned(
                    top: 75.0,
                    left: (Screen.width(context) / 2) - 92,
                    child: CircleAvatar(
                      radius: 92.0,
                      backgroundImage: AssetImage(widget.plat.imageURL),
                    ),
                  )
                ],
              )),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(top: 100.0, left: 10.0, right: 10.0),
            child: Text(widget.plat.description, style: Styles.subtitle),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding:
                const EdgeInsets.all(20.0) + const EdgeInsets.only(top: 30.0),
            child: Container(
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Align(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: () {
                              if (numberOfCommand.state > 0) {
                                numberOfCommand.state -= 1;
                              }
                            },
                            child: const CircleAvatar(
                                child: Center(
                                    child: Icon(LineIcons.minusCircle,
                                        size: 36.0))),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child: Text("${numberOfCommand.state} plats",
                                style: Styles.subtitle),
                          ),
                          GestureDetector(
                            onTap: () {
                              numberOfCommand.state += 1;
                            },
                            child: const CircleAvatar(
                                child: Center(
                              child: Icon(LineIcons.plusCircle, size: 36.0),
                            )),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 60.0,
                      left: 120.0,
                      child: Container(
                          child: Center(
                            child: Text(
                                "\$ ${(numberOfCommand.state * widget.plat.price).ceilToDouble()}",
                                style: Styles.subtitle),
                          ),
                          height: 75.0,
                          width: 75.0,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 10.0,
                                  spreadRadius: 4.0,
                                  color: Palette.light)
                            ],
                            color: Palette.light,
                            shape: BoxShape.circle,
                          )),
                    )
                  ],
                ),
                height: 100.0,
                decoration: BoxDecoration(
                    color: Palette.primary,
                    borderRadius: BorderRadius.circular(4.0))),
          ),
        ),
        SliverToBoxAdapter(
            child: GestureDetector(
          child: Padding(
            padding: const EdgeInsets.only(left: 50.0, right: 50.0),
            child: Button(
                color: Palette.primary,
                icon: LineIcons.shoppingCartArrowDown,
                label: "Commander"),
          ),
        )),
        const SliverToBoxAdapter(
          child: Text("Vous aimeriez aussi..."),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 200.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: plats.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                    onTap: () {
                      setState(() {});
                    },
                    child: PlatCaption(plat: plats[index]));
              },
            ),
          ),
        )
      ],
    ));
  }
}
