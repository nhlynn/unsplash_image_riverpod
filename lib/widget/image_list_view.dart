import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';
import 'package:unsplash_image_riverpod/widget/network_image.dart';

import '../data/model/image_model.dart';

class ImageListView extends ConsumerWidget {
  const ImageListView({super.key, required this.imageList});

  final List<ImageResult> imageList;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GridView.custom(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      gridDelegate: SliverQuiltedGridDelegate(
        crossAxisCount: 4,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        repeatPattern: QuiltedGridRepeatPattern.same,
        pattern: const [
          QuiltedGridTile(2, 2),
          QuiltedGridTile(1, 1),
          QuiltedGridTile(1, 1),
          QuiltedGridTile(1, 2),
        ],
      ),
      childrenDelegate: SliverChildBuilderDelegate(childCount: imageList.length,
          (context, index) {
        final imageModel = imageList[index];
        return InkWell(
            onTap: () {
              context.push('/detail', extra: imageModel);
            },
            child: MyNetworkImageView(imageUrl: imageModel.urls?.small ?? ""));
      }),
    );
  }
}
