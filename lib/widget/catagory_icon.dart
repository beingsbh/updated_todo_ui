import 'package:flutter/cupertino.dart';
import 'package:todo_app_2/constant/colors.dart';

class CatagoryIcon extends StatelessWidget {
  const CatagoryIcon({super.key, required this.image});

  final ImageProvider<Object> image;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5.0, right: 5),
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          border: Border.all(color: white),
          shape: BoxShape.circle,
          image: DecorationImage(image: image, fit: BoxFit.cover),
        ),
      ),
    );
  }
}
