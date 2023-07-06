// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../config/responsive/screen_util.dart';
import '../config/theme/app_color.dart';

extension SizeExtension on num {
  double get w => ScreenUtil().setWidth(this).toDouble();
  double get h => ScreenUtil().setHeight(this).toDouble();
  double get sp => ScreenUtil().setSp(this).toDouble();
  double get fw => ScreenUtil().partFW(this).toDouble();
  double get fh => ScreenUtil().partFH(this).toDouble();
}

extension PaddingExtension on Widget {
  Widget pa(double a) {
    return Padding(
      padding: EdgeInsets.all(a),
      child: this,
    );
  }

  Widget p([double lp = 0, double rp = 0, double tp = 0, double bp = 0]) {
    return Padding(
      padding: EdgeInsets.only(left: lp, right: rp, top: tp, bottom: bp),
      child: this,
    );
  }

  Widget pt([double top = 0]) {
    return Padding(
      padding: EdgeInsets.only(top: top),
      child: this,
    );
  }

  Widget pb([double bottom = 0]) {
    return Padding(
      padding: EdgeInsets.only(bottom: bottom),
      child: this,
    );
  }

  Widget pl([double left = 0]) {
    return Padding(
      padding: EdgeInsets.only(left: left),
      child: this,
    );
  }

  Widget pr([double right = 0]) {
    return Padding(
      padding: EdgeInsets.only(right: right),
      child: this,
    );
  }

  Widget pv([double vertical = 0]) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: vertical),
      child: this,
    );
  }

  Widget ph([double horizontal = 0]) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontal),
      child: this,
    );
  }
}

extension ExtendedText on Widget {
  addContainer() {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.all(16),
      color: Colors.yellow,
      child: this,
    );
  }
}

extension PasswordValidation on String {
  bool isPasswordValid() {
    if (length < 8) return false;
    if (!contains(RegExp(r"[a-z]"))) return false;
    if (!contains(RegExp(r"[A-Z]"))) return false;
    if (!contains(RegExp(r"[0-9]"))) return false;
    if (!contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) return false;
    return true;
  }
}

// extension TextExtension on String {
//   String img() {
//     if (contains(ApiEndPoints.IMG_URL)) {
//       return this;
//     } else {
//       return ApiEndPoints.IMG_URL + this;
//     }
//   }
// }

// extension MobileValidation on String {
//   bool isMobileNum() {
//     if (length != 10) return false;

//     if (!startsWith('98') && !startsWith('97')) return false;
//     return true;
//   }

//   bool isEmailAddress() {
//     RegExp emailReg = RegExp(
//         r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
//     bool isValid = emailReg.hasMatch(this);
//     return isValid;
//   }
// }

extension TypeConverter on String {
  int? toInt() => int.tryParse(this);
  double? toDouble() => double.tryParse(this);
}

// extension NetworkImageChecker on String? {
//   bool isNetworkImage() {
//     if (this == null) {
//       return false;
//     } else {
//       return this!.startsWith("http://") || this!.startsWith('https://');
//     }
//   }

//   String apiImg() {
//     if (this == null) return "";
//     if (this!.contains("http://") || this!.contains('https://')) {
//       return this!;
//     }
//     return ApiEndPoints.IMG_URL + this!;
//   }
// }

extension ContextExtention on BuildContext {
  TextTheme get textStyles => Theme.of(this).textTheme;
  AppColor get color => Theme.of(this).extension<AppColor>() ?? AppColor.light;
}

extension DateFormatter on DateTime? {
  YYYYMDD() {
    DateTime date2 = this ?? DateTime.now();
    final format = DateFormat.yMMMEd();
    final formattedDate = format.format(date2);
    return formattedDate;
  }

  YYYYMMDD() {
    DateTime date2 = this ?? DateTime.now();
    final format = DateFormat("yyyy/MM/dd");
    final formattedDate = format.format(date2);
    return formattedDate;
  }

  EEEDDMMYYYYT() {
    DateTime date2 = this ?? DateTime.now();
    final format = DateFormat("EEE dd MMM, yyyy '|' hh:mm a");
    final formattedDate =
        format.format(date2).replaceFirst('AM', 'AM').replaceFirst('PM', 'PM');
    return formattedDate;
  }

  EEEDDMMYYYY() {
    DateTime date2 = this ?? DateTime.now();
    final format = DateFormat("EEE dd MMM, yyyy");
    final formattedDate =
        format.format(date2).replaceFirst('AM', 'AM').replaceFirst('PM', 'PM');
    return formattedDate;
  }

  onlyTime() {
    DateTime date2 = this ?? DateTime.now();
    final format = DateFormat("hh:mm a");
    final formattedDate =
        format.format(date2).replaceFirst('AM', 'AM').replaceFirst('PM', 'PM');
    return formattedDate;
  }
}
