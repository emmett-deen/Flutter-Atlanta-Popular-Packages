import 'package:flutter/widgets.dart';

class Description extends StatelessWidget {
  const Description({required this.description, super.key});

  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Description',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Text(description),
      ],
    );
  }
}
