import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:moltaqa/core/routes/routes_constants.dart';

class AuthRedirector extends StatefulWidget {
  const AuthRedirector({super.key});

  @override
  State<AuthRedirector> createState() => _AuthRedirectorState();
}

class _AuthRedirectorState extends State<AuthRedirector> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _checkAuthState();
    });
  }

  Future<void> _checkAuthState() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null && mounted) {
      context.go(RoutesConstants.homeScreen);
    } else if (mounted) {
      context.go(RoutesConstants.authScreen);
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}
