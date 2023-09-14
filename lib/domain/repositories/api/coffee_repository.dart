import 'package:flutter_atlanta_packages_example/domain/models/coffee.dart';
import 'package:flutter_atlanta_packages_example/domain/repositories/api/api_repository.dart';

class CoffeeRepository extends APIRepository<Coffee> {
  CoffeeRepository({
    required super.apiProvider,
  }) : super(
          endpoint: '/coffee',
          fromJson: Coffee.fromJson,
        );
}
