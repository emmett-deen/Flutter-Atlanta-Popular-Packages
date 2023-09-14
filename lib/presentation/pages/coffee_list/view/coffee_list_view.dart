import 'package:flutter/material.dart';
import 'package:flutter_atlanta_packages_example/domain/errors/request_exception.dart';
import 'package:flutter_atlanta_packages_example/domain/models/coffee.dart';
import 'package:flutter_atlanta_packages_example/presentation/l10n/l10n.dart';
import 'package:flutter_atlanta_packages_example/presentation/pages/coffee_list/cubit/coffee_list_cubit.dart';
import 'package:flutter_atlanta_packages_example/presentation/pages/coffee_list/view/widgets/coffee_card.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class CoffeeListView extends StatelessWidget {
  const CoffeeListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context).coffee,
          style: Theme.of(context).textTheme.displaySmall,
        ),
        centerTitle: false,
      ),
      body: BlocBuilder<CoffeeListCubit, CoffeeListState>(
        builder: (context, state) {
          return state.when(
            initial: _Loading.new,
            loading: _Loading.new,
            loaded: _Loaded.new,
            error: _Error.new,
          );
        },
      ),
    );
  }
}

class _Error extends StatelessWidget {
  const _Error(
    this.exception,
  );

  final RequestException exception;

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(exception.message));
  }
}

class _Loaded extends StatelessWidget {
  const _Loaded(this.coffee);

  final List<Coffee> coffee;

  @override
  Widget build(BuildContext context) {
    return GridView.custom(
      padding: const EdgeInsets.all(8),
      gridDelegate: SliverQuiltedGridDelegate(
        crossAxisCount: 3,
        repeatPattern: QuiltedGridRepeatPattern.inverted,
        pattern: [
          const QuiltedGridTile(2, 2),
          const QuiltedGridTile(1, 1),
          const QuiltedGridTile(1, 1),
        ],
      ),
      childrenDelegate: SliverChildBuilderDelegate(
        (context, index) => CoffeeCard(coffee: coffee[index]),
        childCount: coffee.length,
      ),
    );
  }
}

class _Loading extends StatelessWidget {
  const _Loading();

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}
