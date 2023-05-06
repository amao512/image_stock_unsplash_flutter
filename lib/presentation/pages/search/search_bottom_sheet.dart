import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_stock_unsplash_flutter/core/utils/extensions/string_ext.dart';
import 'package:image_stock_unsplash_flutter/di/init_locator.dart';
import 'package:image_stock_unsplash_flutter/presentation/pages/search/bloc/search_photo_cubit.dart';
import 'package:image_stock_unsplash_flutter/presentation/pages/search/widgets/search_results_widget.dart';

import 'widgets/search_field_widget.dart';

class SearchBottomSheet extends StatefulWidget {
  final String? query;

  const SearchBottomSheet({super.key, this.query});

  @override
  State<StatefulWidget> createState() => _SearchBottomSheet();
}

class _SearchBottomSheet extends State<SearchBottomSheet> {
  String _query = '';

  @override
  void initState() {
    if (widget.query != null) {
      _query = widget.query!;
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<SearchPhotoCubit>(),
      child: Container(
        height: MediaQuery.of(context).size.height - 24,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              padding: const EdgeInsets.all(16),
              onPressed: () => Navigator.of(context).pop(),
              icon: const Icon(Icons.close, size: 24),
            ),
            SearchField(
              query: widget.query.orEmpty(),
              onSearch: (query) {
                setState(() {
                  _query = query;
                });
              },
            ),
            const SizedBox(height: 16),
            SearchResults(query: _query),
          ],
        ),
      ),
    );
  }
}
