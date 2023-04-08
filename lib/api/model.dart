class DataModel {
  Data? data;

  DataModel({this.data});

  DataModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  List<Product>? products;
  Paginate? paginate;
  int? totalCount;

  Data({this.products, this.paginate, this.totalCount});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      products = <Product>[];
      json['data'].forEach((v) {
        products!.add(Product.fromJson(v));
      });
    }
    paginate =
        json['paginate'] != null ? Paginate.fromJson(json['paginate']) : null;
    totalCount = json['totalCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (products != null) {
      data['data'] = products!.map((v) => v.toJson()).toList();
    }
    if (paginate != null) {
      data['paginate'] = paginate!.toJson();
    }
    data['totalCount'] = totalCount;
    return data;
  }
}

class Product {
  int? id;
  String? description;
  String? title;
  int? rate;
  int? discount;
  int? priceBeforeDiscount;
  List<Images>? images;
  String? image;
  int? price;
  bool? wishlist;
  bool? cart;
  String? slug;
  int? cartQuantity;
  String? unitName;
  String? weight;
  bool? inStock;

  Product(
      {this.id,
      this.description,
      this.title,
      this.rate,
      this.discount,
      this.priceBeforeDiscount,
      this.images,
      this.image,
      this.price,
      this.wishlist,
      this.cart,
      this.slug,
      this.cartQuantity,
      this.unitName,
      this.weight,
      this.inStock});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    description = json['description'];
    title = json['title'];
    rate = json['rate'];
    discount = json['discount'];
    priceBeforeDiscount = json['price_before_discount'];
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(Images.fromJson(v));
      });
    }
    image = json['image'];
    price = json['price'];
    wishlist = json['wishlist'];
    cart = json['cart'];
    slug = json['slug'];
    cartQuantity = json['cart_quantity'];
    unitName = json['unit_name'];
    weight = json['weight'];
    inStock = json['in_stock'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['description'] = description;
    data['title'] = title;
    data['rate'] = rate;
    data['discount'] = discount;
    data['price_before_discount'] = priceBeforeDiscount;
    if (images != null) {
      data['images'] = images!.map((v) => v.toJson()).toList();
    }
    data['image'] = image;
    data['price'] = price;
    data['wishlist'] = wishlist;
    data['cart'] = cart;
    data['slug'] = slug;
    data['cart_quantity'] = cartQuantity;
    data['unit_name'] = unitName;
    data['weight'] = weight;
    data['in_stock'] = inStock;
    return data;
  }
}

class Images {
  int? id;
  String? url;

  Images({this.id, this.url});

  Images.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['url'] = url;
    return data;
  }
}

class Paginate {
  int? currentPage;
  int? lastPage;
  int? perPage;
  int? total;

  Paginate({this.currentPage, this.lastPage, this.perPage, this.total});

  Paginate.fromJson(Map<String, dynamic> json) {
    currentPage = json['currentPage'];
    lastPage = json['lastPage'];
    perPage = json['perPage'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['currentPage'] = currentPage;
    data['lastPage'] = lastPage;
    data['perPage'] = perPage;
    data['total'] = total;
    return data;
  }
}
