import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:image_stock_unsplash_flutter/config/resources/theme/theme_light.dart';
import 'package:image_stock_unsplash_flutter/core/utils/localization/localizations_delegate.dart';
import 'package:image_stock_unsplash_flutter/di/init_locator.dart';
import 'package:image_stock_unsplash_flutter/presentation/router/go_router.dart';

import 'config/resources/strings.dart';
import 'config/resources/theme/theme_dark.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initLocator();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      localizationsDelegates: localDelegates(),
      supportedLocales: AppLocalizationsDelegate.supportLocales,
      title: Strings.appName,
      theme: lightTheme,
      darkTheme: darkTheme,
      routerConfig: goRouter,
    );
  }

  List<LocalizationsDelegate> localDelegates() {
    return [
      AppLocalizationsDelegate(),
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
    ];
  }
}
