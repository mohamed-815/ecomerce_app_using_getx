class FavModel {
  // String image;
  String oldid;
  String id;
  String category;
  String name;
  String size;
  double price;
  double minno;
  String description;
  List<dynamic>? imagelist = [];
  String? isfave;

  FavModel({
    required this.oldid,
    this.isfave,
    this.imagelist,
    // required this.imagelist,
    this.id = '',
    required this.description,
    //  required this.image,
    required this.name,
    required this.category,
    required this.minno,
    required this.price,
    required this.size,
  });

  Map<String, dynamic> toJson() {
    return {
      'oldid': oldid,
      'isfave': isfave,
      'id': id,
      'category': category,
      'name': name,
      'size': size,
      'price': price,
      'minno': minno,
      'description': description,
      'imagelist': imagelist,
    };
  }

  static FavModel fromJson(Map<String, dynamic> json) {
    return FavModel(
      oldid: json['oldid'],
      isfave: json['isfave'],
      id: json['id'],
      description: json['description'],
      name: json['name'],
      category: json['category'],
      minno: json['minno'],
      price: json['price'],
      size: json['size'],
      imagelist: json['imagelist'],
    );
  }
}
