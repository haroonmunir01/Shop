import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/providers/product.dart';
import 'package:shop/providers/products.dart';
import 'package:shop/screens/user_products_screen.dart';

class EditProductScreen extends StatefulWidget {
  const EditProductScreen({super.key});
  static const routeName='/edit-product-screen';
  @override
  State<EditProductScreen> createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
final _priceFocusNode=FocusNode();
final _descriptionFocusNode=FocusNode();
final _imageUrlController=TextEditingController();
final _imageUrlFocusNode=FocusNode();
final _form=GlobalKey<FormState>();
var _editedProduct=Product(id: null, title: '', description: '', price: 0, imageUrl: '');
var _isInit=true;
var _initValues={
    'title':'',
    'description':'',
    'price':'',
    'imageUrl':'',
    };

@override
  void initState() {
    _imageUrlFocusNode.addListener(_updateImageUrl);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if(_isInit) {
      final productId = ModalRoute.of(context)?.settings.arguments as String?;
      if (productId != null) {
        _editedProduct = Provider.of<Products>(context, listen: false).findById(productId);
        _initValues = {
          'title': _editedProduct.title!,
          'description': _editedProduct.description!,
          'price': _editedProduct.price.toString(),
          'imageUrl': '',
        };
        _imageUrlController.text=_editedProduct.imageUrl!;
      }
    }
    _isInit=false;
    super.didChangeDependencies();
  }
  void _updateImageUrl(){
  if(!_imageUrlFocusNode.hasFocus){
    if (!_imageUrlController.text.startsWith('http')&&!_imageUrlController.text.startsWith('https')||
        (!_imageUrlController.text.endsWith('.jpeg')&&!_imageUrlController.text.endsWith('.jpg')&&!_imageUrlController.text.endsWith('.png'))){
    return ;
    }
    setState(() {

    });
  }
  }

  void _saveForm(){
  print('Function triggered');
      final valid=_form.currentState!.validate();

      if(!valid){
            return;
          }
      _form.currentState!.save();
      if(_editedProduct.id!=null){
        Provider.of<Products>(context,listen: false).updateProduct(_editedProduct.id!,_editedProduct);
      }
      else{
        Provider.of<Products>(context,listen:false).addProduct(_editedProduct);
      }
      Navigator.of(context).pushReplacementNamed(UserProductsScreen.routeName);
      print('ended');
    }
@override
  void dispose() {
  _imageUrlFocusNode.removeListener(_updateImageUrl);
  _priceFocusNode.dispose();
  _descriptionFocusNode.dispose();
  _imageUrlController.dispose();
  _imageUrlFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:const Text('Edit Products'),actions: [
        IconButton(onPressed: _saveForm, icon: const Icon(Icons.save))
      ],),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _form,
          child: ListView(
          children: [

            TextFormField(
              initialValue: _initValues['title'],
              decoration:const InputDecoration(labelText: 'Title'),
              textInputAction: TextInputAction.next,
              onFieldSubmitted: (_){
                FocusScope.of(context).requestFocus(_priceFocusNode);
              },
              onSaved: (value){
                _editedProduct=Product(
                    id: _editedProduct.id,
                    isFavorite: _editedProduct.isFavorite,
                    title: value,
                    description: _editedProduct.description,
                    price: _editedProduct.price,
                    imageUrl:_editedProduct.imageUrl);
              },
              validator: (value){
                if(value!.isEmpty){
                  return 'Please enter the value';
                }
                return null;
              },
            ),

            TextFormField(
              initialValue: _initValues['price'],
              decoration:const InputDecoration(labelText: 'Price'),
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.number,
              focusNode: _priceFocusNode,
              onFieldSubmitted: (_){
                FocusScope.of(context).requestFocus(_descriptionFocusNode);
              },
              onSaved: (value){
                _editedProduct=Product(id: _editedProduct.id,
                    isFavorite: _editedProduct.isFavorite,
                    title: _editedProduct.title,
                    description: _editedProduct.description,
                    price: double.parse(value!),
                    imageUrl:_editedProduct.imageUrl);
              },
              validator: (value){
                if(value!.isEmpty){
                  return 'Please enter the price';
                }
                if(double.tryParse(value)==null){
                  return ' Please enter the valid number';
                }
                if(double.parse(value)<=0){
                  return 'Please enter value greater than zero';
                }
                return null;
              },
            ),

            TextFormField(
              initialValue: _initValues['description'],
              decoration:const InputDecoration(labelText: 'Description'),
              maxLines: 3,
              keyboardType: TextInputType.multiline,
              focusNode: _descriptionFocusNode,
              onSaved: (value){
                _editedProduct=Product(id: _editedProduct.id,
                    isFavorite: _editedProduct.isFavorite,
                    title: _editedProduct.title,
                    description: value,
                    price: _editedProduct.price,
                    imageUrl:_editedProduct.imageUrl);
              },
              validator: (value){
                if(value!.isEmpty){
                  return 'Please enter the value';
                }
                if(value.length<10){
                  return 'Should be at least 10 characters';
                }
                return null;
              },
            ),

            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  margin:const EdgeInsets.only(top:8,right: 10),
                  decoration: BoxDecoration(border: Border.all(width: 1,color: Colors.grey)),
                  child: _imageUrlController.text.isEmpty ? Container(child: Text('Enter a URL'),):FittedBox(fit: BoxFit.fill,child: Image.network(_imageUrlController.text
                  ),),
                ),
                Expanded(
                  child: TextFormField(
                    initialValue: _initValues['imagerUrl'],
                    decoration:const InputDecoration(labelText: 'Image URL'),
                    keyboardType: TextInputType.url,
                    textInputAction: TextInputAction.done,
                    controller: _imageUrlController,
                    focusNode: _imageUrlFocusNode,
                    validator: (value){
                      if(value!.isEmpty){
                        return 'Please enter the value';
                      }
                      if(!value.startsWith('http')&&!value.startsWith('https')){
                        return ' Please enter a valid URL';
                      }
                      if(!value.endsWith('.jpeg')&&!value.endsWith('.jpg')&&!value.endsWith('.png')){
                        return ' Please enter a valid Image URL';
                      }
                      return null;
                    },
                    onSaved: (value){
                      _editedProduct=Product(id: _editedProduct.id,
                          isFavorite: _editedProduct.isFavorite,
                          title: _editedProduct.title,
                          description: _editedProduct.description,
                          price: _editedProduct.price,
                          imageUrl:value);
                    },
                    onFieldSubmitted: (_){_saveForm();},
                  ),
                ),
              ],
            ),
          ],
        ),
        ),
      ),
    );
  }
}
