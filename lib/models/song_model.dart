// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class SongModel extends Equatable {
  final int id;
  final String title;
  final String artist;
  final String profilePictureUrl;
  const SongModel({
    required this.id,
    required this.title,
    required this.artist,
    required this.profilePictureUrl,
  });

  @override
  List<Object?> get props => [id, title, artist, profilePictureUrl];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'artist': artist,
      'profilePictureUrl': profilePictureUrl,
    };
  }

  factory SongModel.fromMap(Map<String, dynamic> map) {
    return SongModel(
      id: map['id'] as int,
      title: map['title'] as String,
      artist: map['artist_name'] as String,
      profilePictureUrl: map['artist_profile_picture'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory SongModel.fromJson(String source) =>
      SongModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
