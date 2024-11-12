import 'package:deep_links_poc/enum/deep_link.dart';

extension DeepLinkType on String {
  DeepLink get toDeepLinkType {
    switch (this) {
      case 'product-details':
        return DeepLink.productDetails;
      case 'product-list':
        return DeepLink.productList;
      default:
        throw Exception('Wrong Type');
    }
  }
}
