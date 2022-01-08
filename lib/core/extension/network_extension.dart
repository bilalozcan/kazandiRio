import 'package:kazandirio/core/constant/enum/network_enum.dart';

extension NetworkExtension on Network {
  String get value {
    switch(this) {
      case Network.LOGIN:
        return '/auth/login';
        case Network.CAMPAIGNS:
        return '/campaigns';
      default:
        return '';
    }
  }


}