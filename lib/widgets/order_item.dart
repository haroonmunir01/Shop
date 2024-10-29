import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shop/providers/Orders.dart';

class OrderItemWidget extends StatelessWidget {
final OrderItem order;
OrderItemWidget(this.order);
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: Column(
        children: [
          ListTile(
            title: Text("\$${order.amount}"),
            subtitle: Text(DateFormat('dd/MM/yyyy hh:mm').format(order.dateTime!)),
            trailing: IconButton(
              icon: const Icon(Icons.expand_more),
              onPressed: (){

              },
            ),
          )
        ],
      ),
    );
  }
}
