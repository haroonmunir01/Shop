import 'package:flutter/material.dart';
class ProductItem extends StatelessWidget {

final String title;
final String id;
final String imageUrl;

ProductItem(this.id,this.title,this.imageUrl);

  @override
  Widget build(BuildContext context) {
    return GridTile(

        child: Image.network(imageUrl!));
  }
}
