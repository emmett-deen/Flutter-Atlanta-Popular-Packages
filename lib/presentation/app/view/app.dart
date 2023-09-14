import 'package:flutter/material.dart';
import 'package:flutter_atlanta_packages_example/presentation/l10n/l10n.dart';
import 'package:flutter_atlanta_packages_example/presentation/pages/coffee_list/coffee_list_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.brown,
          brightness: Brightness.dark,
        ),
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: const CoffeeListPage(),
    );
  }
}
