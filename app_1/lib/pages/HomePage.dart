import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.red,
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

  // final List<Food> _foodItems = [
  //   const Food(
  //       image:
  //           "https://sawepecomcdn.blob.core.windows.net/ph-web-ordering/Pizza_Hut_PL/Zdjecia/Refresh_26.10.23/WWW/1.PIZZE/pizza_szynkapieczarka_1000x1000.jpg",
  //       name: "Pizza"),
  //   const Food(
  //       image:
  //           "https://staticsmaker.iplsc.com/smaker_production_2023_01_25/f7ecd17cbc17b7234143fa5b3a293872-content.jpg",
  //       name: "Lasagne"),
  //   const Food(
  //       image:
  //           "https://ojciecgotuje.pl/wp-content/uploads/2019/05/Spaghetti-Bolognese.jpg",
  //       name: "Spaghetti"),
  //   const Food(
  //       image:
  //           "https://sawepecomcdn.blob.core.windows.net/ph-web-ordering/Pizza_Hut_PL/Zdjecia/Refresh_26.10.23/WWW/1.PIZZE/pizza_szynkapieczarka_1000x1000.jpg",
  //       name: "Pizza"),
  //   const Food(
  //       image:
  //           "https://staticsmaker.iplsc.com/smaker_production_2023_01_25/f7ecd17cbc17b7234143fa5b3a293872-content.jpg",
  //       name: "Lasagne"),
  //   const Food(
  //       image:
  //           "https://ojciecgotuje.pl/wp-content/uploads/2019/05/Spaghetti-Bolognese.jpg",
  //       name: "Spaghetti"),
  // ];
       // ListView(
          //     scrollDirection: Axis.horizontal,
          //     padding: const EdgeInsets.all(15.0),
          //     children: _foodItems.asMap().entries.map((food) {
          //       int index = food.key;
          //       Food value = food.value;

          //       return Row(
          //         children: [
          //           Column(
          //             children: [
          //               CircleAvatar(
          //                   radius: 35.0,
          //                   backgroundImage: NetworkImage(value.image!)),
          //               Text(
          //                 value.name!,
          //                 style: const TextStyle(
          //                     fontSize: 12.0, fontWeight: FontWeight.w500),
          //               )
          //             ],
          //           ),
          //           index == _foodItems.length - 1
          //               ? const SizedBox(width: 0)
          //               : const SizedBox(width: 20.0)
          //         ],
          //       );
          //   }).toList()),