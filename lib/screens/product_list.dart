import 'package:deep_links_poc/model/product_model.dart';
import 'package:flutter/material.dart';

import 'product_details.dart';

class ProductList extends StatelessWidget {
  const ProductList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product list'),
      ),
      body: Column(
        children: [
          ...products.map((prod) {
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) => ProductDetails(productID: prod.id)));
              },
              child: Card(
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  child: Text(prod.name),
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
