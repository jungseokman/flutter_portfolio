import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_portfolio/homepage.dart';
import 'package:my_portfolio/screens/detail_page.dart';

void main() {
  runApp(MyPortfolio());
}

class MyPortfolio extends StatelessWidget {
  MyPortfolio({Key? key}) : super(key: key);

  final router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        pageBuilder: (context, state) => MaterialPage<void>(
          key: state.pageKey,
          child: Homepage(),
        ),
      ),
      GoRoute(
        path: '/detail/:id',
        pageBuilder: (context, state) => MaterialPage(
          child: DetailPage(
            id: state.params['id']!,
          ),
        ),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: router.routerDelegate,
      routeInformationParser: router.routeInformationParser,
      routeInformationProvider: router.routeInformationProvider,
    );
  }
}
