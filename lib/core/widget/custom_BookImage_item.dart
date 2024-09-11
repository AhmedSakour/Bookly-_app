import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomBookImageItem extends StatelessWidget {
  const CustomBookImageItem({
    required this.imgUrl,
    Key? key,
  }) : super(key: key);
  final String imgUrl;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: CachedNetworkImage(
        fit: BoxFit.cover,
        imageUrl: imgUrl,
        errorWidget: (context, url, error) =>
            const Center(child: Icon(Icons.error)),
      ),
    );
  }
}
