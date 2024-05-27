import '../../data/model/image_model.dart';

sealed class ImageListState {}

class ImageListLoading extends ImageListState {}

class ImageListSuccess extends ImageListState {
  final List<ImageResult> imageList;

  ImageListSuccess(this.imageList);
}

class ImageListFailed extends ImageListState {
  final String errorMessage;

  ImageListFailed(this.errorMessage);
}
