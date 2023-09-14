import 'package:flutter_atlanta_packages_example/domain/models/coffee.dart';
import 'package:flutter_atlanta_packages_example/presentation/pages/coffee_detail/coffee_detail_page.dart';
import 'package:flutter_atlanta_packages_example/presentation/pages/coffee_list/coffee_list_page.dart';
import 'package:flutter_atlanta_packages_example/presentation/routing/routes.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: Routes.coffeeList,
  routes: [
    GoRoute(
      path: Routes.coffeeList,
      builder: (context, state) => const CoffeeListPage(),
    ),
    GoRoute(
      path: Routes.coffeeDetail,
      redirect: (context, state) {
        if (state.extra == null || state.extra is! Coffee) {
          return Routes.coffeeList;
        }
        return null;
      },
      builder: (context, state) => CoffeeDetailPage(
        coffee: state.extra! as Coffee,
      ),
    ),
  ],
);
