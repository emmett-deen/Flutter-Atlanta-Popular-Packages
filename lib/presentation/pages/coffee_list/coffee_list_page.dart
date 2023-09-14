import 'package:flutter/widgets.dart';
import 'package:flutter_atlanta_packages_example/data/providers/api_provider.dart';
import 'package:flutter_atlanta_packages_example/domain/repositories/api/coffee_repository.dart';
import 'package:flutter_atlanta_packages_example/presentation/pages/coffee_list/cubit/coffee_list_cubit.dart';
import 'package:flutter_atlanta_packages_example/presentation/pages/coffee_list/view/coffee_list_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CoffeeListPage extends StatelessWidget {
  const CoffeeListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => CoffeeRepository(
        apiProvider: context.read<APIProvider>(),
      ),
      child: BlocProvider(
        create: (context) => CoffeeListCubit(
          coffeeRepository: context.read<CoffeeRepository>(),
        )..getCoffeeList(),
        child: const CoffeeListView(),
      ),
    );
  }
}
