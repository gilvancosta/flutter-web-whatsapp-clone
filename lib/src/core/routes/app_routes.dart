import 'package:flutter/material.dart';
import 'package:flutter_web_whatsapp/src/ui/pages/home/home_page.dart';

import '../../ui/pages/login/login_page.dart';
import '../../ui/pages/messages/messages_page.dart';

class AppRoutes {
  static Route<dynamic> createRoutes(RouteSettings settingsRoute) {
    switch (settingsRoute.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case '/login':
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case '/home':
        return MaterialPageRoute(builder: (_) => const HomePage());

      case '/messages':
        return MaterialPageRoute(builder: (_) => const MessagesPage());
    }

    return errorPageRoute();
  }

  static Route errorPageRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text('Page not found'),
        ),
        body: const Center(
          child: Text('Web Page not found'),
        ),
      ),
    );
  }
}
