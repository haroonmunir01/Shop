import 'package:flutter/material.dart';
import 'package:shop/providers/product.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class Products with ChangeNotifier{
  List<Product> _items=[
    Product(id: 'p1',
      title: 'Smartphone',
      description: 'A high-end smartphone with a sleek design and powerful performance.',
      price: 799.99,
      imageUrl: 'https://images.unsplash.com/photo-1511707171634-5f897ff02aa9',
    ),
    Product(
      id: 'p2',
      title: 'Laptop',
      description: 'A lightweight laptop with a long battery life, perfect for productivity.',
      price: 1199.99,
      imageUrl: 'https://cdn.pixabay.com/photo/2014/09/27/13/45/tablet-463489_1280.jpg',
    ),
    Product(
      id: 'p3',
      title: 'Headphones',
      description: 'Noise-cancelling headphones for an immersive audio experience.',
      price: 199.99,
      imageUrl: 'https://images.unsplash.com/photo-1546435770-a3e426bf472b',
    ),
    Product(
      id: 'p4',
      title: 'Smart Watch',
      description: 'A stylish smart watch with fitness tracking features.',
      price: 249.99,
      imageUrl: 'https://images.pexels.com/photos/277406/pexels-photo-277406.jpeg',
    ),
    Product(
      id: 'p5',
      title: 'Camera',
      description: 'A DSLR camera with high resolution for professional photography.',
      price: 999.99,
      imageUrl: 'https://images.pexels.com/photos/212372/pexels-photo-212372.jpeg',
    ),
  ];

  List<Product> get items{
    return [..._items];
  }

  List<Product> get favoriteItems{
    return _items.where((element) => element.isFavorite).toList();
  }

  Product findById(String id){
    return _items.firstWhere((element) => element.id==id);
  }

  Future<void> addProduct(Product product){
    var url=Uri.https('flutter-update-e6249-default-rtdb.asia-southeast1.firebasedatabase.app','/products.json');
   return http.post(url,body: json.encode({
      'title':product.title,
      'description':product.description,
      'imageUrl':product.imageUrl,
      'price':product.price,
      'isFavorite':product.isFavorite,
    }),).then((value){
      print(json.decode(value.body));
      final newProduct=Product(
          id: json.decode(value.body)['name'],
          title: product.title,
          description: product.description,
          price: product.price,
          imageUrl:product.imageUrl);
      _items.add(newProduct);
      notifyListeners();
    });
  }

  void updateProduct(String id,Product newProduct){
    final prodIndex=_items.indexWhere((element) => element.id==id);
    if(prodIndex>=0){
      _items[prodIndex]=newProduct;
      notifyListeners();
    }
    else{
      print('Product Not Found');
    }
  }

  void deleteProduct(String id){
    _items.removeWhere((element) => element.id==id);
    notifyListeners();
  }
}