import 'package:flutter/material.dart';
import 'package:shop/models/product.dart';


class Products with ChangeNotifier{
  List<Product> _items=[
    Product(id: 'p1',
      title: 'Smartphone',
      description: 'A high-end smartphone with a sleek design and powerful performance.',
      price: 799.99,
      imageUrl: 'https://cdn.pixabay.com/photo/2014/09/27/13/45/tablet-463489_1280.jpg',
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
      imageUrl: 'https://cdn.pixabay.com/photo/2014/09/27/13/45/tablet-463489_1280.jpg',
    ),
    Product(
      id: 'p4',
      title: 'Smart Watch',
      description: 'A stylish smart watch with fitness tracking features.',
      price: 249.99,
      imageUrl: 'https://cdn.pixabay.com/photo/2014/09/27/13/45/tablet-463489_1280.jpg',
    ),
    Product(
      id: 'p5',
      title: 'Camera',
      description: 'A DSLR camera with high resolution for professional photography.',
      price: 999.99,
      imageUrl: 'https://cdn.pixabay.com/photo/2014/09/27/13/45/tablet-463489_1280.jpg',
    ),
  ];

  List<Product> get items{
    return [..._items];
  }
  void addProduct(){
    //_items.add(value);
    notifyListeners();
  }


}