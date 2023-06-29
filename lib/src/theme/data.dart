import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:newtetherpets/src/theme/colors.dart';
import 'package:newtetherpets/src/theme/padding.dart';
import 'package:newtetherpets/src/theme/radius.dart';
import 'package:newtetherpets/src/theme/typography.dart';

part 'data.freezed.dart';

@freezed
class AppThemeData with _$AppThemeData {
  const factory AppThemeData({
    @Default(AppColorData()) AppColorData color,
    @Default(AppRadiusData()) AppRadiusData radius,
    @Default(AppTextStyleData()) AppTextStyleData textStyle,
    @Default(AppEdgeInsetsData()) AppEdgeInsetsData edgeInsets,
  }) = _AppThemeData;
}
