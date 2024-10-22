import 'package:flutter/material.dart';
import 'package:shop/widgets/product_item.dart';
import '../models/product.dart';

class ProductsOverviewScreen extends StatelessWidget {


  List<Product> loadedProducts = [
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Shop'),),
        body: GridView.builder(
          padding: const EdgeInsets.all(10),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10),
          itemCount: loadedProducts.length,
          itemBuilder: (ctx, i) =>
              ProductItem(loadedProducts[i].id!, loadedProducts[i].title!,
                  loadedProducts[i].imageUrl!),
        )
    );
  }
}
