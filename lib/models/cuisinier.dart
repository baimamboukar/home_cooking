import 'dart:convert';

class Cuisinier {
  final String name;
  final String adress;
  final String email;

  Cuisinier({
    required this.name,
    required this.adress,
    required this.email,
  });

  Cuisinier copyWith({
    String? name,
    String? adress,
    String? email,
  }) {
    return Cuisinier(
      name: name ?? this.name,
      adress: adress ?? this.adress,
      email: email ?? this.email,
    );
  }

  Map<String, dynamic> toDocumentSnapshot() {
    return {
      'name': name,
      'adress': adress,
      'email': email,
    };
  }

  factory Cuisinier.fromDocumentSnapshot(Map<String, dynamic> map) {
    return Cuisinier(
      name: map['name'],
      adress: map['adress'],
      email: map['email'],
    );
  }

  String toJson() => json.encode(toDocumentSnapshot());

  factory Cuisinier.fromJson(String source) =>
      Cuisinier.fromDocumentSnapshot(json.decode(source));

  @override
  String toString() => 'Cuisinier(name: $name, adress: $adress, email: $email)';
}
