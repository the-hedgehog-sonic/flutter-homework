import 'package:flutter/material.dart';



class Products extends StatefulWidget
{
  const Products({super.key});

  @override
  State<Products> createState()
  {
    return _ProductState();
  }
}

class _ProductState extends State<Products>
{
  late String userName;

  @override
  void initState()
  {
    super.initState();
    print('init state: products page.');
  }

  @override
  void didChangeDependencies()
  {
    super.didChangeDependencies();
    userName = (ModalRoute.of(context)?.settings.arguments as String?) ?? 'Guest';
    print('change dependencies: products page.');
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold
    (
      body: Text('Hello $userName')
    );
  }

  @override
  void deactivate()
  {
    print('deactivate: products page.');
    super.deactivate();
  }

  @override
  void dispose()
  {
    print('dispose: products page.');
    super.dispose();
  }
}