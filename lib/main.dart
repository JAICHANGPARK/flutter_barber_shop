import 'package:flutter/material.dart';

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
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var selectedDate = 19;
  var selectedBarber = "Jonathan";
  var selectedTime = '12:38';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Text(
          'BOOKING',
          style: TextStyle(
              fontFamily: 'FiraSans', fontSize: 16.0, color: Colors.black),
        ),
        centerTitle: true,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {}),
      ),
      body: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: 100.0,
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                      blurRadius: 3.0,
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 4.0),
                ], color: Colors.white),
              ),
              Positioned(
                top: 20.0,
                left: 15.0,
                right: 15.0,
                child: Container(
                  height: 60.0,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      getDate(18, 'Tue'),
                      SizedBox(width: 25.0),
                      getDate(19, 'Wed'),
                      SizedBox(width: 25.0),
                      getDate(20, 'Thu'),
                      SizedBox(width: 25.0),
                      getDate(21, 'Fri'),
                      SizedBox(width: 25.0),
                      getDate(22, 'Sat'),
                      SizedBox(width: 25.0),
                      getDate(23, 'Sun'),
                      SizedBox(width: 25.0),
                      getDate(24, 'Mon'),
                      SizedBox(width: 25.0),
                    ],
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 35.0,
          ),
          Center(
            child: Text(
              "Hagorapt",
              style: TextStyle(
                  letterSpacing: 2.0,
                  fontSize: 30.0,
                  color: Colors.black.withOpacity(0.6),
                  fontFamily: 'Nunito',
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 15.0,
          ),
          Row(
            children: <Widget>[
              SizedBox(
                width: 15.0,
              ),
              getService('Beards', 50),
              getService('Crew Cut', 15),
            ],
          ),
          SizedBox(
            height: 15.0,
          ),
          Container(
            height: 175.0,
            child: ListView(
              padding: EdgeInsets.only(left: 15.0, right: 15.0),
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                getBarber('assets/style2.jpg', 'Anton'),
                SizedBox(width: 15.0),
                getBarber('assets/style1.jpg', 'Jonathan'),
                SizedBox(width: 15.0),
                getBarber('assets/style3.jpeg', 'Jim'),
                SizedBox(width: 15.0),
              ],
            ),
          ),

          SizedBox(height: 20.0,),
          Container(
            height: 50.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                getTime('11.00'),
                SizedBox(width: 25.0),
                getTime('12.30'),
                SizedBox(width: 25.0),
                getTime('13.30'),
                SizedBox(width: 25.0),
                getTime('15.00'),
                SizedBox(width: 25.0)
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget getDate(int date, String day) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      curve: Curves.easeIn,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0), color: switchColor(date)),
      width: 60.0,
      height: 60.0,
      child: InkWell(
        onTap: () {
          selectDate(date);
        },
        child: Center(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 7.0,
              ),
              Text(
                date.toString(),
                style: TextStyle(
                  fontSize: 17.0,
                  fontFamily: 'Nunito',
                  fontWeight: FontWeight.bold,
                  color: switchContentColor(date),
                ),
              ),
              Text(
                day,
                style: TextStyle(
                  fontFamily: 'FiraSans',
                  fontSize: 15.0,
                  color: switchContentColor(date),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Color switchColor(date) {
    if (date == selectedDate) {
      return Colors.black.withOpacity(0.8);
    } else {
      return Colors.grey.withOpacity(0.2);
    }
  }

  Color switchContentColor(date) {
    if (date == selectedDate) {
      return Colors.white;
    } else {
      return Colors.black;
    }
  }

  selectDate(date) {
    setState(() {
      selectedDate = date;
    });
  }

  Widget getService(String name, int price) {
    return Container(
      child: Row(
        children: <Widget>[
          Text(
            name,
            style: TextStyle(
                fontFamily: 'Nunito', fontSize: 17.0, color: Colors.black),
          ),
          SizedBox(
            width: 5.0,
          ),
          Text(
            '\$' + price.toString(),
            style: TextStyle(
                fontFamily: 'Nunito', fontSize: 17.0, color: Colors.grey),
          ),
          IconButton(
            icon: Icon(
              Icons.close,
            ),
            onPressed: () {},
          )
        ],
      ),
    );
  }


  selectBarber(name){
    setState(() {
      selectedBarber = name;
    });
  }

  Color getSelectedBarber(name){
    print(selectedBarber);
    print(selectedDate);
    print(selectedTime);
    if (name == selectedBarber) {
      return Colors.green.withOpacity(0.3);
    } else {
      return Colors.transparent;
    }
  }

  Widget getBarber(String imagePath, String name) {
    return Column(
      children: <Widget>[
        Stack(
          children: <Widget>[
            Container(
              height: 150.0,
              width: 150.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7.0),
                  image: DecorationImage(
                      image: AssetImage(imagePath), fit: BoxFit.cover)),
            ),
            InkWell(
              onTap: () {
                selectBarber(name);
              },
              child: Container(
                height: 150.0,
                width: 150.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7.0),
                    color: getSelectedBarber(name),),
              ),
            )
          ],
        ),

        SizedBox(height: 7.0),
        Text(
          name,
          style: TextStyle(fontFamily: 'FirSans', fontSize: 15.0),
        )

      ],
    );
  }


}
