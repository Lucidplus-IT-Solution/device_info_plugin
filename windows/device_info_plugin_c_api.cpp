#include "include/device_info/device_info_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "device_info_plugin.h"

void DeviceInfoPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  device_info::DeviceInfoPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
