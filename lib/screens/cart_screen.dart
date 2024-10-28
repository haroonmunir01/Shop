import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/providers/cart.dart';
import 'package:shop/widgets/cart_items.dart';

class CartScreen extends StatelessWidget {
  const CartScreen ({super.key});
  static const routeName='/Cart';

  @override
  Widget build(BuildContext context) {
    final cart=Provider.of<Cart>(context);
    return  Scaffold(
      appBar: AppBar(title:const Text(' Your Cart'),),
      body: Column(
        children: [
          Card(
          margin:const EdgeInsets.all(15),
      child: Padding(
        padding:const EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Total',style: TextStyle(fontSize: 20,),),
            const Spacer(),
            Chip(label: Text('\$${cart.totalAmount}',style:const TextStyle(color:Colors.white ),),backgroundColor: Theme.of(context).primaryColor),
            TextButton(onPressed: (){}, child: Text('Order Now',style: TextStyle(color: Theme.of(context).primaryColor),),)
          ],
        ),
      ),
      ),
          const SizedBox(width: 10,),
          Expanded(child: ListView.builder(itemCount:cart.itemCount,itemBuilder: (ctx,i)=>CartItems(
              id: cart.items.values.toList()[i].id,
              productId: cart.items.keys.toList()[i],
              title: cart.items.values.toList()[i].title,
              quantity: cart.items.values.toList()[i].quantity,
              price: cart.items.values.toList()[i].price),))
        ],
      ),
    );
    
  }
}
