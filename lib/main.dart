import 'package:flutter/material.dart';
import 'package:lab_01/ui/todo_screen.dart';
import './ui/first_screen.dart';
import './ui/second_screen.dart';
import './ui/my_custom_form.dart';
import './ui/list_data.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      // home: MyHomePage(),
      initialRoute: "/",
      routes:{
        "/" : (context) => TodoScreen(),
        "/second" : (context) => SecondScreen()
      }
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('TabBar'),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.directions_car),
                text: 'Car',
              ),
              Tab(
                icon: Icon(Icons.directions_transit),
                text: 'Transit',
              ),
              Tab(
                icon: Icon(Icons.directions_bike),
                text: 'Bike',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Icon(Icons.directions_car),
            Icon(Icons.directions_transit),
            Icon(Icons.directions_bike)
          ],
        ),
      ),
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() {
//     // TODO: implement createState
//     return MyHomePageState();
//   }
// }

// class MyHomePageState extends State<MyHomePage> {
//   @override
//   var counter = 0;

//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Hello World'),
//       ),
//       body: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: <Widget>[
//           Text('$counter'),
//           Text('$counter'),
//           Text('$counter')
//         ],
//       ),
//       floatingActionButton: IconButton(
//         icon: Icon(Icons.add),
//         onPressed: () {
//           setState(() {
//             counter++;
//           });
//           print("counter value: $counter");
//         },
//       ),
//     );
//   }
// }