import 'package:device_info/device_info.dart';
import 'package:device_info_example/app/global/utils/extensions_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';

class ThermalTabView extends StatefulWidget {
  const ThermalTabView({Key? key}) : super(key: key);

  @override
  State<ThermalTabView> createState() => _ThermalTabViewState();
}

class _ThermalTabViewState extends State<ThermalTabView> {
  Map map = {};

  Future<void> getThermalInfo() async {
    try {
      final result = await DeviceInfo().getThermalInfo();
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
      await getThermalInfo();
    });
  }

  @override
  Widget build(BuildContext context) {
    return map.isNotEmpty
        ? ListView.builder(
            itemCount: map.length,
            itemBuilder: (context, index) {
              final key = map.keys.elementAt(index);
              final value = map[key];
              return ListTile(
                title: Text(key.toString().capitalize()),
                subtitle: Text(value.toString()),
              );
            },
          )
        : const Center(child: Text('No Thermal Information available'));
  }
}
