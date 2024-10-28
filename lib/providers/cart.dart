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

double get totalAmount{
  var total=0.0;
  _items!.forEach((key, value) {
    total+=value.price! * value.quantity!;
  });
  return total;
}

void addItem(String productId,String title,double price){
  if(_items!.containsKey(productId)){
_items!.update(productId, (existingCartItem) => CartItem(id:existingCartItem.id, title: existingCartItem.title, quantity: (existingCartItem.quantity!+1), price: existingCartItem.price));
  }
  else {
    _items?.putIfAbsent(productId, () => CartItem(id: DateTime.now().toString(), title: title, quantity: 1, price: price));
  }
  notifyListeners();
}

void removeItem(String productId){
  _items!.remove(productId);
  notifyListeners();
}

void clearCart(){
  _items={};
  notifyListeners();
}
}