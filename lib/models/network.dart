import 'dart:convert';

class Network {
  Telephony? telephony;
  Wifi? wifi;
  Network({
    this.telephony,
    this.wifi,
  });

  Network copyWith({
    Telephony? telephony,
    Wifi? wifi,
  }) {
    return Network(
      telephony: telephony ?? this.telephony,
      wifi: wifi ?? this.wifi,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'telephony': telephony?.toMap(),
      'wifi': wifi?.toMap(),
    };
  }

  factory Network.fromMap(Map<String, dynamic> map) {
    return Network(
      telephony:
          map['telephony'] != null ? Telephony.fromMap(map['telephony']) : null,
      wifi: map['wifi'] != null ? Wifi.fromMap(map['wifi']) : null,
    );
  }

  String toJson() => json.encode(toMap());

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

class Telephony {
  String? phoneType;
  String? networkOperatorName;
  String? networkOperatorCode;
  String? networkOperatorCountry;
  String? simProviderName;
  String? simProviderCountry;
  String? simState;
  String? networkType;
  bool? isDeviceRoaming;
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

  String toJson() => json.encode(toMap());

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

class Wifi {
  String? state;
  String? ssid;
  String? bssid;
  bool? hiddenSsid;
  String? ipv4Address;
  String? ipv6Address;
  String? signalStrength;
  String? linkSpeed;
  String? frequency;
  String? networkId;
  String? gateway;
  String? netmask;
  String? dns1;
  String? dhcpLeaseDuration;
  String? w5ghzBand;
  bool? isWifiAware;
  bool? isWifiDirectAvailable;
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

  String toJson() => json.encode(toMap());

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
