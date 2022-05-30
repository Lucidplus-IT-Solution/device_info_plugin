import 'package:device_info/device_info.dart';
import 'package:device_info/models/camera.dart';
import 'package:device_info_example/app/global/utils/extensions_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class CameraInfoTabView extends StatefulWidget {
  const CameraInfoTabView({Key? key}) : super(key: key);

  @override
  State<CameraInfoTabView> createState() => _CameraInfoTabViewState();
}

class _CameraInfoTabViewState extends State<CameraInfoTabView> {
  List<Cameras> cameras = [];

  Future<void> getCameraInfo() async {
    final result = await DeviceInfo().getCameras();
    if (result != null) {
      cameras = result.cameras;
    }
    if (mounted && cameras.isNotEmpty) {
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await getCameraInfo();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text('Camera 0'),
        ),
        if (cameras.isNotEmpty)
          Flexible(
            child: ListView.builder(
              itemCount: cameras[0].toMap().length,
              itemBuilder: (context, index) {
                var map = cameras[0].toMap();
                final key = map.keys.elementAt(index);
                final value = map[key];
                return ListTile(
                  title: Text(key.toString().capitalize()),
                  subtitle: Text(value.toString()),
                );
              },
            ),
          ),
        const Divider(),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text('Camera 1'),
        ),
        if (cameras.length >= 2)
          Flexible(
            child: ListView.builder(
              itemCount: cameras[1].toMap().length,
              itemBuilder: (context, index) {
                var map = cameras[1].toMap();
                final key = map.keys.elementAt(index);
                final value = map[key];
                return ListTile(
                  title: Text(key.toString().capitalize()),
                  subtitle: Text(value.toString()),
                );
              },
            ),
          ),
      ],
    );
  }
}
