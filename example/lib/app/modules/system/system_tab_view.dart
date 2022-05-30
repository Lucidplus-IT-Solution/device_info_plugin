import 'package:device_info/device_info.dart';
import 'package:device_info_example/app/global/utils/extensions_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';

class SystemInfoTabView extends StatefulWidget {
  const SystemInfoTabView({Key? key}) : super(key: key);

  @override
  State<SystemInfoTabView> createState() => _SystemInfoTabViewState();
}

class _SystemInfoTabViewState extends State<SystemInfoTabView> {
  Map map = {};

  Future<void> getSystemInfo() async {
    try {
      final result = await DeviceInfo().getSystemInfo();

      if (result != null) {
        map = result.toMap();
      }
    } catch (e) {
      if (e is PlatformException) {}
    }
    if (mounted && map.isNotEmpty) {
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await getSystemInfo();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
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
