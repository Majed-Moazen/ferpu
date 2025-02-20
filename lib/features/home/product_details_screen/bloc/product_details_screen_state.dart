abstract class ProductDetailsScreenState {}

class InitialProductDetailsState extends ProductDetailsScreenState {}

class ProductDetailsPageChanged extends ProductDetailsScreenState {
  final int currentPage;

  ProductDetailsPageChanged(this.currentPage);
}

class ColorChangedState extends ProductDetailsScreenState {
  final List<String> selectedImages;

  ColorChangedState(this.selectedImages);
}

class SizeChangedState extends ProductDetailsScreenState {
  final String selectedSize;

  SizeChangedState(this.selectedSize); // تخزين المقاس المحدد
}
