// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class BannerModel extends Equatable {
  final String imgUrl;
  const BannerModel({
    required this.imgUrl,
  });

  @override
  List<Object?> get props => [imgUrl];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'imgUrl': imgUrl,
    };
  }

  factory BannerModel.fromMap(Map<String, dynamic> map) {
    return BannerModel(
      imgUrl: map['image_url'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory BannerModel.fromJson(String source) =>
      BannerModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
