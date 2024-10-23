import 'package:flutter/material.dart';
import '../models/cart_item.dart';

class Cart with ChangeNotifier{
Map<String,CartItem>? _items={};

Map<String,CartItem> get items{
  return {...?_items};
}

int get itemCount{
  return _items!.length;
}

void addItem(String productId,String title,double price){
  if(_items!.containsKey(productId)){
_items!.update(productId, (exsitingCartItem) => CartItem(id:exsitingCartItem.id, title: exsitingCartItem.title, quantity: (exsitingCartItem.quantity!+1), price: exsitingCartItem.price));
  }
  else {
    _items?.putIfAbsent(productId, () => CartItem(id: DateTime.now().toString(), title: title, quantity: 1, price: price));
  }
  notifyListeners();
}
}