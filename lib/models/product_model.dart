class ProductModel {
  final dynamic id;
  final String title;
  final dynamic price;
  final String image;
  final String category;
  final String description;
  final RateModel? rate;
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
      rate: jsonData['rating'] == null
          ? null
          : RateModel.fromjson(jsonData['rating']),
    );
  }
}

class RateModel {
  final dynamic rate;
  final dynamic count;

  RateModel({
    required this.rate,
    required this.count,
  });

  factory RateModel.fromjson(jsonData) {
    return RateModel(
      rate: jsonData['rate'],
      count: jsonData['count'],
    );
  }
}
