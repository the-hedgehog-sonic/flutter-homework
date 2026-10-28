import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class Info extends StatefulWidget
{
  final String userName;
  final String productName;
  final int price;

  const Info({
    super.key,
    required this.userName, 
    required this.productName,
    required this.price,
    });

  @override
  State<Info> createState()
  {
    return _InfoState();
  }
}

class _InfoState extends State<Info>
{
  

  @override
  void initState()
  {
    super.initState();
    print('init state: info page.');
  }

  @override
  void didChangeDependencies()
  {
    super.didChangeDependencies();

    /*final args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    userName = args?['user_name'] ?? 'Guest';
    productName = args?['name'] ?? 'Unknown';
    price = args?['price'] ?? 0; */

    print('change dependencies: info page.');
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold
    (
      appBar: AppBar(
        title: Text('Welcome, ${widget.userName}', style: Theme.of(context).textTheme.titleLarge),
        backgroundColor: Theme.of(context).colorScheme.surface,
      ),

      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 400, maxHeight: 400),
          child: Container(
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.all(20),
              width: 400,
              height: 400,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surfaceContainer,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  //Add a message at the top left later
                  //Text('Product Info', style: Theme.of(context).textTheme.headlineMedium),

                  Text(widget.productName, style: Theme.of(context).textTheme.titleLarge),
                  const SizedBox(height: 10, width: 30),
                  Text('${widget.price}', style: Theme.of(context).textTheme.titleMedium),
                  const SizedBox(height: 50),
                  ElevatedButton(
                    onPressed: _buy,
                    child: const Text('Buy'),
                  ),
                ],
              ),
            )
          ),
        )
    );
  }

  void _buy()
  {
    //Navigator.pop(context, {'bought': true});
    context.pop({
    'bought': true,
    'message': '${widget.productName} added to cart',
    });
  }

  @override
  void deactivate()
  {
    print('deactivate: info page.');
    super.deactivate();
  }

  @override
  void dispose()
  {
    print('dispose: info page.');
    super.dispose();
  }
}