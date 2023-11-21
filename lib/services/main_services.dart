// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';

import 'package:hw_technical_test_2/models/banner_model.dart';
import 'package:hw_technical_test_2/models/song_model.dart';
import 'package:hw_technical_test_2/services/service_network_handler_mixin.dart';

abstract class MainServices {
  Future<List<BannerModel>> getListBanner();
  Future<List<SongModel>> getListSong();
}

class MainServicesImpl extends MainServices with ServiceNetworkHandlerMixin {
  final Dio httpClient;
  MainServicesImpl({
    required this.httpClient,
  });
  @override
  Future<List<BannerModel>> getListBanner() {
    return get(
      'api/v1/whats-on/banner',
      httpClient: httpClient,
      onSuccess: (response) async {
        return ((response.data['data'] ?? []) as List)
            .map((e) => BannerModel.fromMap(e))
            .toList();
      },
    );
  }

  @override
  Future<List<SongModel>> getListSong() {
    return get(
      'api/v1/songs/charts/latest',
      httpClient: httpClient,
      onSuccess: (response) async {
        return ((response.data['data']['songs'] ?? []) as List)
            .map((e) => SongModel.fromMap(e['song']))
            .toList();
      },
    );
  }
}
