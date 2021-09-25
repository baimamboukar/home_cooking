import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:home_cooking/providers/auth_providers.dart';
import 'package:home_cooking/providers/database_providers.dart';
import 'package:home_cooking/screens/screens.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Root extends HookWidget {
  const Root({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = useProvider(authStateProvider);
    final database = useProvider(databaseProvider);
    return user.when(
        loading: () => Scaffold(
                body: Container(
              color: Colors.black26,
              child: const CircularProgressIndicator(),
            )),
        error: (_, __) => const Text("Something went wrong"),
        data: (authenticatedUser) {
          if (authenticatedUser != null) {
            database.getUser(authenticatedUser.uid);
            return const Home();
          } else {
            return const Signup();
          }
        });
  }
}
