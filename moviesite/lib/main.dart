import 'package:flutter/material.dart';
import 'homepage.dart';

void main()
{
  runApp(const MyApp());
}


//my app returns the root widget (fills the whole screen) which is a material app in our case.
class MyApp extends StatelessWidget
{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context)
  {
    const String appTitle = 'EgyBest';          //why is this a local vvariable and not an attribute of the class?
    return MaterialApp
    (
      title: appTitle,
      theme: ThemeData.dark(useMaterial3: true),
      home: HomePage(),
    );
  }
}