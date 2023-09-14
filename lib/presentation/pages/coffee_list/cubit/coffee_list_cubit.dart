import 'package:bloc/bloc.dart';
import 'package:flutter_atlanta_packages_example/domain/errors/request_exception.dart';
import 'package:flutter_atlanta_packages_example/domain/models/coffee.dart';
import 'package:flutter_atlanta_packages_example/domain/repositories/api/coffee_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'coffee_list_state.dart';
part 'coffee_list_cubit.freezed.dart';

class CoffeeListCubit extends Cubit<CoffeeListState> {
  CoffeeListCubit({required this.coffeeRepository})
      : super(const CoffeeListState.initial());

  final CoffeeRepository coffeeRepository;

  Future<void> getCoffeeList() async {
    emit(const CoffeeListState.loading());
    final coffeeList = await coffeeRepository.index();
    coffeeList.fold(
      (error) => emit(CoffeeListState.error(error)),
      (coffeeList) => emit(CoffeeListState.loaded(coffeeList)),
    );
  }
}
