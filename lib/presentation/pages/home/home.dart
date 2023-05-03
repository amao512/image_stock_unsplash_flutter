import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_stock_unsplash_flutter/di/init_locator.dart';
import 'package:image_stock_unsplash_flutter/presentation/pages/home/bloc/photos_cubit.dart';
import 'package:image_stock_unsplash_flutter/presentation/pages/home/widgets/photo_list_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<PhotosCubit>()..loadPhotos()),
      ],
      child: Scaffold(
        appBar: AppBar(
          leading: Image.asset('assets/drawable/ic_logo.png'),
          titleSpacing: 16.0,
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 16),
              child: Icon(Icons.favorite),
            ),
          ],
        ),
        body: const PhotosList(),
      ),
    );
  }
}
