#  device_info_X

<!--

This README describes the package. If you publish this package to pub.dev,

this README's contents appear on the landing page for your package.

  

For information about how to write a good package README, see the guide for

[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

  

For general information about developing packages, see the Dart guide for

[creating packages](https://dart.dev/guides/libraries/create-library-packages)

and the Flutter guide for

[developing packages and plugins](https://flutter.dev/developing-packages).

-->

  
`` System ,CPU ,ANDROID ,DRM ,MEMEORY ,CAMERA ,BATTERY ,DISPLAY ,THERMAL ,NETWORK ,SIMINFO ,SYSTEMFILES  ``

  ## Platform Support

| Android | iOS | MacOS | Web | Linux | Windows |
| :-----: | :-: | :---: | :-: | :---: | :-----: |
|   ✔️    | :x:  |  :x:   | :x:  | :x:   | :x:  |

##  Features




- [:white_check_mark:] -  Stable  
&nbsp;
- [:heavy_exclamation_mark:] - Not fully Stable(Some information cannot be retrived. Use with caution)
&nbsp;
- [:x:] - Experimental ( Cannot guarantee,still not added to plugin yet)
&nbsp;&nbsp;&nbsp;
&nbsp;


#### Supported Retriving Information about

- [:heavy_exclamation_mark:] Android

- [:white_check_mark:] System

- [:heavy_exclamation_mark:] Battery

- [:white_check_mark: ] Camera

- [:heavy_exclamation_mark: ] CPU

- [:white_check_mark: ] Display

- [ :white_check_mark:] DRM

- [:white_check_mark: ] Memory

- [:heavy_exclamation_mark:] Network

- [:x: ] SIM

- [:x:] System Files

- [:x:] Thermal Info

## Screenshots of example app

<table>
  <tr>
    <td>Android Info</td>
     <td>Battery</td>
     <td>Camera</td>
      <td>CPU</td>
  </tr>
  <tr>
    <td><img src="https://github.com/Lucidplus-IT-Solution/device_info_plugin/blob/main/screenshots/android.png?raw=true" height="100%" width="100%"></td>
     <td><img src="https://github.com/Lucidplus-IT-Solution/device_info_plugin/blob/main/screenshots/battery.png?raw=true" height="100%" width="100%"></td> 
      <td><img src="https://github.com/Lucidplus-IT-Solution/device_info_plugin/blob/main/screenshots/camera.png?raw=true" height="100%" width="100%"></td>
      <td><img src="https://github.com/Lucidplus-IT-Solution/device_info_plugin/blob/main/screenshots/cpu.png?raw=true" height="100%" width="100%"></td>
  </tr>
 </table>

<table>
  <tr>
    <td>Display</td>
     <td>DRM</td>
     <td>Memory</td>
      <td>Network</td>
     <td>System</td>
     
  </tr>
  <tr>
   <td><img src="https://github.com/Lucidplus-IT-Solution/device_info_plugin/blob/main/screenshots/display.png?raw=true" height="100%" width="100%"></td> 
      <td><img src="https://github.com/Lucidplus-IT-Solution/device_info_plugin/blob/main/screenshots/drm.png?raw=true" height="100%" width="100%"></td>
      <td><img src="https://github.com/Lucidplus-IT-Solution/device_info_plugin/blob/main/screenshots/memory.png?raw=true" height="100%" width="100%"></td>
     <td><img src="https://github.com/Lucidplus-IT-Solution/device_info_plugin/blob/main/screenshots/network.png?raw=true" height="100%" width="100%"></td> 
      <td><img src="https://github.com/Lucidplus-IT-Solution/device_info_plugin/blob/main/screenshots/system.png?raw=true" height="100%" width="100%"></td>
  </tr>
 </table>
 
##  Installation

  

- Add dependencies as

```yaml
device_info:
  git:
    url:  https://github.com/Lucidplus-IT-Solution/device_info_plugin.git
    ref:  main
```

##  Usage
- Add required pemission to  ``AndroidManifest.xml``
```xml

<!-- Include only if you need to access camera & storage info. -->
<uses-permission  android:name="android.permission.CAMERA"/>

<uses-permission  android:name="android.permission.RECORD_AUDIO"/>
<uses-permission

android:name="android.permission.WRITE_EXTERNAL_STORAGE"

tools:ignore="ScopedStorage" />

<uses-permission  android:name="android.permission.READ_EXTERNAL_STORAGE" />

<uses-feature  android:name="android.hardware.camera" />

<uses-feature  android:name="android.hardware.camera.autofocus" />

<!--End Include only if you need to access camera. -->


<!-- Include only if you need to access phone info. -->
<uses-permission

android:name="android.permission.WRITE_SETTINGS"

tools:ignore="ProtectedPermissions" />

<uses-permission  android:name="android.permission.READ_PHONE_STATE" />


<uses-permission  android:name="android.permission.READ_SMS" />

<uses-permission  android:name="android.permission.READ_PHONE_NUMBERS" />

<!-- End.Include only if you need to access phone info. -->


<!-- Include only if you need to access network info. -->
<uses-permission  android:name="android.permission.ACCESS_WIFI_STATE" />

<uses-permission  android:name="android.permission.CHANGE_WIFI_STATE" />

<!-- Always include this permission -->

<uses-permission  android:name="android.permission.ACCESS_COARSE_LOCATION" />

  

<!-- Include only if your app benefits from precise location access. -->

<uses-permission  android:name="android.permission.ACCESS_FINE_LOCATION" />

<uses-permission  android:name="android.permission.CHANGE_NETWORK_STATE" />

<uses-permission  android:name="android.permission.INTERNET" />
```
  

- import the library

```dart

import  'package:device_info_x/device_info_x.dart';

```

- Get a DeviceInfoX Instance
```dart

DeviceInfoX deviceInfox = DeviceInfoX();

```
Usage

```dart

final result =  await deviceInfo.getAndroid();
if (result !=  null) {
	final map = result.toMap(); ///Convert to Map is Possible
}

```
## Methods Available 
```dart

getAndroidDeviceInfo() - Get all info
 ( System,CPU,ANDROID,DRM,MEMEORY,CAMERA,BATTERY,DISPLAY,THERMAL,NETWORK,SIMINFO,SYSTEMFILES)
 
```


##  Features that will be added

-  [x] Added basic device info only supports android for now
- [ ] Will add support for iOS
- [ ] Remove depreceated library
