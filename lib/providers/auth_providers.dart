import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:home_cooking/services/services.dart';

final firebaseAuthProvider = Provider<FirebaseAuth>((ref) {
  return FirebaseAuth.instance;
});
final authProvider = Provider<AuthService>((ref) {
  return AuthService(ref.read(firebaseAuthProvider), ref.read);
});

final authStateProvider = StreamProvider.autoDispose<User?>(
    (ref) => ref.watch(authProvider).getAuthUser);
