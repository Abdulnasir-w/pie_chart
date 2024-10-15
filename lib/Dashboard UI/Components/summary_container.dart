import 'package:flutter/material.dart';

class SummaryContainer extends StatelessWidget {
  final String title;
  final Widget child;

  const SummaryContainer({
    super.key,
    required this.title,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.black54,
        borderRadius: BorderRadius.circular(7),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Text(
              title,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600),
            ),
            const Divider(
              color: Colors.black12,
              thickness: 1.3,
            ),
            child,
          ],
        ),
      ),
    );
  }
}
