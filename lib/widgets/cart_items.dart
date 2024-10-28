import 'package:flutter/material.dart';
import 'package:shop/providers/cart.dart';

class CartItems extends StatelessWidget {
  final String? id;
  final String? title;
  final int? quantity;
  final double? price;

  CartItems({
    @required this.id,
    @required this.title,
    @required this.quantity,
    @required this.price
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 15,vertical: 4),
      child: Padding(
        padding: EdgeInsets.all(8),
        child: ListTile(
          leading: CircleAvatar(
            child: FittedBox(child: Text('\$${price}')),
          ),
          title: Text(title!),
          subtitle:Text('Total : \$${(price!*quantity!)}') ,
          trailing: Text('$quantity  x'),
        ),
      ),
    );
  }
}
