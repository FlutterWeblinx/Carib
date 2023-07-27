import 'package:carib/Screens/country_select.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Carib Auto Parts',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
          backgroundColor: Colors.white70,
          titleTextStyle: TextStyle(
              color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold),
          elevation: 0,
        ),
        scaffoldBackgroundColor: Colors.white70,
        iconTheme: const IconThemeData(
          color: Colors.black, //change your color here
        ),
        primarySwatch: Colors.green,
      ),
      home: const MyCountryPicker(),
    );
  }
}
