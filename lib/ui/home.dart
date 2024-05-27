import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:unsplash_image_riverpod/provider/state/image_state.dart';
import '../data/model/image_model.dart';
import '../provider/image_provider.dart';
import '../widget/error_widget.dart';
import '../widget/header_view.dart';
import '../widget/image_list_view.dart';
import '../widget/tab_bar.dart';

class Home extends ConsumerStatefulWidget {
  const Home({super.key});

  @override
  ConsumerState<Home> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  final ImageListProvider imageProvider =
      ImageListProvider(() => ImageListNotifier());

  ImageListNotifier? imageListNotifier;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timestamp) {
      final searchKeyword = ref.watch(searchKeywordProvider);
      imageListNotifier?.getImageSearch(searchKeyword);
    });
  }

  @override
  Widget build(BuildContext context) {
    imageListNotifier = ref.read(imageProvider.notifier);

    final imageListState = ref.watch(imageProvider);

    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              const HeaderView(),
              Expanded(
                flex: 7,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 8,
                    ),
                    Expanded(
                      flex: 1,
                      child: TabBarWidget(
                        imageSearch: (String keyword) {
                          imageListNotifier?.getImageSearch(keyword);
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Expanded(
                      flex: 12,
                      child: switch (imageListState) {
                        ImageListLoading() => Center(
                            child: LoadingAnimationWidget.flickr(
                              leftDotColor: const Color(0xFF0063DC),
                              rightDotColor: const Color(0xFFFF0084),
                              size: 30,
                            ),
                          ),
                        ImageListSuccess(
                          imageList: List<ImageResult> imageList
                        ) =>
                          ImageListView(imageList: imageList),
                        ImageListFailed(errorMessage: String error) =>
                          ErrorViewWidget(
                            message: error,
                            tryAgain: () {
                              final searchKeyword =
                                  ref.watch(searchKeywordProvider);
                              imageListNotifier?.getImageSearch(searchKeyword);
                            },
                          ),
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
