import 'package:cloud_firestore/cloud_firestore.dart';

class DataUtil {

  static String formatTimestamp(Timestamp time){
    DateTime data = new DateTime.fromMicrosecondsSinceEpoch(time.millisecondsSinceEpoch * 1000);
    String dateText ="${data.day.toString().padLeft(2,'0')}/${data.month.toString().padLeft(2,'0')}/${data.year.toString()}";
    print(dateText);
    return dateText;
  }

}