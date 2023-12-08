import 'package:alarm/clockSetting.dart';
import 'package:alarm/clockProvider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:provider/provider.dart';
import 'alarmModel.dart';

void main() => runApp(ChangeNotifierProvider(
  create: (context)=>Clockprovider(),
  child: MaterialApp(
      theme: ThemeData(primaryColor: Colors.purpleAccent[50]),
      debugShowCheckedModeBanner: false,
      home: MyApp()),
));

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              "AlarmClock",
              style: TextStyle(fontSize: 30),
            ),
          ),
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body: Consumer<Clockprovider>(
          builder: (context,clock,child) {
            return Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.center,
                color: Colors.white,
                child: Column(

                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Padding(
                      padding: const EdgeInsets.only(left: 30,right: 30, top: 20, bottom: 10),
                      child: DottedBorder(

                        child:Column(
                          children: [
                            Text(
                              clock.formatTime,
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 40,
                                  color: Colors.black),
                            ),
                            Text(
                             clock. formatDate,
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 20,
                                  color: Colors.black),
                            ),

                          ],
                        ),



                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                          itemCount: clock.items.length,
                          itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black, width: 1),
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.deepPurple[100]
                                  ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                    Padding(
                                      padding: const EdgeInsets.all(30.0),

                                      child: Text(clock.items[index].alarmName.toString()),
                                    ),



                                      
                                      GestureDetector(onTap: (){

                                      },
                                          child: Icon(Icons.toggle_on)),

                                ]

                                  ),
                                  Text(clock.items[index].seledtedtime),
                                ],
                              ),
                            )
                          ),
                        );
                      }),
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context,MaterialPageRoute(builder: (context)=> ClockSet()));
                      },
                      child: Container(

                        height: MediaQuery.of(context).size.height*0.08,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.white
                        ),

                        child: Icon(Icons.add),





                        // child: Icon(Icons.add),
                      ),
                    )
                  ],
                ));
          }
        ));
  }


}
