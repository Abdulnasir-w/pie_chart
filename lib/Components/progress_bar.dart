import 'package:flutter/material.dart';

class CustomProgressBar extends StatelessWidget {
  final double value;
  final Color valueColor;
  final String title;
  const CustomProgressBar({
    super.key,
    required this.value,
    required this.valueColor,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
              Text(
                '${(value).toStringAsFixed(0)}%',
                style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: LinearProgressIndicator(
            value: value / 100.toInt(),
            valueColor: AlwaysStoppedAnimation<Color>(valueColor),
            backgroundColor: Colors.grey[300],
            minHeight: 10,
            borderRadius: BorderRadius.circular(3),
          ),
        ),
      ],
    );
  }
}
