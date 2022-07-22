import 'dart:convert';

/// [Network] is information about the network.
class Network {
  /// [Telephony] is information about the telephony.
  Telephony? telephony;

  /// [Wifi] is information about the wifi.
  Wifi? wifi;

  /// constructor for the network class.
  Network({
    this.telephony,
    this.wifi,
  });

  /// [copyWith] is the method to copy the class.
  Network copyWith({
    Telephony? telephony,
    Wifi? wifi,
  }) {
    return Network(
      telephony: telephony ?? this.telephony,
      wifi: wifi ?? this.wifi,
    );
  }

  /// [toMap] returns a map of the object.
  Map<String, dynamic> toMap() {
    return {
      'telephony': telephony?.toMap(),
      'wifi': wifi?.toMap(),
    };
  }

  /// [fromMap] returns instance of [Network] from a map.
  factory Network.fromMap(Map<String, dynamic> map) {
    return Network(
      telephony:
          map['telephony'] != null ? Telephony.fromMap(map['telephony']) : null,
      wifi: map['wifi'] != null ? Wifi.fromMap(map['wifi']) : null,
    );
  }

  /// [toJson] returns a json string of the object.
  String toJson() => json.encode(toMap());

  /// [fromJson] returns a instance of [Network] from a json string.
  factory Network.fromJson(String source) =>
      Network.fromMap(json.decode(source));

  @override
  String toString() => 'Network(telephony: $telephony, wifi: $wifi)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Network &&
        other.telephony == telephony &&
        other.wifi == wifi;
  }

  @override
  int get hashCode => telephony.hashCode ^ wifi.hashCode;
}

/// This includes the telephony information.
class Telephony {
  /// [phoneType] is the type of phone.i.e. gsm, cdma, etc.
  String? phoneType;

  /// [networkOperatorName] is the name of the network operator.
  String? networkOperatorName;

  /// [networkOperatorCode] is the code of the network operator.
  String? networkOperatorCode;

  /// [networkOperatorCountry] is the code of the network country.
  String? networkOperatorCountry;

  /// [simProviderName] is the name of the sim provider.
  String? simProviderName;

  /// [simProviderCountry] is the country code of the sim provider.
  String? simProviderCountry;

  /// [simState] is the state of the sim.
  String? simState;

  /// [networkType] is the type of network.i.e. wifi, cellular, etc.
  String? networkType;

  /// [isDeviceRoaming] is the state of the device roaming . i.e .
  bool? isDeviceRoaming;

  /// constructor of [Telephony]
  Telephony({
    this.phoneType,
    this.networkOperatorName,
    this.networkOperatorCode,
    this.networkOperatorCountry,
    this.simProviderName,
    this.simProviderCountry,
    this.simState,
    this.networkType,
    this.isDeviceRoaming,
  });

  /// [copyWith] is the function to copy the class.
  Telephony copyWith({
    String? phoneType,
    String? networkOperatorName,
    String? networkOperatorCode,
    String? networkOperatorCountry,
    String? simProviderName,
    String? simProviderCountry,
    String? simState,
    String? networkType,
    bool? isDeviceRoaming,
  }) {
    return Telephony(
      phoneType: phoneType ?? this.phoneType,
      networkOperatorName: networkOperatorName ?? this.networkOperatorName,
      networkOperatorCode: networkOperatorCode ?? this.networkOperatorCode,
      networkOperatorCountry:
          networkOperatorCountry ?? this.networkOperatorCountry,
      simProviderName: simProviderName ?? this.simProviderName,
      simProviderCountry: simProviderCountry ?? this.simProviderCountry,
      simState: simState ?? this.simState,
      networkType: networkType ?? this.networkType,
      isDeviceRoaming: isDeviceRoaming ?? this.isDeviceRoaming,
    );
  }

  /// [toMap] returns the map of telephony.
  Map<String, dynamic> toMap() {
    return {
      'phoneType': phoneType,
      'networkOperatorName': networkOperatorName,
      'networkOperatorCode': networkOperatorCode,
      'networkOperatorCountry': networkOperatorCountry,
      'simProviderName': simProviderName,
      'simProviderCountry': simProviderCountry,
      'simState': simState,
      'networkType': networkType,
      'isDeviceRoaming': isDeviceRoaming,
    };
  }

  /// [fromMap] returns the telephony from map.
  factory Telephony.fromMap(Map<String, dynamic> map) {
    return Telephony(
      phoneType: map['phoneType'],
      networkOperatorName: map['networkOperatorName'],
      networkOperatorCode: map['networkOperatorCode'],
      networkOperatorCountry: map['networkOperatorCountry'],
      simProviderName: map['simProviderName'],
      simProviderCountry: map['simProviderCountry'],
      simState: map['simState'],
      networkType: map['networkType'],
      isDeviceRoaming: map['isDeviceRoaming'],
    );
  }

  /// [toJson] returns the json of telephony.
  String toJson() => json.encode(toMap());

  /// [fromJson] returns the telephony from json.
  factory Telephony.fromJson(String source) =>
      Telephony.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Telephony(phoneType: $phoneType, networkOperatorName: $networkOperatorName, networkOperatorCode: $networkOperatorCode, networkOperatorCountry: $networkOperatorCountry, simProviderName: $simProviderName, simProviderCountry: $simProviderCountry, simState: $simState, networkType: $networkType, isDeviceRoaming: $isDeviceRoaming)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Telephony &&
        other.phoneType == phoneType &&
        other.networkOperatorName == networkOperatorName &&
        other.networkOperatorCode == networkOperatorCode &&
        other.networkOperatorCountry == networkOperatorCountry &&
        other.simProviderName == simProviderName &&
        other.simProviderCountry == simProviderCountry &&
        other.simState == simState &&
        other.networkType == networkType &&
        other.isDeviceRoaming == isDeviceRoaming;
  }

  @override
  int get hashCode {
    return phoneType.hashCode ^
        networkOperatorName.hashCode ^
        networkOperatorCode.hashCode ^
        networkOperatorCountry.hashCode ^
        simProviderName.hashCode ^
        simProviderCountry.hashCode ^
        simState.hashCode ^
        networkType.hashCode ^
        isDeviceRoaming.hashCode;
  }
}

/// [Wifi] information about the device's wifi connection.
class Wifi {
  /// [state] The wifi state.
  String? state;

  /// [ssid] The wifi SSID.
  String? ssid;

  /// [bssid] The wifi BSSID.
  String? bssid;

  /// [hiddenSsid] The wifi network ssid is hidden oe not.i.e - hidden-true,not hidden-false else null.
  bool? hiddenSsid;

  /// [ipv4Address] The wifi network's ipv4 address.
  String? ipv4Address;

  /// [ipv6Address] The wifi network's ipv6 address.
  String? ipv6Address;

  /// [signalStrength] The wifi network's signal strength in dbM.
  String? signalStrength;

  /// [linkSpeed] The wifi network's link speed in Mbps.
  String? linkSpeed;

  /// [frequency] The wifi network's frequency in MHz.
  String? frequency;

  /// [networkId] The wifi network's network id.
  String? networkId;

  /// [gateway] The wifi network's gateway.
  String? gateway;

  /// [netmask] The wifi network's netmask.
  String? netmask;

  /// [dns1] The wifi network's dns1.
  String? dns1;

  /// [dhcpLeaseDuration] The wifi network's DHCP lease duration in seconds.
  String? dhcpLeaseDuration;

  /// [w5ghzBand] The wifi network is 5ghz or not. i.e - 5ghz-supported,not 5ghz-unsupported else null.
  String? w5ghzBand;

  /// Wi-Fi Aware capabilities enable devices running Android 8.0 (API level 26) and higher to discover and connect directly to each other without
  /// any other type of connectivity between them. Wi-Fi Aware is also known as Neighbor Awareness Networking (NAN).
  ///
  /// [isWifiAware] The wifi network is supported discover and connect directly to each other without any other type of connectivity between them.
  /// return true if supported, else false and null in case of unknown.
  bool? isWifiAware;

  /// Wi-Fi Direct (also known as peer-to-peer or P2P) allows your application to quickly
  /// find and interact with nearby devices, at a range beyond the capabilities of Bluetooth.
  ///
  ///[isWifiDirectAvailable] return true if supported, else false and null in case of unknown.
  bool? isWifiDirectAvailable;

  /// constructor of [Wifi] class.
  Wifi({
    this.state,
    this.ssid,
    this.bssid,
    this.hiddenSsid,
    this.ipv4Address,
    this.ipv6Address,
    this.signalStrength,
    this.linkSpeed,
    this.frequency,
    this.networkId,
    this.gateway,
    this.netmask,
    this.dns1,
    this.dhcpLeaseDuration,
    this.w5ghzBand,
    this.isWifiAware,
    this.isWifiDirectAvailable,
  });

  /// [copyWith] returns a new instance of [Wifi] class.
  Wifi copyWith({
    String? state,
    String? ssid,
    String? bssid,
    bool? hiddenSsid,
    String? ipv4Address,
    String? ipv6Address,
    String? signalStrength,
    String? linkSpeed,
    String? frequency,
    String? networkId,
    String? gateway,
    String? netmask,
    String? dns1,
    String? dhcpLeaseDuration,
    String? w5ghzBand,
    bool? isWifiAware,
    bool? isWifiDirectAvailable,
  }) {
    return Wifi(
      state: state ?? this.state,
      ssid: ssid ?? this.ssid,
      bssid: bssid ?? this.bssid,
      hiddenSsid: hiddenSsid ?? this.hiddenSsid,
      ipv4Address: ipv4Address ?? this.ipv4Address,
      ipv6Address: ipv6Address ?? this.ipv6Address,
      signalStrength: signalStrength ?? this.signalStrength,
      linkSpeed: linkSpeed ?? this.linkSpeed,
      frequency: frequency ?? this.frequency,
      networkId: networkId ?? this.networkId,
      gateway: gateway ?? this.gateway,
      netmask: netmask ?? this.netmask,
      dns1: dns1 ?? this.dns1,
      dhcpLeaseDuration: dhcpLeaseDuration ?? this.dhcpLeaseDuration,
      w5ghzBand: w5ghzBand ?? this.w5ghzBand,
      isWifiAware: isWifiAware ?? this.isWifiAware,
      isWifiDirectAvailable:
          isWifiDirectAvailable ?? this.isWifiDirectAvailable,
    );
  }

  /// [toMap] Returns a map representation of the object.
  Map<String, dynamic> toMap() {
    return {
      'state': state,
      'ssid': ssid,
      'bssid': bssid,
      'hiddenSsid': hiddenSsid,
      'ipv4Address': ipv4Address,
      'ipv6Address': ipv6Address,
      'signalStrength': signalStrength,
      'linkSpeed': linkSpeed,
      'frequency': frequency,
      'networkId': networkId,
      'gateway': gateway,
      'netmask': netmask,
      'dns1': dns1,
      'dhcpLeaseDuration': dhcpLeaseDuration,
      'w5ghzBand': w5ghzBand,
      'isWifiAware': isWifiAware,
      'isWifiDirectAvailable': isWifiDirectAvailable,
    };
  }

  /// [fromMap] Returns a [Wifi] object from a map.
  factory Wifi.fromMap(Map<String, dynamic> map) {
    return Wifi(
      state: map['state'],
      ssid: map['ssid'],
      bssid: map['bssid'],
      hiddenSsid: map['hiddenSsid'],
      ipv4Address: map['ipv4Address'],
      ipv6Address: map['ipv6Address'],
      signalStrength: map['signalStrength'],
      linkSpeed: map['linkSpeed'],
      frequency: map['frequency'],
      networkId: map['networkId'],
      gateway: map['gateway'],
      netmask: map['netmask'],
      dns1: map['dns1'],
      dhcpLeaseDuration: map['dhcpLeaseDuration'],
      w5ghzBand: map['w5ghzBand'],
      isWifiAware: map['isWifiAware'],
      isWifiDirectAvailable: map['isWifiDirectAvailable'],
    );
  }

  /// [toJson] Returns a json representation of the object.
  String toJson() => json.encode(toMap());

  /// [fromJson] Returns a [Wifi] object from a json representation.
  factory Wifi.fromJson(String source) => Wifi.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Wifi(state: $state, ssid: $ssid, bssid: $bssid, hiddenSsid: $hiddenSsid, ipv4Address: $ipv4Address, ipv6Address: $ipv6Address, signalStrength: $signalStrength, linkSpeed: $linkSpeed, frequency: $frequency, networkId: $networkId, gateway: $gateway, netmask: $netmask, dns1: $dns1, dhcpLeaseDuration: $dhcpLeaseDuration, w5ghzBand: $w5ghzBand, isWifiAware: $isWifiAware, isWifiDirectAvailable: $isWifiDirectAvailable)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Wifi &&
        other.state == state &&
        other.ssid == ssid &&
        other.bssid == bssid &&
        other.hiddenSsid == hiddenSsid &&
        other.ipv4Address == ipv4Address &&
        other.ipv6Address == ipv6Address &&
        other.signalStrength == signalStrength &&
        other.linkSpeed == linkSpeed &&
        other.frequency == frequency &&
        other.networkId == networkId &&
        other.gateway == gateway &&
        other.netmask == netmask &&
        other.dns1 == dns1 &&
        other.dhcpLeaseDuration == dhcpLeaseDuration &&
        other.w5ghzBand == w5ghzBand &&
        other.isWifiAware == isWifiAware &&
        other.isWifiDirectAvailable == isWifiDirectAvailable;
  }

  @override
  int get hashCode {
    return state.hashCode ^
        ssid.hashCode ^
        bssid.hashCode ^
        hiddenSsid.hashCode ^
        ipv4Address.hashCode ^
        ipv6Address.hashCode ^
        signalStrength.hashCode ^
        linkSpeed.hashCode ^
        frequency.hashCode ^
        networkId.hashCode ^
        gateway.hashCode ^
        netmask.hashCode ^
        dns1.hashCode ^
        dhcpLeaseDuration.hashCode ^
        w5ghzBand.hashCode ^
        isWifiAware.hashCode ^
        isWifiDirectAvailable.hashCode;
  }
}
