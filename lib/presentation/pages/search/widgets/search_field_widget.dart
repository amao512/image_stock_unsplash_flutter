import 'package:flutter/material.dart';
import 'package:image_stock_unsplash_flutter/config/resources/strings.dart';
import 'package:image_stock_unsplash_flutter/core/utils/localization/app_localizations.dart';

class SearchField extends StatefulWidget {
  final String query;
  final Function(String) onSearch;

  const SearchField({
    super.key,
    required this.query,
    required this.onSearch,
  });

  @override
  State<StatefulWidget> createState() => _SearchField();
}

class _SearchField extends State<SearchField> {
  final _searchController = TextEditingController();
  String _searchText = '';

  @override
  void initState() {
    super.initState();
    _searchController.text = widget.query;
    _searchController.addListener(_onSearchTextChanged);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchTextChanged() {
    setState(() {
      _searchText = _searchController.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16, left: 16),
      child: TextField(
        cursorColor: Theme.of(context).indicatorColor,
        controller: _searchController,
        onSubmitted: (_) {
          widget.onSearch(_searchText);
        },
        decoration: InputDecoration(
          hintText: context.getString(Strings.search),
          prefixIcon: const Icon(Icons.search),
          suffixIcon: _searchText.isNotEmpty
              ? IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    setState(() {
                      _searchController.clear();
                      _searchText = '';
                    });
                  },
                )
              : null,
        ),
      ),
    );
  }
}
