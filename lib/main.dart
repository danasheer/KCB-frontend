import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kcb/pages/home.dart';
import 'package:kcb/providers/auth_privise.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => AuthProvider(),
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
        path: '/',
        builder: (context, state) => Homepage(),
      ),
    ],
  );
}
