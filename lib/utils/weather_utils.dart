import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Util {
  static String getFormattedDate(int dt) {
    var dateTime = DateTime.fromMillisecondsSinceEpoch(dt * 1000);
    dateTime.toLocal();
    return DateFormat("d MMM").format(dateTime);
  }

  static String getFormattedWeeklyDate(int dt) {
    var dateTime = DateTime.fromMillisecondsSinceEpoch(dt * 1000);
    dateTime.toLocal();
    return DateFormat("H:mm E").format(dateTime);
  }

  static Icon getIconByString(String descrtiption, double iconSize) {
    IconData iconData;

    switch (descrtiption) {
      case "Clouds":
        iconData = Icons.cloud;
        break;
      case "Rain":
        iconData = Icons.water_drop;
        break;
      case "Snowy":
        iconData = Icons.ac_unit;
        break;
      default :
        iconData = Icons.sunny;
        break;
    }

    Icon weatherIcon = Icon(
      iconData,
      size: iconSize,
    );
    return weatherIcon;
  }
}
