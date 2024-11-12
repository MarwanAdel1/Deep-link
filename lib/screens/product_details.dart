import 'package:deep_links_poc/model/product_model.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatelessWidget {
  final int productID;

  const ProductDetails({
    super.key,
    required this.productID,
  });

  _getProductDetails() {
    return products.firstWhere((prod) => prod.id == productID,
      orElse: () => ProductModel(id: -1, name: 'No name', desc: 'No desc', url: 'No url',),);
  }

  @override
  Widget build(BuildContext context) {
    final product = _getProductDetails();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Product Details $productID'),
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
          child: Center(
            child: Column(
              children: [
                Text(product.name),
                const SizedBox(height: 32),
                Text(product.desc),
                const SizedBox(height: 32),
                Text(product.url),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
