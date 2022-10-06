/*
 * Created by 李卓原 on 2018/9/29.
 * email: zhuoyuan93@gmail.com
 */

import 'dart:math' show min, max;
import 'dart:ui' show FlutterWindow;
import 'dart:async' show Completer;

import 'package:flutter/widgets.dart';

class ScreenUtil {
  static const Size defaultSize = Size(1792, 1067);
  static ScreenUtil _instance = ScreenUtil._();

  late Size _uiSize;
  late Orientation _orientation;

  late double _screenWidth;
  late double _screenHeight;
  late bool _minTextAdapt;
  BuildContext? _context;
  late bool _splitScreenMode;

  ScreenUtil._();

  factory ScreenUtil() {
    return _instance;
  }

  static Future<void> ensureScreenSize([
    FlutterWindow? window,
    Duration duration = const Duration(milliseconds: 10),
  ]) async {
    final binding = WidgetsFlutterBinding.ensureInitialized();
    window ??= binding.window;

    if (window.viewConfiguration.geometry.isEmpty) {
      return Future.delayed(duration, () async {
        binding.deferFirstFrame();
        await ensureScreenSize(window, duration);
        return binding.allowFirstFrame();
      });
    }
  }

  Set<Element>? _elementsToRebuild;

  static void registerToBuild(
    BuildContext context, [
    bool withDescendants = false,
  ]) {
    (_instance._elementsToRebuild ??= {}).add(context as Element);

    if (withDescendants) {
      context.visitChildren((element) {
        registerToBuild(element, true);
      });
    }
  }

  static Future<void> init(
    BuildContext context, {
    Size designSize = defaultSize,
    bool splitScreenMode = false,
    bool minTextAdapt = true,
  }) async {
    final navigatorContext = Navigator.maybeOf(context)?.context as Element?;
    final mediaQueryContext =
        navigatorContext?.getElementForInheritedWidgetOfExactType<MediaQuery>();

    final initCompleter = Completer<void>();

    WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((_) {
      mediaQueryContext?.visitChildElements((el) => _instance._context = el);
      if (_instance._context != null) initCompleter.complete();
    });

    final deviceData = MediaQuery.maybeOf(context).nonEmptySizeOrNull();

    final deviceSize = deviceData?.size ?? designSize;
    final orientation = deviceData?.orientation ??
        (deviceSize.width > deviceSize.height
            ? Orientation.landscape
            : Orientation.portrait);

    _instance
      .._context = context
      .._uiSize = designSize
      .._splitScreenMode = splitScreenMode
      .._minTextAdapt = minTextAdapt
      .._orientation = orientation
      .._screenWidth = deviceSize.width
      .._screenHeight = deviceSize.height;

    _instance._elementsToRebuild?.forEach((el) => el.markNeedsBuild());

    return initCompleter.future;
  }

  Orientation get orientation => _orientation;

  double get textScaleFactor =>
      _context != null ? MediaQuery.of(_context!).textScaleFactor : 1;

  double? get pixelRatio =>
      _context != null ? MediaQuery.of(_context!).devicePixelRatio : 1;

  double get screenWidth =>
      _context != null ? MediaQuery.of(_context!).size.width : _screenWidth;

  double get screenHeight =>
      _context != null ? MediaQuery.of(_context!).size.height : _screenHeight;

  double get statusBarHeight =>
      _context == null ? 0 : MediaQuery.of(_context!).padding.top;

  double get bottomBarHeight =>
      _context == null ? 0 : MediaQuery.of(_context!).padding.bottom;

  double get scaleWidth => screenWidth / _uiSize.width;

  double get scaleHeight =>
      (_splitScreenMode ? max(screenHeight, 700) : screenHeight) /
      _uiSize.height;

  double get scaleText =>
      _minTextAdapt ? min(scaleWidth, scaleHeight) : scaleWidth;

  double setWidth(num width) => width * scaleWidth;

  double setHeight(num height) => height * scaleHeight;

  double radius(num r) => r * min(scaleWidth, scaleHeight);

  double setSp(num fontSize) => fontSize * scaleText;

  Widget setVerticalSpacing(num height) => SizedBox(height: setHeight(height));

  Widget setVerticalSpacingFromWidth(num height) =>
      SizedBox(height: setWidth(height));

  Widget setHorizontalSpacing(num width) => SizedBox(width: setWidth(width));

  Widget setHorizontalSpacingRadius(num width) =>
      SizedBox(width: radius(width));

  Widget setVerticalSpacingRadius(num height) =>
      SizedBox(height: radius(height));
}

extension on MediaQueryData? {
  MediaQueryData? nonEmptySizeOrNull() {
    if (this?.size.isEmpty ?? true)
      return null;
    else
      return this;
  }
}
