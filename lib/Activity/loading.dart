//
// import 'package:flutter/material.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:weather_app/api_sevice/worker.dart';
//
// class Loading extends StatefulWidget {
//   const Loading({super.key});
//
//   @override
//   State<Loading> createState() => _LoadingState();
// }
//
// class _LoadingState extends State<Loading> {
// // String?location;
// String city="Noida";
//   String? tem;
//   String? hum;
//   String ? air;
//   String?des;
//   String? main;
//
//
//   void startApp(String city)async{
//     Worker data= Worker(location: city);
//     await data.getData();
//    Future.delayed(const Duration(seconds: 2),(){
//       tem=data.temp;
//       // location=data.location;
//       hum=data.humidity;
//       air=data.airSpeed;
//       des=data.description;
//       Navigator.pushReplacementNamed(context, '/home', arguments: {
//         "tem_value":tem,
//         "hum_value":hum,
//         "air_value":air,
//         "des_value":des,
//         "city_value":city
//         // "loc_value":location
//       });
//     });
//
//
//   }
//   @override
//   void initState() {
//     super.initState();
//   }
//   @override
//   void dispose() {
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final Map search = ModalRoute.of(context)?.settings.arguments as Map? ?? {};
//     if(search.isNotEmpty){
//       city=search['search_value'];
//     }
//     startApp(city);
//     return  Scaffold(
//       backgroundColor: Colors.teal.shade300,
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Image.asset("assets/images/img.png",height: 250, width: 250,),
//             const Text('Wheater App',style: TextStyle(fontSize: 20,fontWeight:FontWeight.bold),),
//             const SizedBox(height: 10,),
//             const Text("Created By Mohit",style: TextStyle(color:Colors.white,fontSize: 16,fontWeight:FontWeight.bold),),
//             const SizedBox(height: 10,),
//          const SpinKitWave(
//           color: Colors.blue,
//           size: 50.0,
//         ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_app/api_sevice/worker.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String city = "Noida";
  String? tem;
  String? hum;
  String? air;
  String? des;
  String? main;

  // Start the app and fetch the weather data
  void startApp(String city) async {
    Worker data = Worker(location: city);
    await data.getData();

    if (!mounted) return;  // Check if the widget is still mounted before continuing

    // Simulate a delay (e.g., for loading) and then navigate to the next screen
    Future.delayed(const Duration(seconds: 2), () {
      tem = data.temp;
      hum = data.humidity;
      air = data.airSpeed;
      des = data.description;

      if (mounted) {  // Ensure that the widget is still mounted before using context
        Navigator.pushReplacementNamed(context, '/home', arguments: {
          "tem_value": tem,
          "hum_value": hum,
          "air_value": air,
          "des_value": des,
          "city_value": city
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();

    // Start fetching the weather data once the widget is initialized
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final Map search = ModalRoute.of(context)?.settings.arguments as Map? ?? {};
      if (search.isNotEmpty) {
        city = search['search_value'];
      }
      startApp(city);  // Moved this to initState to avoid calling on every rebuild
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal.shade300,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/img.png", height: 250, width: 250),
            const Text(
              'Weather App',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              "Created By Mohit",
              style: TextStyle(
                  color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const SpinKitWave(
              color: Colors.blue,
              size: 50.0,
            ),
          ],
        ),
      ),
    );
  }
}
