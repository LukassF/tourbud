import 'package:app_1/components/Home/FiltersContainer/home_filters_container.dart';
import 'package:app_1/components/Home/TopContainer/home_top_container.dart';
import 'package:app_1/components/SearchView/search_view.dart';
import 'package:app_1/shared/inputs/search_input.dart';
import 'package:app_1/shared/overlays/basic_overlay.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isSearch = false;

  void onSearchToggle(bool open) {
    setState(() {
      _isSearch = open;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Column(
            children: [HomeTopContainer(), HomeFiltersContainer()],
          ),
          BasicOverlay(
            isOpen: _isSearch,
            child: SearchView(),
          ),
          SearchInput(
            isSearch: _isSearch,
            onSearchToggle: onSearchToggle,
          )
        ],
      ),
    );
  }
}


 // String username = "";
  // void fetchUser() async {
  //   if (widget.accessToken.isNotEmpty) {
  //     Response user = await get(
  //         Uri.parse('${Constants.BACKEND_BASE_URL}api/v1/users/2'),
  //         headers: {"Authorization": "Bearer ${widget.accessToken}"});

  //     var res = jsonDecode(user.body);

  //     print(res);
  //   }
  // }
