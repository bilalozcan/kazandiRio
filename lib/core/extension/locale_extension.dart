import 'package:kazandirio/core/constant/enum/locale_enum.dart';

extension LocaleExtension on Locale {
  String get value {
    switch (this) {
      case Locale.USER_GID:
        return 'userGid';
      case Locale.TOKEN:
        return 'token';
      case Locale.TOKEN_REFRESH:
        return 'tokenRefresh';
      case Locale.LOGIN:
        return 'login';
      default:
        return '';
    }
  }
}