import 'package:device_info/device_info.dart';
import 'package:device_info_example/app/global/utils/extensions_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class DRMInfoTabView extends StatefulWidget {
  const DRMInfoTabView({Key? key}) : super(key: key);

  @override
  State<DRMInfoTabView> createState() => _DRMInfoTabViewState();
}

class _DRMInfoTabViewState extends State<DRMInfoTabView> {
  Map map = {};

  Future<void> getDRMInfo() async {
    final result = await DeviceInfo().getDRMInfo();
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
      await getDRMInfo();
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
