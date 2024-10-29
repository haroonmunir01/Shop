import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shop/providers/Orders.dart';

class OrderItemWidget extends StatefulWidget {
final OrderItem order;
 OrderItemWidget(this.order);

  @override
  State<OrderItemWidget> createState() => _OrderItemWidgetState();
}

class _OrderItemWidgetState extends State<OrderItemWidget> {
  var _expanded=false;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: Column(
        children: [
          ListTile(
            title: Text("\$${widget.order.amount}"),
            subtitle: Text(DateFormat('dd/MM/yyyy hh:mm').format(widget.order.dateTime!)),
            trailing: IconButton(
              icon: Icon(_expanded ? Icons.expand_less: Icons.expand_more),
              onPressed: (){
                  setState(() {
                    _expanded=!_expanded;
                });
              },
            ),
          ),
          if(_expanded) Container(
            padding:const EdgeInsets.symmetric(horizontal: 15,vertical: 4),
            height: min(widget.order.products!.length*20.0+10, 100.0),
            child: ListView(
              children: widget.order.products!.map((prod) =>Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                      prod.title!,
                    style:const TextStyle(fontWeight:FontWeight.bold,fontSize: 18),
                  ),
                  Text('${prod.quantity}X \$${prod.price}',style: const TextStyle(fontSize: 18,color: Colors.grey),)

                ],
                )).toList(),
            ),
          )
        ],
      ),
    );
  }
}
