import 'package:bloc/bloc.dart';
import 'package:flutter_atlanta_packages_example/domain/models/coffee.dart';
import 'package:flutter_atlanta_packages_example/domain/repositories/local/favorite_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'coffee_detail_state.dart';
part 'coffee_detail_cubit.freezed.dart';

class CoffeeDetailCubit extends Cubit<CoffeeDetailState> {
  CoffeeDetailCubit({required this.coffee, required this.favoriteRepository})
      : super(const CoffeeDetailState(isFavorite: false));

  final Coffee coffee;
  final FavoriteRepository favoriteRepository;

  Future<void> load() async {
    await favoriteRepository.init();
    emit(
      state.copyWith(
        isFavorite: favoriteRepository.isFavorite(coffee.id.toString()),
      ),
    );
  }

  Future<void> toggleFavorite() async {
    final isFavorite = favoriteRepository.toggleFavorite(coffee.id.toString());
    emit(state.copyWith(isFavorite: isFavorite));
  }
}
