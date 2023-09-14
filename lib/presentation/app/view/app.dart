import 'package:flutter/material.dart';
import 'package:flutter_atlanta_packages_example/presentation/l10n/l10n.dart';
import 'package:flutter_atlanta_packages_example/presentation/routing/router.dart';
import 'package:flutter_atlanta_packages_example/presentation/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: theme,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      routerConfig: router,
    );
  }
}
