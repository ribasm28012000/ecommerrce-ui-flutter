import 'package:flutter/material.dart';

contextConnectwithRoute(receivedVontext, route) {
  Navigator.pushAndRemoveUntil(
      receivedVontext,
      MaterialPageRoute(builder: (context) => route),
      (Route<dynamic> route) => true);
}

contextConnectwithoutRoute(receivedVontext, route) {
  Navigator.pushAndRemoveUntil(
      receivedVontext,
      MaterialPageRoute(builder: (context) => route),
      (Route<dynamic> route) => false);
}
