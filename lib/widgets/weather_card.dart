// import 'package:flutter/material.dart';
// import 'package:open_weather_widget/open_weather_widget.dart';

// class WeatherCard extends StatelessWidget {
//   const WeatherCard({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     String apiKey = "17a7d256dc83a5a925da30d70837769a";

//     // double marginLeft = 10.0;
//     // double marginTop = 8.0;
//     return Card(
//       elevation: 5,
//       // margin: EdgeInsets.symmetric(horizontal: marginLeft, vertical: marginTop),
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(21)),
//       child: ClipPath(
//         clipper: ShapeBorderClipper(
//             shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(21))),
//         child: OpenWeatherWidget(
//           color: Colors.black,
//           borderRadius: BorderRadius.circular(21),
//           // color: const Color.fromARGB(195, 230, 230, 230),
//           locationColor: const Color.fromARGB(255, 255, 255, 255),
//           temperatureColor: const Color.fromARGB(255, 255, 255, 255),

//           activeColor: const Color.fromARGB(157, 255, 214, 180),
//           weatherTextColor: const Color.fromARGB(255, 255, 255, 255),
//           latitude: 25.4320,
//           longitude: 77.6644,
//           location: "Shivpuri",
//           height: 200,
//           apiKey: apiKey,
//           alignment: MainAxisAlignment.center,
//           margin: const EdgeInsets.all(5),
//           // minTemperatureTextStyle:const TextStyle(fontWeight: FontWeight.w300)
//         ),
//       ),
//     );
//   }
// }
