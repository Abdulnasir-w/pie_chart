import 'package:flutter/material.dart';

class CustomContainers extends StatelessWidget {
  final Color containerColor;
  final String title;
  final String value;
  final IconData icon;
  const CustomContainers({
    super.key,
    required this.containerColor,
    required this.title,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final Color moreInfoColor = _darkenColor(containerColor, 0.19);
    return Container(
      width: width / 2.1,
      height: 110,
      decoration: BoxDecoration(
          color: containerColor, borderRadius: BorderRadius.circular(7)),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0, left: 10, top: 4),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  value,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    Icon(
                      icon,
                      size: 40,
                      color: moreInfoColor,
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 2,
          ),
          Container(
            height: 33,
            width: double.infinity,
            decoration: BoxDecoration(
                color: moreInfoColor,
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(7),
                    bottomRight: Radius.circular(7))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextButton.icon(
                  onPressed: () {},
                  label: const Text(
                    "More Info",
                    style: TextStyle(color: Colors.white, fontSize: 11),
                    textAlign: TextAlign.center,
                  ),
                  iconAlignment: IconAlignment.end,
                  icon: const Icon(
                    Icons.arrow_circle_right,
                    size: 16,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Color _darkenColor(Color color, double amount) {
    assert(amount >= 0 && amount <= 1);
    final hsl = HSLColor.fromColor(color);
    final darkerHsl =
        hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));
    return darkerHsl.toColor();
  }
}
