import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'product_details_screen_state.dart';

class ProductDetailsCubitScreen extends Cubit<ProductDetailsScreenState> {
  ProductDetailsCubitScreen() : super(InitialProductDetailsState());

  final PageController pageController = PageController();

  int currentPage = 0;

  String? selectedSize; // لتخزين المقاس المحدد
  String? selectedColor; // لتخزين اللون المحدد

  final Map<String, List<String>> imagesByColor = {
    'white': [
      'assets/images/png/woman_white.jpg',
      'assets/images/png/White T-shirt.png',
    ],
    'blue': [
      'assets/images/png/woman_black.jpg',
      'assets/images/png/Blue T-shirt.png',
    ],
    'green': [
      'assets/images/png/woman_green.jpg',
      'assets/images/png/Green T-shirt.png',
    ],
  };

  List<String> selectedImages = [
    'assets/images/png/woman_white.jpg',
    'assets/images/png/White T-shirt.png',
  ];

  void onPageChanged(int index) {
    currentPage = index;
    emit(ProductDetailsPageChanged(currentPage));
  }

  void changeColor(String color) {
    if (imagesByColor.containsKey(color)) {
      selectedImages = imagesByColor[color]!;
      currentPage = 0;
      pageController.jumpToPage(0);
      emit(ColorChangedState(selectedImages));
    }
  }

  void selectSize(String size) {
    selectedSize = size;
    emit(SizeChangedState(size));
  }
}
