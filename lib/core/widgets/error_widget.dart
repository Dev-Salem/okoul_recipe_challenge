import 'package:flutter/material.dart';

class CustomErrorWidget extends StatelessWidget {
  final String errorMessage;
  final Function() onTap;
  const CustomErrorWidget(
      {super.key, required this.errorMessage, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(errorMessage),
          TextButton.icon(
              onPressed: onTap,
              icon: const Icon(Icons.refresh),
              label: const Text("Try Again")),
          Navigator.of(context).canPop()
              ? TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text("Go Back"))
              : const SizedBox()
        ],
      ),
    );
  }
}
