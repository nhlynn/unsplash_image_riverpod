import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import '../data/model/image_model.dart';
import '../data/service/network_service.dart';
import 'state/image_state.dart';

final List<String> tabList = ['Latest', 'Oldest', 'Popular', 'View'];
final tabProvider = StateProvider((ref) => tabList);

final selectedIndexProvider = StateProvider((ref) => 0);

final searchKeywordProvider = StateProvider((ref) => 'latest');

typedef ImageListProvider = NotifierProvider<ImageListNotifier, ImageListState>;

class ImageListNotifier extends Notifier<ImageListState> {
  final NetworkService networkService = NetworkService();

  @override
  ImageListState build() {
    return ImageListLoading();
  }

  void getImageSearch(String query) async {
    try {
      state = ImageListLoading();
      final Response response = await networkService.getImageSearch(query);
      if (response.statusCode == 200) {
        var imageResult = ImageSearchResult.fromJson(jsonDecode(response.body));
        if (imageResult.results != null) {
          state = ImageListSuccess(imageResult.results!);
        } else {
          state = ImageListFailed('No Data');
        }
      } else {
        state = ImageListFailed('${response.statusCode} Error');
      }
    } catch (e) {
      state = ImageListFailed(e.toString());
    }
  }
}
