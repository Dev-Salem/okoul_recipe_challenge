import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class CachedImageWidget extends StatelessWidget {
  final String imageURL;
  const CachedImageWidget({super.key, required this.imageURL});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
        imageUrl: imageURL,
        fit: BoxFit.cover,
        placeholder: (context, url) => const SizedBox(),
        errorWidget: (context, url, error) => const SizedBox(),
        cacheManager: CacheManager(
          Config(
            imageURL,
          ),
        ));
  }
}
