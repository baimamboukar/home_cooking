import 'package:home_cooking/models/models.dart';

class Plat {
  final Cuisinier cuisiner;
  final double price;
  final String imageURL;
  final String name;
  final String description;
  Plat({
    required this.cuisiner,
    required this.price,
    required this.imageURL,
    required this.name,
    required this.description,
  });
}
