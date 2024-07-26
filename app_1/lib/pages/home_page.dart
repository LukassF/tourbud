import 'package:app_1/components/Home/TopContainer/home_top_container.dart';
import 'package:app_1/shared/inputs/search_input.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isSearch = false;

  void onSearchToglle(bool open) {
    setState(() {
      _isSearch = open;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [HomeTopContainer()],
          ),
          Positioned(
              left: 0,
              height: _isSearch ? MediaQuery.sizeOf(context).height : 0,
              width: _isSearch ? MediaQuery.sizeOf(context).width : 0,
              child: AnimatedOpacity(
                curve: Curves.decelerate,
                duration: Duration(milliseconds: 250),
                opacity: _isSearch ? 1 : 0,
                child: Container(
                  color: Colors.white,
                ),
              )),
          SearchInput(
            isSearch: _isSearch,
            onSearchToggle: onSearchToglle,
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
