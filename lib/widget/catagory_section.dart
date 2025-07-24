import 'package:flutter/material.dart';

class CatagorySection extends StatelessWidget {
  final String imagePath;
  final void Function(String value) onTap;
  final String? selectedImage;

  const CatagorySection({
    super.key,
    required this.imagePath,
    required this.onTap,
    required this.selectedImage,
  });

  @override
  Widget build(BuildContext context) {
    final isSelected = imagePath == selectedImage;

    return GestureDetector(
      onTap: () => onTap(imagePath),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            border: Border.all(
              color: isSelected ? Colors.blue : Colors.transparent,
              width: 2,
            ),
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
