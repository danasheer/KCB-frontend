import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kcb/pages/home.dart';
import 'package:kcb/pages/landing.dart';
import 'package:kcb/pages/login.dart';
import 'package:kcb/pages/branches.dart';
import 'package:kcb/providers/auth_provider.dart';
import 'package:kcb/providers/branch_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => AuthProvider(),
      ),
      ChangeNotifierProvider(
        create: (_) => BranchProvider(),
      ),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routeInformationParser: _router.routeInformationParser,
      routerDelegate: _router.routerDelegate,
    );
  }

  final _router = GoRouter(
    // initialLocation: '/create_group',
    routes: [
      GoRoute(
        path: '/home',
        builder: (context, state) => LandingPage(),
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => LogIn(),
      ),
      GoRoute(
        path: '/',
        builder: (context, state) => Homepage(),
      ),
      GoRoute(
        path: '/branches',
        builder: (context, state) => BranchPage(),
      ),
    ],
  );
}
