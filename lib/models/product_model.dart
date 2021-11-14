class ProductModel {
  ProductModel({
    this.id,
    this.name,
    this.desc,
    this.regularPrice,
    this.salePrice,
    this.onSale,
    this.stock,
    this.isFavourite,
    this.rate,
    this.numUsersRate,
    this.images,
    this.reviews,
    this.productDetails,
    this.store,
  });

  int id;
  String name;
  String desc;
  int regularPrice;
  int salePrice;
  bool onSale;
  int stock;
  bool isFavourite;
  int rate;
  int numUsersRate;
  List<Image> images;
  List<Review> reviews;
  List<ProductDetail> productDetails;
  Store store;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["id"],
        name: json["name"],
        desc: json["desc"],
        regularPrice: json["regular_price"],
        salePrice: json["sale_price"],
        onSale: json["on_sale"],
        stock: json["stock"],
        isFavourite: json["is_favourite"],
        rate: json["rate"],
        numUsersRate: json["num_users_rate"],
        images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
        reviews:
            List<Review>.from(json["reviews"].map((x) => Review.fromJson(x))),
        productDetails: List<ProductDetail>.from(
            json["product_details"].map((x) => ProductDetail.fromJson(x))),
        store: Store.fromJson(json["store"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "desc": desc,
        "regular_price": regularPrice,
        "sale_price": salePrice,
        "on_sale": onSale,
        "stock": stock,
        "is_favourite": isFavourite,
        "rate": rate,
        "num_users_rate": numUsersRate,
        "images": List<dynamic>.from(images.map((x) => x.toJson())),
        "reviews": List<dynamic>.from(reviews.map((x) => x.toJson())),
        "product_details":
            List<dynamic>.from(productDetails.map((x) => x.toJson())),
        "store": store.toJson(),
      };
}

class Image {
  Image({
    this.id,
    this.img,
  });

  int id;
  String img;

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        id: json["id"],
        img: json["img"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "img": img,
      };
}

class ProductDetail {
  ProductDetail({
    this.id,
    this.value,
    this.nameAr,
    this.nameEn,
  });

  int id;
  String value;
  String nameAr;
  String nameEn;

  factory ProductDetail.fromJson(Map<String, dynamic> json) => ProductDetail(
        id: json["id"],
        value: json["value"],
        nameAr: json["name_ar"],
        nameEn: json["name_en"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "value": value,
        "name_ar": nameAr,
        "name_en": nameEn,
      };
}

class Review {
  Review({
    this.userName,
    this.review,
    this.rate,
    this.createdAt,
  });

  String userName;
  String review;
  int rate;
  String createdAt;

  factory Review.fromJson(Map<String, dynamic> json) => Review(
        userName: json["user_name"],
        review: json["review"],
        rate: json["rate"],
        createdAt: json["created_at"],
      );

  Map<String, dynamic> toJson() => {
        "user_name": userName,
        "review": review,
        "rate": rate,
        "created_at": createdAt,
      };
}

class Store {
  Store({
    this.id,
    this.name,
    this.logo,
    this.fullAddress,
  });

  int id;
  String name;
  String logo;
  String fullAddress;

  factory Store.fromJson(Map<String, dynamic> json) => Store(
        id: json["id"],
        name: json["name"],
        logo: json["logo"],
        fullAddress: json["full_address"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "logo": logo,
        "full_address": fullAddress,
      };
}
