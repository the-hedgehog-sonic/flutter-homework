import 'package:flutter/material.dart';
import 'package:product_catalog/login.dart';
import 'package:product_catalog/products.dart';

void main()
{
  //Pass the home page when it is done
  runApp(const MyApp(Login()));
}


class MyApp extends StatelessWidget
{
  final Widget homePage;
  const MyApp(this.homePage, {super.key});

  @override
  Widget build(BuildContext context)
  {
    return MaterialApp
    (
      title: 'Café',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue,),
        textTheme: TextTheme(bodyMedium: TextStyle(fontSize: 16), titleLarge: TextStyle(fontSize: 22)),
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue, brightness: Brightness.dark),
        textTheme: TextTheme(bodyMedium: TextStyle(fontSize: 16), titleLarge: TextStyle(fontSize: 22)),
      ),
      themeMode: ThemeMode.system,
      
      initialRoute: '/',
      routes: {
        '/': (context) => const Login(),
        '/products': (context) => const Products(),
      },
    );
  }
  
}