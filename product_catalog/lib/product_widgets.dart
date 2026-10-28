// ============================================================
//  HELPER FILE: Product widgets
// ============================================================
//  Ready widgets to show a list of products.
//  Use ProductsListView or ProductsGridView inside your page.
//
//  Each product is a Map like: {"name": "Laptop", "price": 1200}
//
//  Example:
//  ProductsListView(
//    products: products,
//    onFavoritePressed: () {
//      setState(() {
//        favorites++;
//      });
//    },
//    onProductTap: (index) {
//      print(products[index]["name"]);
//    },
//  )

import 'package:flutter/material.dart';

class ProductsListView extends StatelessWidget {
  final List<Map<String, dynamic>> products;
  final void Function(int index) onFavoritePressed;
  final Set<int> favorites;
  final void Function(int index) onCartPressed;
  final Set<int> cart;
  final void Function(int index) onProductTap;

  const ProductsListView({super.key, 
    required this.products,
    required this.onFavoritePressed,
    required this.favorites,
    required this.onCartPressed,
    required this.cart,
    required this.onProductTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        return ProductTile(
          name: products[index]["name"],
          price: products[index]["price"],
          onFavoritePressed: () {
            onFavoritePressed(index);
          },
          isFavorite: favorites.contains(index),
          onCartPressed: (){
            onCartPressed(index);
          },
          isInCart: cart.contains(index),
          onTap: () {
            onProductTap(index);
          },
        );
      },
    );
  }
}

class ProductsGridView extends StatelessWidget {
  final List<Map<String, dynamic>> products;
  final void Function(int index) onFavoritePressed;
  final Set<int> favorites;
  final void Function(int index) onCartPressed;
  final Set<int> cart;
  final void Function(int index) onProductTap;

  const ProductsGridView({super.key, 
    required this.products,
    required this.onFavoritePressed,
    required this.favorites,
    required this.onCartPressed,
    required this.cart,
    required this.onProductTap,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: products.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 4,
      ),
      itemBuilder: (context, index) {
        return ProductTile(
          name: products[index]["name"],
          price: products[index]["price"],
          onFavoritePressed: () {
            onFavoritePressed(index);
          },
          isFavorite: favorites.contains(index),
          onCartPressed: (){
            onCartPressed(index);
          },
          isInCart: cart.contains(index),
          onTap: () {
            onProductTap(index);
          },
        );
      },
    );
  }
}

class ProductTile extends StatelessWidget 
{
  final bool isFavorite;
  final bool isInCart;
  final String name;
  final int price;
  final void Function() onFavoritePressed;
  final void Function() onCartPressed;
  final void Function() onTap;

  const ProductTile({super.key,
    required this.name,
    required this.price,
    required this.isFavorite,
    required this.isInCart,
    required this.onFavoritePressed,
    required this.onCartPressed,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(name),
        subtitle: Text("EGP ${price}"),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(isInCart ? Icons.shopping_cart : Icons.shopping_cart_outlined),
              color: isInCart ? Colors.green : null,
              onPressed: onCartPressed,
            ),

            IconButton(
              icon: Icon(isFavorite? Icons.favorite : Icons.favorite_border),
              color: isFavorite? Colors.red : null,
              onPressed: onFavoritePressed,
            ),
          ],
        ),
        onTap: onTap,
      ),
    );
  }
}
  