import 'package:flutter/material.dart';

priorityColor(priority) {
  switch (priority) {
    case 'critical':
      return Colors.redAccent;
      break;
    case 'urgent':
      return Colors.yellowAccent;
      break;
    default:
      return Colors.greenAccent;
  }
}
