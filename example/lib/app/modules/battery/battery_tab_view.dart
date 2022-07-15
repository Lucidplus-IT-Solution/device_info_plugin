
import 'package:device_info_example/app/global/utils/extensions_string.dart';
import 'package:device_info_x/device_info_x.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class BatteryInfoTabView extends StatefulWidget {
  const BatteryInfoTabView({Key? key}) : super(key: key);

  @override
  State<BatteryInfoTabView> createState() => _BatteryInfoTabViewState();
}

class _BatteryInfoTabViewState extends State<BatteryInfoTabView> {
  Map map = {};

  Future<void> getBatteryInfo() async {
    final result = await DeviceInfo().getBattery();
    if (result != null) {
      map = result.toMap();
    }
    if (mounted && map.isNotEmpty) {
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await getBatteryInfo();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: map.length,
      itemBuilder: (context, index) {
        final key = map.keys.elementAt(index);
        final value = map[key];
        return ListTile(
          title: Text(key.toString().capitalize()),
          subtitle: Text(value.toString()),
        );
      },
    );
  }
}
