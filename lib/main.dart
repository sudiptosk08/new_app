import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:new_app/core/logger/logger.dart';
import 'package:new_app/src/features/search/controller/search_controller.dart';
import 'package:new_app/style/kColors.dart';

import 'core/network/network_utils.dart';
import 'src/features/search/search_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
  runApp(ProviderScope(observers: [Logger()], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        ref.read(searchProvider.notifier).fetchSearchItem("quran","50","1");
        return MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            pageTransitionsTheme: const PageTransitionsTheme(builders: {
              TargetPlatform.android: CupertinoPageTransitionsBuilder(),
              TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
            }),
            primaryColor: KColor.primary,
            textTheme: Typography.material2018().black,
            backgroundColor: KColor.white,
            scaffoldBackgroundColor: KColor.white,
          ),
          home: SearchPage(),
        );
      },
    );
  }
}
