import 'package:flutter/material.dart';
import 'package:flutter_atlanta_packages_example/domain/errors/request_exception.dart';
import 'package:flutter_atlanta_packages_example/domain/models/coffee.dart';
import 'package:flutter_atlanta_packages_example/presentation/pages/coffee_list/cubit/coffee_list_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CoffeeListView extends StatelessWidget {
  const CoffeeListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Coffee'),
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
    return ListView.builder(
      itemCount: coffee.length,
      itemBuilder: (context, index) => ListTile(
        title: Text(coffee[index].title),
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
