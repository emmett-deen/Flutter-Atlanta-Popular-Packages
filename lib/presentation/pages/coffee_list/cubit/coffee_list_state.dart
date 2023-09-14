part of 'coffee_list_cubit.dart';

@freezed
class CoffeeListState with _$CoffeeListState {
  const factory CoffeeListState.initial() = _Initial;
  const factory CoffeeListState.loading() = _Loading;
  const factory CoffeeListState.loaded(List<Coffee> coffeeList) = _Loaded;
  const factory CoffeeListState.error(RequestException exception) = _Error;
}
