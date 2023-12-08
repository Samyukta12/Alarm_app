import 'package:alarm/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'alarmModel.dart';
import 'clockProvider.dart';
class ClockSet extends StatefulWidget {
  @override
  State<ClockSet> createState() => _ClockWidgetState();
}

class _ClockWidgetState extends State<ClockSet> {

  late TextEditingController alarmName;

  String ? selectedtime;


  @override
  void initState() {
    alarmName = TextEditingController();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Set alarm"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
            child: Column(
          children: [
            Container(
                height: 200,
                child: CupertinoDatePicker(
                    minimumDate: DateTime.now(),
                    dateOrder: DatePickerDateOrder.ymd,
                    itemExtent: 80,
                    onDateTimeChanged: (pickerTime) {

                      selectedtime=DateFormat().add_Hms().format(pickerTime);


                    })),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CupertinoTextField(
                controller: alarmName,
                placeholder: 'Enter alarm name',
                textCapitalization: TextCapitalization.sentences,
              ),
            ),
            GestureDetector(
              onTap: () {
              context.read<Clockprovider>().items.add(Model(alarmName.text.toString(), true, selectedtime!));
             Navigator.push(context, MaterialPageRoute(builder: (context)=> MyApp()));
              },
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.blueGrey[100],
                      borderRadius: BorderRadius.circular(6)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Save",
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                    ),
                  ),
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
