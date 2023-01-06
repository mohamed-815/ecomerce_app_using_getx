class ProfileDetail {
  String name;
  String? photo;
  String location;
  String shopname;
  String mobileno;

  ProfileDetail({
    required this.name,
    required this.location,
    required this.mobileno,
    required this.shopname,
    this.photo,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'location': location,
      'mobileno': mobileno,
      'shopname': shopname,
      'photo': photo,
    };
  }

  static ProfileDetail fromJson(Map<String, dynamic> json) {
    return ProfileDetail(
      name: json['name'],
      location: json['location'],
      mobileno: json['mobileno'],
      shopname: json['shopname'],
      photo: json['photo'],
    );
  }
}
