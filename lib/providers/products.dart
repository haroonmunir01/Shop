import 'package:flutter/material.dart';
import 'package:shop/providers/product.dart';


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
  void addProduct(){
    //_items.add(value);
    notifyListeners();
  }


}