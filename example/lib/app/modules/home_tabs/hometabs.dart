import 'package:device_info_example/app/modules/android/android_tab_view.dart';
import 'package:device_info_example/app/modules/battery/battery_tab_view.dart';
import 'package:device_info_example/app/modules/camera/camera_tab_view.dart';
import 'package:device_info_example/app/modules/cpu/cpu_tab_view.dart';
import 'package:device_info_example/app/modules/display/display.dart';
import 'package:device_info_example/app/modules/drm/drminfo.dart';
import 'package:device_info_example/app/modules/memory/memory_tab_view.dart';
import 'package:device_info_example/app/modules/network/network_tab_view.dart';
import 'package:device_info_example/app/modules/sim/sim_tab_view.dart';
import 'package:device_info_example/app/modules/system/system_tab_view.dart';
import 'package:device_info_example/app/modules/system_files/system_files_tab_view.dart';
import 'package:device_info_example/app/modules/thermal/thermal_info_tab_view.dart';
import 'package:flutter/material.dart';

class HomeTabs extends StatelessWidget {
  const HomeTabs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 12,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
          elevation: 9,
          bottom: const TabBar(
            indicatorColor: Colors.lightBlueAccent,
            labelColor: Colors.blueAccent,
            unselectedLabelColor: Colors.grey,
            indicatorSize: TabBarIndicatorSize.label,
            automaticIndicatorColorAdjustment: true,
            isScrollable: true,
            tabs: [
              Tab(text: 'Android'),
              Tab(text: 'System'),
              Tab(text: 'Battery'),
              Tab(text: 'Camera'),
              Tab(text: 'CPU'),
              Tab(text: 'Display'),
              Tab(text: 'DRM'),
              Tab(text: 'Memory'),
              Tab(text: 'Network'),
              Tab(text: 'SIM'),
              Tab(text: 'System Files'),
              Tab(text: 'Thermal Info'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            AndroidTabView(),
            SystemInfoTabView(),
            BatteryInfoTabView(),
            CameraInfoTabView(),
            CPUInfoTab(),
            DisplayInfoTabView(),
            DRMInfoTabView(),
            MemoryTabView(),
            NetworkTabView(),
            SIMTabView(),
            SystemFilesTabView(),
            ThermalTabView(),
          ],
        ),
      ),
    );
  }
}
