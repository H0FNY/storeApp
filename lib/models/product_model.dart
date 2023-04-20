class ProductModel {
  final int id;
  final String title;
  final double price;
  final String image;
  final String category;
  final String description;
  final RateModel rate;
  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.image,
    required this.category,
    required this.description,
    required this.rate,
  });
  factory ProductModel.fromjson(jsonData) {
    return ProductModel(
      id: jsonData['id'],
      title: jsonData['title'],
      price: jsonData['price'],
      image: jsonData['image'],
      category: jsonData['category'],
      description: jsonData['description'],
      rate: RateModel.formjson(jsonData['rating']),
    );
  }
}

class RateModel {
  final double rate;
  final int count;

  RateModel({
    required this.rate,
    required this.count,
  });

  factory RateModel.formjson(jsonData) {
    return RateModel(
      rate: jsonData['rate'],
      count: jsonData['count'],
    );
  }
}
