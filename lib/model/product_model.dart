class ProductModel {
  final int id;
  final String name;
  final String desc;
  final String url;

  ProductModel({
    required this.id,
    required this.name,
    required this.desc,
    required this.url,
  });
}

var products = [
  ProductModel(id: 1, name: 'P1', desc: 'D1', url: 'url 1'),
  ProductModel(id: 2, name: 'P2', desc: 'D2', url: 'url 2'),
  ProductModel(id: 3, name: 'P3', desc: 'D3', url: 'url 3'),
  ProductModel(id: 4, name: 'P4', desc: 'D4', url: 'url 4'),
  ProductModel(id: 5, name: 'P5', desc: 'D5', url: 'url 5'),
  ProductModel(id: 6, name: 'P6', desc: 'D6', url: 'url 6'),
  ProductModel(id: 7, name: 'P7', desc: 'D7', url: 'url 7'),
  ProductModel(id: 8, name: 'P8', desc: 'D8', url: 'url 8'),
];
