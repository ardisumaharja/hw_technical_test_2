// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:hw_technical_test_2/models/banner_model.dart';

class BannerState extends Equatable {
  final BannerCubitStatus? status;
  final String? errorMessage;
  final List<BannerModel> listBanner;
  const BannerState({
    this.status,
    this.errorMessage,
    this.listBanner = const [],
  });

  @override
  List<Object?> get props => [status, errorMessage, listBanner];

  BannerState copyWith({
    BannerCubitStatus? status,
    String? errorMessage,
    List<BannerModel>? listBanner,
  }) {
    return BannerState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      listBanner: listBanner ?? this.listBanner,
    );
  }
}

enum BannerCubitStatus { success, loading, failure }
