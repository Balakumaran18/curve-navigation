import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Curve Navigation',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
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
  int king = 0;
  double anileft = 2.1;
  double aniright = 2.1;
  double anitop = 1.40;
  double anibottom = 0;
  Color makecolor = Colors.red;

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      // backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: test[king]['colorbody'],
        elevation: 0,
      ),
      body: Stack(
        children: [
          Container(
            color: test[king]['colorbody'],
            child: Center(
                child: Text(
              test[king]['bodytext'],
              style: TextStyle(color: Colors.white),
            )),
          ),
          Positioned(
            bottom: 0,
            top: 0,
            left: 0,
            right: 0,
            child: CustomPaint(
              painter: CustomHalfCircleClipper(),
            ),
          ),
          AnimatedPositioned(
              bottom: anibottom,
              top: media.height / anitop,
              left: media.width / anileft,
              right: media.width / aniright,
              child: Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  color: Colors.black,
                  shape: BoxShape.circle,
                ),
              ),
              duration: Duration(microseconds: 0)),
        ],
      ),
      bottomNavigationBar: bottombar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }

  Widget bottombar() {
    return BottomNavigationBar(
      elevation: 0,
      backgroundColor: test[king]['colorbody'],
      type: BottomNavigationBarType.fixed,
      fixedColor: Color(0xff2398C3),
      showSelectedLabels: false,
      showUnselectedLabels: false,
      currentIndex: king,
      onTap: (val) {
        setState(() {
          king = val;
          for (var i = 0; i <= test.length - 1; i++) {
            if (val == i) {
              test[val]['heightin'] = 30.0;
              aniright = test[val]['aniright'];
              anileft = test[val]['anileft'];
              anitop = test[val]['anitop'];
              anibottom = test[val]['anibottom'];
            } else {
              test[i]['heightin'] = 20.0;
            }
          }
        });
      },
      items: [
        BottomNavigationBarItem(
          title: Text('Search'),
          icon: Icon(test[0]['Iconin'],
              color: Colors.grey, size: test[0]['heightin']),
        ),
        BottomNavigationBarItem(
          title: Text('Browse'),
          icon: Icon(test[1]['Iconin'],
              color: Colors.grey, size: test[1]['heightin']),
        ),
        BottomNavigationBarItem(
          title: Text('Icon'),
          icon: Icon(test[2]['Iconin'],
              color: Colors.grey, size: test[2]['heightin']),
        ),
        BottomNavigationBarItem(
          title: Text('Favorites'),
          icon: Icon(test[3]['Iconin'],
              color: Colors.grey, size: test[3]['heightin']),
        ),
        BottomNavigationBarItem(
          title: Text('Settings'),
          icon: Icon(test[4]['Iconin'],
              color: Colors.grey, size: test[4]['heightin']),
        ),
      ],
    );
  }

  List test = [
    {
      'Iconin': Icons.search,
      'heightin': 20.0,
      'anitop': 1.33,
      'anileft': 30.0,
      'aniright': 1.2,
      'anibottom': 0.0,
      'colorbody': Colors.red,
      'bodytext': '1'
    },
    {
      'Iconin': Icons.view_list,
      'heightin': 20.0,
      'anitop': 1.36,
      'anileft': 12.0,
      'aniright': 2.1,
      'anibottom': 10.0,
      'colorbody': Colors.yellow,
      'bodytext': '2'
    },
    {
      'Iconin': Icons.home,
      'heightin': 20.0,
      'anitop': 1.40,
      'anileft': 2.1,
      'aniright': 2.1,
      'anibottom': 1.0,
      'colorbody': Colors.white,
      'bodytext': '3'
    },
    {
      'Iconin': Icons.bookmark,
      'heightin': 20.0,
      'anitop': 1.36,
      'anileft': 1.5,
      'aniright': 4.0,
      'anibottom': 10.0,
      'colorbody': Colors.orangeAccent,
      'bodytext': '4'
    },
    {
      'Iconin': Icons.settings,
      'heightin': 20.0,
      'anitop': 1.33,
      'anileft': 1.2,
      'aniright': 30.0,
      'anibottom': 0.0,
      'colorbody': Colors.indigo,
      'bodytext': '5'
    },
  ];
}

class CustomHalfCircleClipper extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.grey
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.0;

    Path path = Path();
    path.moveTo(0, size.height);
    path.quadraticBezierTo(
        size.width / 2, size.height / 1.1, size.width, size.height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
