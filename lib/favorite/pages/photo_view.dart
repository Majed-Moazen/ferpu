import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'dart:io';

class ZoomableImageScreen extends StatelessWidget {
  final String imagePath;

  const ZoomableImageScreen({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('صورة قابلة للتكبير'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(
              20), //ssh-keygen -t rsa -b 4096 -C "hussamabdaljalil33@gmail.com"

          child: PhotoViewGallery.builder(
            customSize: Size.infinite,
            itemCount: 1,
            builder: (context, index) {
              return PhotoViewGalleryPageOptions(
                imageProvider: FileImage(File(imagePath)),
                minScale: PhotoViewComputedScale.contained,
                maxScale: PhotoViewComputedScale.covered * 4,
              );
            },
            scrollPhysics: BouncingScrollPhysics(),
            // backgroundDecoration: BoxDecoration(
            //   color: Colors.white,
            // ),
            pageController: PageController(),

          ),
        ),
      ),
    );
  }
}
