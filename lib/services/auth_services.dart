// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:home_cooking/models/models.dart';
import 'package:home_cooking/providers/database_providers.dart';
import 'package:home_cooking/repositories/repositories.dart';

import 'package:google_sign_in/google_sign_in.dart';

class AuthService extends AuthRepository {
  final FirebaseAuth _auth;
  final Reader _read;
  AuthService(this._auth, this._read);

  @override
  Stream<User?> get getAuthUser => _auth.authStateChanges();

  @override
  Future<void> signupUser(
      {required String mail,
      required String pass,
      required Cuisinier cuisinier}) async {
    try {
      await _auth
          .createUserWithEmailAndPassword(email: mail, password: pass)
          .then((response) async {
        if (await _read(databaseProvider)
            .createUser(id: response.user!.uid, cuisinier: cuisinier)) {
          print("toast");
        } else {
          print("toast");
        }
      });
    } on FirebaseAuthException catch (err) {
      print(err);
    }
  }

  @override
  Future<void> logoutUser() async {
    try {
      await _auth.signOut();
    } on FirebaseAuthException catch (err) {
      print("hoha");
    }
  }
}
