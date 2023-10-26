import 'package:flutter/material.dart';
import 'package:ielts_vocabulary_app/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          useMaterial3: true,
        ),
        routes: Routes.buildRoutes(),
        initialRoute: Routes.LOGIN_SCREEN,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
