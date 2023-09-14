import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_atlanta_packages_example/domain/models/coffee.dart';
import 'package:flutter_atlanta_packages_example/presentation/routing/routes.dart';
import 'package:go_router/go_router.dart';

class CoffeeCard extends StatelessWidget {
  const CoffeeCard({required this.coffee, super.key});

  final Coffee coffee;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(
        onTap: () {
          context.push(Routes.coffeeDetail, extra: coffee);
        },
        child: CachedNetworkImage(
          imageUrl: coffee.image,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
