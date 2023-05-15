import 'package:flutter/widgets.dart';

class ImageWidget extends StatelessWidget {
  final String imageURL;
  const ImageWidget({super.key, required this.imageURL});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.width * 0.7,
      width: double.infinity,
      child: Image.network(
        imageURL,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) => Text("Error: $error"),
        loadingBuilder: (context, child, loadingProgress) => const SizedBox(),
      ),
    );
  }
}
