import 'package:flutter/material.dart';

class CustomProgressIndicator extends StatelessWidget {
  final double? size;
  const CustomProgressIndicator({super.key, this.size});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: size,
        width: size,
        child: const CircularProgressIndicator(),
      ),
    );
  }
}
