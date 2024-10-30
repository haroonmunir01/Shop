import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/providers/Orders.dart';
import 'package:shop/providers/cart.dart';
import 'package:shop/screens/cart_screen.dart';
import 'package:shop/screens/orders_screen.dart';
import 'package:shop/screens/product_detail_screen.dart';
import 'package:shop/screens/products_overview_screen.dart';
import 'package:shop/screens/user_products_screen.dart';
import './providers/products.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
        ChangeNotifierProvider(create: (ctx)=>Products(),),
        ChangeNotifierProvider(create: (ctx)=>Cart(),),
      ChangeNotifierProvider(create: (ctx)=>Orders(),),
    ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Shop',
        theme: ThemeData(
          primarySwatch: Colors.purple,
          appBarTheme:const AppBarTheme(
            backgroundColor: Colors.purple
          ),
          colorScheme: ColorScheme.fromSwatch(accentColor: Colors.deepOrange),
           fontFamily: 'Lato',

        ),
        home: ProductsOverviewScreen(),
        routes: {
          ProductDetailScreen.routeName: (context) =>const ProductDetailScreen(),
          CartScreen.routeName:(context)=>const CartScreen(),
          OrdersScreen.routeName:(context)=>const OrdersScreen(),
          UserProductsScreen.routeName:(context)=>const UserProductsScreen(),
        },
      ),
    );
  }
}

