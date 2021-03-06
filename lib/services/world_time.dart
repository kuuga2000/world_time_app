import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  //location name for the UI
  String location;
  //time in the location
  String time;
  //url to an asset flag icon
  String flag;
  //location url for api endpoint
  String url;

  WorldTime({ this.location, this.flag, this.url });

  Future<void> getTime() async {
    try {
      Response response = await get('http://worldtimeapi.org/api/timezone/${url}');
      Map data = jsonDecode(response.body);
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1,3);

      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      time = DateFormat.jm().format(now);
    } catch (e) {
      print('Error Code $e');
      time = 'Cannot get Time DataS';
    }
  }
}
