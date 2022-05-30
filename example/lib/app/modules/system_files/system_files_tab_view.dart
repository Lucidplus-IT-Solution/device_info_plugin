import 'package:device_info/device_info.dart';
import 'package:device_info_example/app/global/utils/extensions_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';

class SystemFilesTabView extends StatefulWidget {
  const SystemFilesTabView({Key? key}) : super(key: key);

  @override
  State<SystemFilesTabView> createState() => _SystemFilesTabViewState();
}

class _SystemFilesTabViewState extends State<SystemFilesTabView> {
  Map map = {};

  Future<void> getSystemFilesInfo() async {
    try {
      final result = await DeviceInfo().getSystemFiles();
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
  void initState()  {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await getSystemFilesInfo();
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
        : const Center(child: Text('No System Files Information available'));
  }
}
