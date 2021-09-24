import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:home_cooking/controllers/user_controller.dart';
import 'package:home_cooking/models/models.dart';

final cuisinierControllerProvider =
    StateNotifierProvider.autoDispose<CuisinierController, Cuisinier>((ref) =>
        CuisinierController(
            ref.read,
            Cuisinier(
                adress: "Maroua, Doualare",
                name: "Mai-naama",
                email: "cuisinier.pro@home_cooking.com")));
