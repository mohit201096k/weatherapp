import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class Worker{
  String? location;
  Worker({this.location}){
    location=location;
  }
  String? temp;
  String? humidity;
  String ? airSpeed;
  String?description;
  String? main;

  Future<void> getData() async {
    try {
      // Fetch the weather data from the API
      Response response = await http.get(Uri.parse(
          "https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/timeline/$location?unitGroup=metric&key=KUP3VKDSRFCKL4QHUQKJ7PLRU&contentType=json"));

      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);
        // Extract description, location, and days
        String getLocation = data['address'];
        List<dynamic> getDays = data["days"];
        String getDescription = getDays[0]["description"];

        double getTemp = getDays[0]["temp"];
        double getHumidity=getDays[0]["humidity"];
        double getWindSpeed=getDays[0]["windspeed"];

        // Assign the values
        description = getDescription.toString();
        location = getLocation;
        temp = getTemp.toString();
        humidity=getHumidity.toString();
        airSpeed=getWindSpeed.toString();

      } else {
        print("Failed to fetch data. Status code: ${response.statusCode}");
      }
    } catch (e) {
      print("Error: $e");
    }
  }
}