/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';

class Assets {
  Assets._();

  static const AssetGenImage tetherLogo =
      AssetGenImage('assets/Tether-logo.png');
  static const SvgGenImage address = SvgGenImage('assets/address.svg');
  static const SvgGenImage appointment = SvgGenImage('assets/appointment.svg');
  static const SvgGenImage checkup = SvgGenImage('assets/checkup.svg');
  static const SvgGenImage chipAndTag = SvgGenImage('assets/chipAndTag.svg');
  static const SvgGenImage clock = SvgGenImage('assets/clock.svg');
  static const SvgGenImage correct = SvgGenImage('assets/correct.svg');
  static const SvgGenImage dateTime = SvgGenImage('assets/dateTime.svg');
  static const AssetGenImage doctor1 = AssetGenImage('assets/doctor1.jpg');
  static const AssetGenImage doctor2 = AssetGenImage('assets/doctor2.jpg');
  static const AssetGenImage doctor3 = AssetGenImage('assets/doctor3.jpg');
  static const AssetGenImage doctor4 = AssetGenImage('assets/doctor4.jpg');
  static const AssetGenImage dog1 = AssetGenImage('assets/dog1.png');
  static const AssetGenImage dog2 = AssetGenImage('assets/dog2.png');
  static const AssetGenImage dog3 = AssetGenImage('assets/dog3.png');
  static const SvgGenImage dogIcon = SvgGenImage('assets/dogIcon.svg');
  static const SvgGenImage emailGreen = SvgGenImage('assets/email_green.svg');
  static const SvgGenImage facebook = SvgGenImage('assets/facebook.svg');
  static const SvgGenImage home = SvgGenImage('assets/home.svg');
  static const SvgGenImage labResults = SvgGenImage('assets/labResults.svg');
  static const SvgGenImage lock = SvgGenImage('assets/lock.svg');
  static const SvgGenImage medicalRecords =
      SvgGenImage('assets/medicalRecords.svg');
  static const SvgGenImage message = SvgGenImage('assets/message.svg');
  static const SvgGenImage name = SvgGenImage('assets/name.svg');
  static const SvgGenImage nameIcon = SvgGenImage('assets/nameIcon.svg');
  static const SvgGenImage nickNameIcon =
      SvgGenImage('assets/nickNameIcon.svg');
  static const SvgGenImage notofication =
      SvgGenImage('assets/notofication.svg');
  static const AssetGenImage persianCat1 =
      AssetGenImage('assets/persian_cat1.jpg');
  static const AssetGenImage persianCat2 =
      AssetGenImage('assets/persian_cat2.jpg');
  static const SvgGenImage petOwner = SvgGenImage('assets/petOwner.svg');
  static const SvgGenImage phoneNumber = SvgGenImage('assets/phoneNumber.svg');
  static const SvgGenImage prefix = SvgGenImage('assets/prefix.svg');
  static const SvgGenImage prescription =
      SvgGenImage('assets/prescription.svg');
  static const AssetGenImage primaryLogo =
      AssetGenImage('assets/primary_logo.png');
  static const AssetGenImage profilePhoto =
      AssetGenImage('assets/profile_photo.jpeg');
  static const SvgGenImage provider = SvgGenImage('assets/provider.svg');
  static const SvgGenImage speciesIcon = SvgGenImage('assets/speciesIcon.svg');
  static const SvgGenImage twitter = SvgGenImage('assets/twitter.svg');
  static const SvgGenImage weightIcon = SvgGenImage('assets/weightIcon.svg');

  /// List of all assets
  List<dynamic> get values => [
        tetherLogo,
        address,
        appointment,
        checkup,
        chipAndTag,
        clock,
        correct,
        dateTime,
        doctor1,
        doctor2,
        doctor3,
        doctor4,
        dog1,
        dog2,
        dog3,
        dogIcon,
        emailGreen,
        facebook,
        home,
        labResults,
        lock,
        medicalRecords,
        message,
        name,
        nameIcon,
        nickNameIcon,
        notofication,
        persianCat1,
        persianCat2,
        petOwner,
        phoneNumber,
        prefix,
        prescription,
        primaryLogo,
        profilePhoto,
        provider,
        speciesIcon,
        twitter,
        weightIcon
      ];
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class SvgGenImage {
  const SvgGenImage(this._assetName);

  final String _assetName;

  SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    SvgTheme theme = const SvgTheme(),
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    return SvgPicture.asset(
      _assetName,
      key: key,
      matchTextDirection: matchTextDirection,
      bundle: bundle,
      package: package,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      theme: theme,
      colorFilter: colorFilter,
      color: color,
      colorBlendMode: colorBlendMode,
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
