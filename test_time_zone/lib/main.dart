import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:test_time_zone/app/data/provider/time_zone_provider.dart';

import 'app/screens/HomePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TimeZoneProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Time Zone App',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: HomePage(),
      ),
    );
  }
}
