import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:home_cooking/models/models.dart';
import 'package:home_cooking/models/models.dart';

class CuisinierController extends StateNotifier<Cuisinier> {
  final Reader _read;
  CuisinierController(this._read, Cuisinier cuisinier) : super(cuisinier);
  Cuisinier get cuisinier => state;

  set data(Cuisinier _cuisinier) => state = _cuisinier;

  String getName() {
    return state.name;
  }
}
