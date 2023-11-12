import "package:flutter/material.dart";
import "package:flutter_web_whatsapp/src/core/routes/app_routes.dart";

import "core/ui/default_colors/default_colors.dart";

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter WhatsApp Clone",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: DefaultColors.primaryColor),
        // useMaterial3: true,
      ),
      initialRoute: "/",
      onGenerateRoute: AppRoutes.createRoutes,
    );
  }
}
