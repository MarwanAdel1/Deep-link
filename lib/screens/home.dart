import 'dart:async';

import 'package:app_links/app_links.dart';
import 'package:deep_links_poc/enum/deep_link.dart';
import 'package:deep_links_poc/screens/product_details.dart';
import 'package:deep_links_poc/screens/product_list.dart';
import 'package:deep_links_poc/utils/deep_link_extension.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final AppLinks _appLinks = AppLinks();
  late StreamSubscription _sub;

  _initializeDeepLinkListener() async {
    _sub = _appLinks.uriLinkStream.listen((Uri uri) {
      _handleDeepLink(uri);
    });
  }

  void _handleDeepLink(Uri uri) {
    if (uri.host == 'concrete') {
      final uriQueries = uri.queryParameters;
      int id = 0;
      if (uriQueries.containsKey('id')) {
        id = int.tryParse(uriQueries['id'] ?? '') ?? 0;
      }

      if (uriQueries.containsKey('screen')) {
        final screen = uriQueries['screen'];

        switch (screen!.toDeepLinkType) {
          case DeepLink.productDetails:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProductDetails(productID: id)),
            );
            break;
          case DeepLink.productList:
            Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => const ProductList()),
            );
            break;
        }
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _initializeDeepLinkListener();
  }

  @override
  void dispose() {
    // Always cancel the subscription when no longer needed
    _sub.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => const ProductList()),
            );
          },
          child: const Text('Product list'),
        ),
      ),
    );
  }
}
