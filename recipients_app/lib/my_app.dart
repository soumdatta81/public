import 'package:app/models/alert_visibility.dart';
import 'package:app/models/registration.dart';
import 'package:app/theme/theme.dart';
import 'package:app/view/pages/main_app_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/current_user.dart';
import 'view/pages/welcome_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Widget start;
    if (FirebaseAuth.instance.currentUser == null) {
      start = const WelcomePage();
    } else {
      start = MainAppPage();
    }

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Registration()),
        ChangeNotifierProvider(create: (context) => CurrentUser()),
        ChangeNotifierProvider(create: (context) => AlertVisibility())
      ],
      child: MaterialApp(
        title: 'Profile Page',
        theme: socialIncomeTheme,
        home: start,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
