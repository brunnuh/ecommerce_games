class Product {
  int id;
  String name;
  double price;
  int score;
  String image;
  String content;

  Product(
      {this.id, this.name, this.price, this.score, this.image, this.content});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json["id"],
      image: json["image"],
      name: json["name"],
      price: json["price"],
      score: json["score"],
      content: json["content"],
    );
  }

  @override
  String toString() {
    return 'Product{id: $id, name: $name, price: $price, score: $score, image: $image} content: $content';
  }
}
