// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hw_technical_test_2/blocs/banner_cubit/banner_state.dart';
import 'package:hw_technical_test_2/blocs/song_cubit/song_state.dart';
import 'package:hw_technical_test_2/services/main_services.dart';

class SongCubit extends Cubit<SongState> {
  final MainServices service;
  SongCubit({
    required this.service,
  }) : super(const SongState());

  Future getListBanner() async {
    try {
      emit(state.copyWith(status: SongCubitStatus.loading));
      final result = await service.getListSong();
      emit(state.copyWith(status: SongCubitStatus.success, listSong: result));
    } catch (error, stackTrace) {
      emit(state.copyWith(
          status: SongCubitStatus.failure, errorMessage: error.toString()));

      log(
        stackTrace.toString(),
        stackTrace: stackTrace,
        error: error,
        name: 'ERROR',
      );
    }
  }
}
