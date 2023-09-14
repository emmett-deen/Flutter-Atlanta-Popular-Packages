import 'package:flutter/widgets.dart';

class Ingredients extends StatelessWidget {
  const Ingredients({required this.ingredients, super.key});

  final List<String> ingredients;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Ingredients',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        ...ingredients.map(
          (val) => Text(' • $val'),
        ),
      ],
    );
  }
}
