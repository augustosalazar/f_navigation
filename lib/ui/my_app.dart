import 'package:f_navigation/ui/pages/page1.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'pages/page2.dart';
import 'pages/page3a.dart';
import 'pages/page3b.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/page1',
      getPages: [
        GetPage(name: '/page1', page: () => const Page1()),
        GetPage(name: '/page2', page: () => Page2()),
        GetPage(name: '/page3a', page: () => const Page3A()),
        GetPage(name: '/page3b', page: () => Page3B()),
      ],
    );
  }
}
