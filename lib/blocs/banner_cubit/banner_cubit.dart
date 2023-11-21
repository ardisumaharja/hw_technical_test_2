// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hw_technical_test_2/blocs/banner_cubit/banner_state.dart';
import 'package:hw_technical_test_2/services/main_services.dart';

class BannerCubit extends Cubit<BannerState> {
  final MainServices service;
  BannerCubit({
    required this.service,
  }) : super(BannerState());

  Future getListBanner() async {
    try {
      emit(state.copyWith(status: BannerCubitStatus.loading));
      final result = await service.getListBanner();
      emit(state.copyWith(
          status: BannerCubitStatus.success, listBanner: result));
    } catch (error, stackTrace) {
      emit(state.copyWith(
          status: BannerCubitStatus.failure, errorMessage: error.toString()));

      log(
        stackTrace.toString(),
        stackTrace: stackTrace,
        error: error,
        name: 'ERROR',
      );
    }
  }
}
