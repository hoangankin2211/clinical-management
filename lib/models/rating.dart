import 'dart:convert';

class Reviews {
  String? userSend;
  String? doctor;
  int? rating;
  String? reviews;
  int? like;
  String? image;
  String? name;

  Reviews(
      {this.userSend,
      this.doctor,
      this.rating,
      this.reviews,
      this.like,
      this.image,
      this.name});

  Reviews.fromJson(Map<String, dynamic> json) {
    userSend = json['userSend'];
    doctor = json['doctor'];
    rating = json['rating'];
    reviews = json['reviews'];
    like = json['like'];
    image = json['image'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userSend'] = this.userSend;
    data['doctor'] = this.doctor;
    data['rating'] = this.rating;
    data['reviews'] = this.reviews;
    data['like'] = this.like;
    data['image'] = this.image;
    data['name'] = this.name;
    return data;
  }

  Reviews userFromJson(String str) => Reviews.fromJson(json.decode(str));
  factory Reviews.fromMap(Map<String, dynamic> json) => Reviews();
}
