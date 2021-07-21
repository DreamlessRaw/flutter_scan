import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_scan/utils.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '扫码示例应用',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Permission.camera
              .request()
              .isGranted
              .then((value) {
            if (!value) {
              showCupertinoDialog(context: context, builder: (context) {
                return CupertinoAlertDialog(title: Text('你拒绝了相机权限无法i进行扫码'),
                  actions: [
                    CupertinoButton(child: Text('确定'), onPressed: () {
                      Navigator.pop(context);
                    })
                  ],);
              });
            } else {
              Utils.scannerCode(context, (value) {
                showCupertinoDialog(
                    context: context,
                    builder: (context) {
                      return CupertinoAlertDialog(
                        title: Text('返回值:$value'),
                        actions: [
                          CupertinoButton(
                              child: Text('确认'),
                              onPressed: () => Navigator.pop(context))
                        ],
                      );
                    });
              });
            }
          });
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
