import 'package:device_info_x/device_info_x.dart';
import 'package:device_info_example/app/global/utils/extensions_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class NetworkTabView extends StatefulWidget {
  const NetworkTabView({Key? key}) : super(key: key);

  @override
  State<NetworkTabView> createState() => _NetworkTabViewState();
}

class _NetworkTabViewState extends State<NetworkTabView> {
  Map map = {};

  Future<void> getNetworkInfo() async {
    final result = await DeviceInfoX().getNetworkInfo();
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
      await getNetworkInfo();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
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
    );
  }
}
