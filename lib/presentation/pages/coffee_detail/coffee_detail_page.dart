import 'package:flutter/material.dart';
import 'package:flutter_atlanta_packages_example/domain/models/coffee.dart';
import 'package:flutter_atlanta_packages_example/domain/repositories/local/favorite_repository.dart';
import 'package:flutter_atlanta_packages_example/presentation/pages/coffee_detail/cubit/coffee_detail_cubit.dart';
import 'package:flutter_atlanta_packages_example/presentation/pages/coffee_detail/view/coffee_detail_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CoffeeDetailPage extends StatelessWidget {
  const CoffeeDetailPage({required this.coffee, super.key});

  final Coffee coffee;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => FavoriteRepository(),
      child: BlocProvider<CoffeeDetailCubit>(
        create: (context) => CoffeeDetailCubit(
          coffee: coffee,
          favoriteRepository: context.read<FavoriteRepository>(),
        )..load(),
        child: const CoffeeDetailView(),
      ),
    );
  }
}
