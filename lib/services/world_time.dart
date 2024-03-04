import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  late DateTime currentTime;
  String location = '';
  String time = '';
  String flag = '';
  String url = '';
  late bool isDayTime;
  WorldTime({required this.location, required this.flag, required this.url});
  Future<void> getData() async {
    try {
      Response response =
          await get(Uri.parse("https://worldtimeapi.org/api/timezone/$url"));

      Map data = jsonDecode(response.body);
      // print(data);
      String dateTime = data['utc_datetime'];
      String offsetHours = data['utc_offset'].substring(1, 3);
      String offsetMin = data['utc_offset'].substring(4, 6);
      // print(dateTime);
      // print(offset);

      currentTime = DateTime.parse(dateTime);
      currentTime = currentTime.add(Duration(hours: int.parse(offsetHours)));
      currentTime = currentTime.add(Duration(minutes: int.parse(offsetMin)));
      isDayTime = currentTime.hour > 6 && currentTime.hour < 18 ? true : false;
      time = DateFormat.jm().format(currentTime);
      // now = now.add(Duration(hours: int.parse(offset)));} catch (e) {}
    } catch (e) {
      //print('error is $e');
      time = 'could not find data';
    }
  }
}
