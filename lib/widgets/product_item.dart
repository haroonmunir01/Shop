import 'package:flutter/material.dart';
import 'package:shop/screens/product_detail_screen.dart';
class ProductItem extends StatelessWidget {

final String title;
final String id;
final String imageUrl;

ProductItem(this.id,this.title,this.imageUrl);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
          footer: GridTileBar(
            backgroundColor: Colors.black87,
            leading: IconButton(
              icon: const Icon(Icons.favorite),
              onPressed: (){},
              color: Theme.of(context).colorScheme.secondary,
            ),
            title: Text(title,textAlign: TextAlign.center),
            trailing: IconButton(
              icon:const Icon(Icons.shopping_cart),
              onPressed: (){},
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
          child: GestureDetector(
            onTap: (){
            Navigator.of(context).pushNamed(ProductDetailScreen.routeName,arguments: id);
            },
            child: Image.network(imageUrl!,fit: BoxFit.cover
            ),
          ),
      ),
    );
  }
}
