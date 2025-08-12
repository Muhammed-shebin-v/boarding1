class Datas {
    Datas({
        required this.type,
        required this.title,
        required this.contents,
        required this.id,
        required this.imageUrl,
    });

    final String? type;
    final String? title;
    final List<Content> contents;
    final String? id;
    final String? imageUrl;

    factory Datas.fromJson(Map<String, dynamic> json){ 
        return Datas(
            type: json["type"],
            title: json["title"],
            contents: json["contents"] == null ? [] : List<Content>.from(json["contents"]!.map((x) => Content.fromJson(x))),
            id: json["id"],
            imageUrl: json["image_url"],
        );
    }

    Map<String, dynamic> toJson() => {
        "type": type,
        "title": title,
        "contents": contents.map((x) => x.toJson()).toList(),
        "id": id,
        "image_url": imageUrl,
    };

}

class Content {
    Content({
        required this.title,
        required this.imageUrl,
        required this.sku,
        required this.productName,
        required this.productImage,
        required this.productRating,
        required this.actualPrice,
        required this.offerPrice,
        required this.discount,
    });

    final String? title;
    final String? imageUrl;
    final String? sku;
    final String? productName;
    final String? productImage;
    final int? productRating;
    final String? actualPrice;
    final String? offerPrice;
    final String? discount;

    factory Content.fromJson(Map<String, dynamic> json){ 
        return Content(
            title: json["title"],
            imageUrl: json["image_url"],
            sku: json["sku"],
            productName: json["product_name"],
            productImage: json["product_image"],
            productRating: json["product_rating"],
            actualPrice: json["actual_price"],
            offerPrice: json["offer_price"],
            discount: json["discount"],
        );
    }

    Map<String, dynamic> toJson() => {
        "title": title,
        "image_url": imageUrl,
        "sku": sku,
        "product_name": productName,
        "product_image": productImage,
        "product_rating": productRating,
        "actual_price": actualPrice,
        "offer_price": offerPrice,
        "discount": discount,
    };

}
