// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:hw_technical_test_2/models/banner_model.dart';

import '../../models/song_model.dart';

class SongState extends Equatable {
  final SongCubitStatus? status;
  final String? errorMessage;
  final List<SongModel> listSong;
  const SongState({
    this.status,
    this.errorMessage,
    this.listSong = const [],
  });

  @override
  List<Object?> get props => [status, errorMessage, listSong];

  SongState copyWith({
    SongCubitStatus? status,
    String? errorMessage,
    List<SongModel>? listSong,
  }) {
    return SongState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      listSong: listSong ?? this.listSong,
    );
  }
}

enum SongCubitStatus { success, loading, failure }
