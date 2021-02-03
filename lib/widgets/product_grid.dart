import 'package:flutter/material.dart';

import './product_item.dart';
//import '../models/product.dart';

import 'package:provider/provider.dart';
import '../provider/products.dart';

class ProductGrid extends StatelessWidget {
  final bool showFavorites;

  ProductGrid(this.showFavorites);
  //const ProductGrid({
  //Key key,
  //@required this.loadedProducts,
  //}) : super(key: key);

  //final List<Product> loadedProducts;

  @override
  Widget build(BuildContext context) {
    final providerList = Provider.of<Products>(context);
    final products =
        showFavorites ? providerList.favorites : providerList.items;
    return GridView.builder(
      padding: EdgeInsets.all(10),
      itemCount: products.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (context, i) => ChangeNotifierProvider.value(
        //create: (c) => products[i],
        value: products[i],
        child: ProductItem(
            //products[i].id,
            //products[i].title,
            //products[i].imageUrl,
            ),
      ),
    );
  }
}
