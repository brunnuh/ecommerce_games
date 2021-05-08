class Product {
  int id;
  String name;
  double price;
  int score;
  String image;
  String content;
  int qtd;

  Product({
    this.id,
    this.name,
    this.price,
    this.score,
    this.image,
    this.content,
    this.qtd,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json["id"],
      image: json["image"],
      name: json["name"],
      price: json["price"],
      score: json["score"],
      content: json["content"],
      qtd: 1,
    );
  }

  @override
  String toString() {
    return 'Product{id: $id, name: $name, price: $price, score: $score, image: $image} content: $content';
  }
}
