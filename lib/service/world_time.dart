import 'package:http/http.dart' as http; // Importing http package with alias to avoid conflicts
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location;
  String? time;
  String flag;
  String url; // Renamed from Uri to url to avoid conflicts
  bool? isDayTime;

  WorldTime({
    this.time,
    required this.location,
    required this.url,
    required this.flag,
    this.isDayTime
  });

  Future<void> getTime() async {
    try {
      http.Response response = await http.get(
          Uri.parse('https://worldtimeapi.org/api/timezone/$url'));

      if (response.statusCode == 200) {
        Map data = jsonDecode(response.body);

        String dateTime = data['datetime'];
        String offsetHours = data['utc_offset'].substring(
            1, 3); // Corrected field
        String offsetMinutes = data['utc_offset'].substring(4, 6);

        DateTime now = DateTime.parse(dateTime);
        now = now.add(Duration(
          hours: int.parse(offsetHours),
          minutes: int.parse(offsetMinutes),
        ));

        // Set the time property
        time = DateFormat.jm().format(now);

        isDayTime = now.hour > 6 && now.hour < 18 ? true : false;
      } else {
        throw Exception('Failed to load time data');
      }
    } catch (e) {
      print('Caught error: $e');
    }
  }
}

// WorldTime instance = WorldTime(location: 'India', url: "Asia/Kolkata", flag: 'ind.png');
