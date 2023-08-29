class BookModels2 {
  String? error;
  String? total;
  String? page;
  List<Books>? books;

  BookModels2({
    this.error,
    this.total,
    this.page,
    this.books,
  });

  BookModels2.fromJson(Map<String, dynamic> json) {
    error = json['error'] as String?;
    total = json['total'] as String?;
    page = json['page'] as String?;
    books = (json['books'] as List?)
        ?.map((dynamic e) => Books.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['error'] = error;
    json['total'] = total;
    json['page'] = page;
    json['books'] = books?.map((e) => e.toJson()).toList();
    return json;
  }
}

class Books {
  String? title;
  String? subtitle;
  String? isbn13;
  String? price;
  String? image;
  String? url;

  Books({
    this.title,
    this.subtitle,
    this.isbn13,
    this.price,
    this.image,
    this.url,
  });

  Books.fromJson(Map<String, dynamic> json) {
    title = json['title'] as String?;
    subtitle = json['subtitle'] as String?;
    isbn13 = json['isbn13'] as String?;
    price = json['price'] as String?;
    image = json['image'] as String?;
    url = json['url'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['title'] = title;
    json['subtitle'] = subtitle;
    json['isbn13'] = isbn13;
    json['price'] = price;
    json['image'] = image;
    json['url'] = url;
    return json;
  }
}
