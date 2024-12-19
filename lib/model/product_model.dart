class ProductModel {
  String? id;
  String? createdAt;
  String? title;
  int? price;
  String? category;
  String? image;
  String? subTitle;
  String? description;

  ProductModel(
      {this.id,
      this.createdAt,
      this.title,
      this.price,
      this.category,
      this.image,
      this.subTitle,
      this.description});

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['createdAt'];
    title = json['title'];
    price = json['price'];
    category = json['category'];
    image = json['image'];
    subTitle = json['subTitle'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['id'] = id;
    data['createdAt'] = createdAt;
    data['title'] = title;
    data['price'] = price;
    data['category'] = category;
    data['image'] = image;
    data['subTitle'] = subTitle;
    data['description'] = description;
    return data;
  }
}