import 'package:flutter/material.dart';
class ProductItem extends StatelessWidget {

final String title;
final String id;
final String imageUrl;

ProductItem(this.id,this.title,this.imageUrl);

  @override
  Widget build(BuildContext context) {
    return GridTile(
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          leading: IconButton(
            icon: Icon(Icons.favorite),
            onPressed: (){},
          ),
          title: Text(title,textAlign: TextAlign.center),
          trailing: IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: (){},
          ),
        ),
        child: Image.network(imageUrl!,fit: BoxFit.cover,));
  }
}
