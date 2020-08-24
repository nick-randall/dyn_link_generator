import 'package:flutter/material.dart';
import 'package:uni_links/uni_links.dart';
import 'dynamic_links.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'psi_Link',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'link generator'),
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
  int _counter = 0;
  Uri myLink;
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  String deepLink = 'null';
/*  Future<Null> initUniLinks() async {
    deepLink = ('hi'); //await getInitialLink();
    print("link = $deepLink");
  }
*/
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      // Wait until we have the app start up string

      try {
        deepLink = await getInitialLink();
        _incrementCounter();
      } catch (e) {
        print('getInitialLink ERROR');
        print(e);
      }

      //initUniLinks();
      if (deepLink != null) {
        print(deepLink);
      }
    });
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                  onPressed: dynamicLink, child: Text("create link for psi")),
              RaisedButton(
                  onPressed: dynamicLinkForThisApp,
                  child: Text("create link for this app")),
              Text(
                'link used to start this app:',
              ),
              Text(
                '$deepLink',
                style: Theme.of(context).textTheme.headline4,
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _incrementCounter,
        )

        // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
