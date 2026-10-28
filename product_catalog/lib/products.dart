import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:product_catalog/product_widgets.dart';
import 'package:product_catalog/products_list.dart';


class Products extends StatefulWidget
{
  final String userName;
  const Products({super.key, required this.userName});

  @override
  State<Products> createState()
  {
    return _ProductState();
  }
}

class _ProductState extends State<Products>
{
  //late String userName;
  final productsList = ProductsList;
  Set<int> favorites = {};
  Set<int> cartIndexes = {};
  Size screenSize = Size.zero;

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

    screenSize = MediaQuery.sizeOf(context);
    //userName = (ModalRoute.of(context)?.settings.arguments as String?) ?? 'Guest';

    print('change dependencies: products page -> Size: $screenSize, Width: ${screenSize.width}, Height: ${screenSize.height},');
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold
    (
      /*appBar: AppBar(
        title: Text('Welcome, $userName', style: Theme.of(context).textTheme.titleLarge),
        backgroundColor: Theme.of(context).colorScheme.surface,
      ),*/

      appBar: AppBar(
        title: Text('Welcome, ${widget.userName}', style: Theme.of(context).textTheme.titleLarge),
        backgroundColor: Theme.of(context).colorScheme.surface,
      ),

      body: Container(
        padding: const EdgeInsets.all(16.0),
        margin: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10,),
            Text('Favorites: ${favorites.length}', style: Theme.of(context).textTheme.titleLarge),
            SizedBox(height: 20, width: 10),
            SizedBox(height: 40,),
            Expanded(child: _layout()),
          ],
        ),
      )
    );
  }

  Widget _layout()
  {
    if (screenSize.width < 600)
    {
      return ProductsListView(
        products: productsList, 
        onFavoritePressed: _onFavoritePressed, 
        favorites: favorites,
        onCartPressed: _onCartPressed,
        cart: cartIndexes,
        onProductTap: _onProductTap);
    }
    
    return ProductsGridView(
      products: productsList, 
        onFavoritePressed: _onFavoritePressed, 
        favorites: favorites,
        onCartPressed: _onCartPressed,
        cart: cartIndexes,
        onProductTap: _onProductTap);
  }

  //The same product can be pressed multiple times and added to the counter
  void _onFavoritePressed(int index)
  {
    setState(() {
      if (favorites.contains(index))
      {
        favorites.remove(index);
      }
      else 
      {
        favorites.add(index);
      }
    });
  }

  void _onCartPressed(int index)
  {
    if (cartIndexes.contains(index))
    {
      setState(() => cartIndexes.remove(index));
    }
    else
    {
      _onProductTap(index);
    }
  }

  Future<void> _onProductTap(int index) async
  {
    final product = productsList[index];

    /*final result = await Navigator.pushNamed(
      context,
      '/info',
      arguments: {
        'user_name': userName,
        'name': product['name'],
        'price': product['price'],
      },
    );*/

    final name = Uri.encodeComponent(product['name'] as String);
    final price = product['price'];
    final user = Uri.encodeComponent(widget.userName);

    final result = await context.push('/details/$name/$price?user=$user');

    if (!mounted) return;
    if (result is Map && result['bought'] == true)
    {
      setState(() => cartIndexes.add(index));
    }
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


