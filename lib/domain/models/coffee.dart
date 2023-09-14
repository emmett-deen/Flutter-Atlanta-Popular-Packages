import 'package:freezed_annotation/freezed_annotation.dart';

part 'coffee.freezed.dart';
part 'coffee.g.dart';

@freezed
class Coffee with _$Coffee {
  factory Coffee({
    required int id,
    required String title,
    required String description,
    required List<String> ingredients,
    required String image,
  }) = _Coffee;

  factory Coffee.fromJson(Map<String, dynamic> json) => _$CoffeeFromJson(json);
}
