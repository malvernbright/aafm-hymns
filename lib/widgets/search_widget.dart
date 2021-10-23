import 'package:aafm_hymns/providers/hymn_provider.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HymnProvider>(
      builder: (context, provider, child) {
        return Center(
          child: TextField(
            controller: provider.searchController,
            textAlign: TextAlign.center,
            textAlignVertical: TextAlignVertical.bottom,
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.green.shade900,
              hintText: 'Search',
              suffixIcon: LineIcon(
                LineIcons.search,
                color: Colors.white,
              ),
              hintStyle: const TextStyle(color: Colors.green),
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
            ),
            onChanged: (value) {
              //  TODO: Build onSearchChanged here
              provider.onSearchChanged(value);
            },
          ),
        );
      },
    );
  }
}
