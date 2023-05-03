import 'package:flutter/material.dart';
import 'package:image_stock_unsplash_flutter/di/init_locator.dart';
import 'package:image_stock_unsplash_flutter/presentation/pages/home/home.dart';

import 'config/ui/theme.dart';
import 'config/ui/theme_dark.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initLocator();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Image Stock',
      theme: theme,
      darkTheme: darkTheme,
      home: const HomePage(),
    );
  }
}
