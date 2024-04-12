import 'package:flutter/material.dart';
import 'package:iotapp/home_page.dart';
// import 'package:iotapp/configuration.dart';
// import 'package:iotapp/home_page.dart';
import 'package:iotapp/my_pills.dart';
import 'package:iotapp/providers/pills_provider.dart';
// import 'package:iotapp/my_pills_edit.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DataProvider(), // Instancia del proveedor
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        ),
        home: HomePage(),
      ),
    );
  }
}
