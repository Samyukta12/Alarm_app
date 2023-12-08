import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'alarmModel.dart';

class Clockprovider extends ChangeNotifier{

  var timenow = DateTime.now();
  var formatTime = DateFormat('HH: mm').format(DateTime.now());

  var formatDate = DateFormat('EEE, d MMM').format(DateTime.now());

  List<Model> items= [];




}