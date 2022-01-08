import 'package:kazandirio/core/constant/enum/network_enum.dart';

extension NetworkExtension on Network {
  String get value {
    switch (this) {
      case Network.LOGIN:
        return '/auth/login';
      case Network.VALIDATE:
        return '/auth/login/validate';
      case Network.PROFILE:
        return '/auth/profile';
      case Network.CAMPAIGNS:
        return '/campaigns';
      default:
        return '';
    }
  }
}
