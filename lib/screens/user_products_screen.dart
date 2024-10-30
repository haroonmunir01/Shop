import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/providers/products.dart';
import 'package:shop/widgets/app_drawer.dart';
import 'package:shop/widgets/user_product_item.dart';

class UserProductsScreen extends StatelessWidget {
  const UserProductsScreen({super.key});
static const routeName='/user-products';
  @override
  Widget build(BuildContext context) {
    final productData=Provider.of<Products>(context);
    return  Scaffold(
      appBar: AppBar(title:const Text('My Products'),
      actions: [
        IconButton(onPressed: (){}, icon: Icon(Icons.add))
      ],
      ),
      drawer: const AppDrawer(),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: ListView.builder(itemCount: productData.items.length,itemBuilder: (ctx,i)=>Column(
          children: [
            UserProductItem(
                productData.items[i].title!,
                productData.items[i].imageUrl!),
          const  Divider(),
          ],
        )
        ),
      ),
    );
  }
}