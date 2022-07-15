import 'package:device_info_x/device_info_x.dart';
import 'package:device_info_example/app/global/utils/extensions_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';

class SIMTabView extends StatefulWidget {
  const SIMTabView({Key? key}) : super(key: key);

  @override
  State<SIMTabView> createState() => _SIMTabViewState();
}

class _SIMTabViewState extends State<SIMTabView> {
  Map map = {};

  Future<void> getSimInfo() async {
    try {
      final result = await DeviceInfoX().getSimInfo();
      if (result != null) {
        map = result.toMap();
      }
      if (mounted && map.isNotEmpty) {
        setState(() {});
      }
    } catch (e) {
      if (e is PlatformException) {}
    }
  }

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await getSimInfo();
    });
  }

  @override
  Widget build(BuildContext context) {
    return map.isNotEmpty
        ? ListView.separated(
            itemCount: map.length,
            padding: EdgeInsets.zero,
            separatorBuilder: (context, index) => const Divider(),
            itemBuilder: (context, index) {
              final key = map.keys.elementAt(index);
              final value = map[key];
              if (value != null) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(key.toString().capitalize()),
                    ),
                    ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(
                            parent: BouncingScrollPhysics()),
                        itemCount: value.length,
                        itemBuilder: (context, index) {
                          final key1 = value.keys.elementAt(index);
                          final value1 = value[key1];
                          return ListTile(
                            title: Text(key1),
                            subtitle: Text(value1.toString()),
                          );
                        }),
                  ],
                );
              } else {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(key.toString().capitalize()),
                    ),
                    ListTile(
                      title: Text(key.toString().capitalize()),
                      subtitle: const Text("Not available"),
                    ),
                  ],
                );
              }
            },
          )
        : const Center(child: Text('No SIM Information available'));
  }
}
