import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension emptySpace on num {
  SizedBox get sBH => SizedBox(height: toDouble().h);
  SizedBox get sBW => SizedBox(width: toDouble().w);
}