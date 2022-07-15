import 'package:device_info_x/device_info_x.dart';
import 'package:device_info_example/app/global/utils/extensions_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class DisplayInfoTabView extends StatefulWidget {
  const DisplayInfoTabView({Key? key}) : super(key: key);

  @override
  State<DisplayInfoTabView> createState() => _DisplayInfoTabViewState();
}

class _DisplayInfoTabViewState extends State<DisplayInfoTabView> {
  Map map = {};

  Future<void> getDisplayInfo() async {
    final result = await DeviceInfoX().getDisplayInfo();
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
      await getDisplayInfo();
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
