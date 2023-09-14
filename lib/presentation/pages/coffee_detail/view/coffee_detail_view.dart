import 'package:flutter/material.dart';
import 'package:flutter_atlanta_packages_example/presentation/pages/coffee_detail/cubit/coffee_detail_cubit.dart';
import 'package:flutter_atlanta_packages_example/presentation/pages/coffee_detail/view/widgets/description.dart';
import 'package:flutter_atlanta_packages_example/presentation/pages/coffee_detail/view/widgets/ingredients.dart';
import 'package:flutter_atlanta_packages_example/presentation/pages/coffee_detail/view/widgets/preview_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CoffeeDetailView extends StatelessWidget {
  const CoffeeDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    final coffee = context.read<CoffeeDetailCubit>().coffee;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          coffee.title,
          style: Theme.of(context).textTheme.displaySmall,
        ),
        centerTitle: false,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          PreviewImage(imageUrl: coffee.image),
          const SizedBox(height: 16),
          Ingredients(ingredients: coffee.ingredients),
          const SizedBox(height: 16),
          Description(description: coffee.description),
        ],
      ),
      floatingActionButton: BlocBuilder<CoffeeDetailCubit, CoffeeDetailState>(
        builder: (context, state) {
          return FloatingActionButton.extended(
            onPressed: () {
              context.read<CoffeeDetailCubit>().toggleFavorite();
            },
            icon:
                Icon(state.isFavorite ? Icons.favorite : Icons.favorite_border),
            label: Text(
              state.isFavorite ? 'Remove from favorites' : 'Add to favorites',
            ),
          );
        },
      ),
    );
  }
}
