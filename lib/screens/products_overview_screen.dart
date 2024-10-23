import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/providers/cart.dart';
import 'package:shop/widgets/badge.dart';
import '../widgets/products_grid.dart';

enum filterOptions{
  favorite,
  all,
}

class ProductsOverviewScreen extends StatefulWidget {


  @override
  State<ProductsOverviewScreen> createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  var _showOnlyFavorites=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Shop'),
        actions: <Widget>[
          PopupMenuButton(
            onSelected: (filterOptions Selectedvalue){
              setState(() {
                if(Selectedvalue==filterOptions.favorite){
                  _showOnlyFavorites=true;
                }
                else{
                  _showOnlyFavorites=false;
                }
              });

            },
              icon: Icon(Icons.more_vert),
              itemBuilder: (_)=>[
          const PopupMenuItem(value: filterOptions.favorite, child: Text('Favorites')),
          const PopupMenuItem(value: filterOptions.all, child: Text('All')),
          ]),
          Consumer<Cart>(builder: (ctx,cart,ch)=>Badges(child: ch,
            value:cart.itemCount.toString(),
          ),
           child: IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: (){},
            ),
          ),
        ],),
        body: ProductsGrid(_showOnlyFavorites)
    );
  }
}


