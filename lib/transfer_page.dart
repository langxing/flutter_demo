
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:toast_plugin/toast_plugin.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // 平台方法名
  String api = "getBatteryLevel";
  String funToast = "showToast";
  String _batteryLevel = "当前平台电量：";

  @override
  void initState() {
    super.initState();
    _getBatteryLevel();
  }

  // 2. 调用平台方法
  void _getBatteryLevel() async {
    // 1. 定义平台通道
    const platform = const MethodChannel('flutter/battery');
    String batteryLevel;
    print("开始调用平台方法：");
    try{
      final result = await platform.invokeMethod(api);
      batteryLevel = "当前平台电量：$result";
    } on PlatformException catch(e) {
      batteryLevel = "fail：$e";
    }
    setState(() {
      _batteryLevel = batteryLevel;
    });
  }

  void _showToast(String message) async {
    // 1. 定义平台通道
    String version = await ToastPlugin.platformVersion;
    print("vasion:"+version);
    const platform = const MethodChannel('flutter/toast');
    await platform.invokeMethod(funToast, {"message" : "当前系统版本$version"});

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '$_batteryLevel',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showToast("显示一个弹窗");
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
