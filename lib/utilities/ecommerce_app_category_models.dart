class PlatziStoreProductsModels {
  int? id;
  String? title;
  int? price;
  String? description;
  List<String>? images;
  String? creationAt;
  String? updatedAt;
  Category? category;

  PlatziStoreProductsModels({
    this.id,
    this.title,
    this.price,
    this.description,
    this.images,
    this.creationAt,
    this.updatedAt,
    this.category,
  });

  PlatziStoreProductsModels.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    title = json['title'] as String?;
    price = json['price'] as int?;
    description = json['description'] as String?;
    images =
        (json['images'] as List?)?.map((dynamic e) => e as String).toList();
    creationAt = json['creationAt'] as String?;
    updatedAt = json['updatedAt'] as String?;
    category = (json['category'] as Map<String, dynamic>?) != null
        ? Category.fromJson(json['category'] as Map<String, dynamic>)
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['title'] = title;
    json['price'] = price;
    json['description'] = description;
    json['images'] = images;
    json['creationAt'] = creationAt;
    json['updatedAt'] = updatedAt;
    json['category'] = category?.toJson();
    return json;
  }
}

class Category {
  int? id;
  String? name;
  String? image;
  String? creationAt;
  String? updatedAt;

  Category({
    this.id,
    this.name,
    this.image,
    this.creationAt,
    this.updatedAt,
  });

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    name = json['name'] as String?;
    image = json['image'] as String?;
    creationAt = json['creationAt'] as String?;
    updatedAt = json['updatedAt'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['name'] = name;
    json['image'] = image;
    json['creationAt'] = creationAt;
    json['updatedAt'] = updatedAt;
    return json;
  }
}
