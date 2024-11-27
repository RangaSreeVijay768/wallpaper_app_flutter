import 'package:basic/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:path/path.dart';

final GoRouter router = GoRouter(routes: [
  GoRoute(
      path: '/',
      builder: (context, state) {
        return MyHomePage(title: "Demo HomeScreen ",);
      }),
]);
