/*
   a) Which methods run when a page opens for the first time?  initState, didchangeDependencies, build
   b) Which method runs again after you press the heart button? build
   c) Which methods run when you leave a page and go back? deactivate, dispose
   d) Which methods run when you resize the browser window, and why? didchangeDependencies, because we are watching the size of the screen through MediaQuery. also build
 */


import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:product_catalog/login.dart';
import 'package:product_catalog/products.dart';
import 'package:product_catalog/product_info.dart';

void main()
{
  //Pass the home page when it is done
  runApp(const MyApp(Login()));
}


final GoRouter _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const Login(),
    ),

    GoRoute(
      path: '/products',
      name: 'products',
      builder: (context, state) => Products(
        userName: state.uri.queryParameters['user'] ?? 'Guest',
      ),
    ),

    GoRoute(
      path: '/details/:name/:price',
      name: 'details',
      builder: (context, state) => Info(
        productName: state.pathParameters['name']!,
        price: int.parse(state.pathParameters['price']!),
        userName: state.uri.queryParameters['user'] ?? 'Guest',
      ),
    ),
  ],
);

class MyApp extends StatelessWidget
{
  final Widget homePage;
  const MyApp(this.homePage, {super.key});

  @override
  Widget build(BuildContext context)
  {
    return MaterialApp.router
    (
      title: 'PS4',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue,),
        textTheme: TextTheme(bodyMedium: TextStyle(fontSize: 16), titleLarge: TextStyle(fontSize: 22)),
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue, brightness: Brightness.dark),
        textTheme: TextTheme(bodyMedium: TextStyle(fontSize: 16), titleLarge: TextStyle(fontSize: 22)),
      ),
      themeMode: ThemeMode.system,
      
      /*
      initialRoute: '/',
      routes: {
        '/': (context) => const Login(),
        '/products': (context) => const Products(),
        '/info':(context) => const Info(),
      },
      */
      
      routerConfig: _router,
    );
  }
  
}
