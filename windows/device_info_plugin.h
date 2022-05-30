#ifndef FLUTTER_PLUGIN_DEVICE_INFO_PLUGIN_H_
#define FLUTTER_PLUGIN_DEVICE_INFO_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace device_info {

class DeviceInfoPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  DeviceInfoPlugin();

  virtual ~DeviceInfoPlugin();

  // Disallow copy and assign.
  DeviceInfoPlugin(const DeviceInfoPlugin&) = delete;
  DeviceInfoPlugin& operator=(const DeviceInfoPlugin&) = delete;

 private:
  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace device_info

#endif  // FLUTTER_PLUGIN_DEVICE_INFO_PLUGIN_H_
