import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
import 'package:websafe_svg/websafe_svg.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bubble Bottom Bar Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Bubble Bottom Bar Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentIndex;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentIndex = 0;
  }

  void changePage(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  // final Widget svgIcon =
  //     SvgPicture.asset('assets/help.svg', semanticsLabel: 'A red up arrow');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [],
        ),
      ),
      appBar: AppBar(
        title: Text(widget.title),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
        backgroundColor: Colors.red,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      bottomNavigationBar: BubbleBottomBar(
        hasNotch: true,
        fabLocation: BubbleBottomBarFabLocation.end,
        opacity: .2,
        currentIndex: currentIndex,
        onTap: changePage,
        borderRadius: BorderRadius.vertical(
            top: Radius.circular(
                16)), //border radius doesn't work when the notch is enabled.
        elevation: 8,
        items: <BubbleBottomBarItem>[
          BubbleBottomBarItem(
              backgroundColor: Colors.red,
              icon: WebsafeSvg.asset('assets/home.svg',
                  height: 20, color: Colors.blue),
              activeIcon: WebsafeSvg.asset('assets/home.svg',
                  height: 20, color: Colors.red),
              title: Text("Home")),
          BubbleBottomBarItem(
              backgroundColor: Colors.deepPurple,
              icon: WebsafeSvg.asset('assets/discover.svg',
                  height: 20, color: Colors.red),
              activeIcon: WebsafeSvg.asset('assets/discover.svg',
                  height: 20, color: Colors.red),
              title: Center(child: Text("Logs"))),
          BubbleBottomBarItem(
              backgroundColor: Colors.indigo,
              icon: WebsafeSvg.asset('assets/help.svg',
                  height: 20, color: Colors.red),
              activeIcon: WebsafeSvg.asset('assets/help.svg',
                  height: 20, color: Colors.red),
              title: Text("Folders")),
          BubbleBottomBarItem(
              backgroundColor: Colors.green,
              icon: WebsafeSvg.asset('assets/login.svg', color: Colors.red),
              activeIcon:
                  WebsafeSvg.asset('assets/login.svg', color: Colors.red),
              title: Text("Menu"))
        ],
      ),
    );
  }
}
