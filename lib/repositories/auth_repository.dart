import 'package:firebase_auth/firebase_auth.dart';
import 'package:home_cooking/models/models.dart';

abstract class AuthRepository {
  Stream<User?> get getAuthUser;
  Future<void> signupUser(
      {required String mail,
      required String pass,
      required Cuisinier cuisinier});
  Future<void> logoutUser();
  Future<void> loginUser({required String mail, required String pass});
}
