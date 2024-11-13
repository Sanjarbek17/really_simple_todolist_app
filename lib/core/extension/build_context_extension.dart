import 'package:flutter/material.dart';

extension CustomThemeExtension on BuildContext {
  ColorScheme get theme => Theme.of(this).colorScheme;
}

extension UIThemeExtension on BuildContext {
  // * (default) TextTheme
  /// The largest text on the screen.
  TextStyle? get dm => Theme.of(this).textTheme.displayMedium;
  TextStyle? get dl => Theme.of(this).textTheme.displayLarge;
  TextStyle? get ds => Theme.of(this).textTheme.displaySmall;

  TextStyle? get hl => Theme.of(this).textTheme.headlineLarge;
  TextStyle? get hm => Theme.of(this).textTheme.headlineMedium;
  TextStyle? get hs => Theme.of(this).textTheme.headlineSmall;

  TextStyle? get tl => Theme.of(this).textTheme.titleLarge;
  TextStyle? get tm => Theme.of(this).textTheme.titleMedium;
  TextStyle? get ts => Theme.of(this).textTheme.titleSmall;

  TextStyle? get ll => Theme.of(this).textTheme.labelLarge;
  TextStyle? get lm => Theme.of(this).textTheme.labelMedium;
  TextStyle? get ls => Theme.of(this).textTheme.labelSmall;

  TextStyle? get bl => Theme.of(this).textTheme.bodyLarge;
  TextStyle? get bm => Theme.of(this).textTheme.bodyMedium;
  TextStyle? get bs => Theme.of(this).textTheme.bodySmall;

  // * PrimaryTextTheme
  TextStyle? get pdl => Theme.of(this).primaryTextTheme.displayLarge;
  TextStyle? get pds => Theme.of(this).primaryTextTheme.displaySmall;
  TextStyle? get pdm => Theme.of(this).primaryTextTheme.displayMedium;

  TextStyle? get phl => Theme.of(this).primaryTextTheme.headlineLarge;
  TextStyle? get phm => Theme.of(this).primaryTextTheme.headlineMedium;
  TextStyle? get phs => Theme.of(this).primaryTextTheme.headlineSmall;

  TextStyle? get ptl => Theme.of(this).primaryTextTheme.titleLarge;
  TextStyle? get ptm => Theme.of(this).primaryTextTheme.titleMedium;
  TextStyle? get pts => Theme.of(this).primaryTextTheme.titleSmall;

  TextStyle? get pll => Theme.of(this).primaryTextTheme.labelLarge;
  TextStyle? get plm => Theme.of(this).primaryTextTheme.labelMedium;
  TextStyle? get pls => Theme.of(this).primaryTextTheme.labelSmall;

  TextStyle? get pbl => Theme.of(this).primaryTextTheme.bodyLarge;
  TextStyle? get pbm => Theme.of(this).primaryTextTheme.bodyMedium;
  TextStyle? get pbs => Theme.of(this).primaryTextTheme.bodySmall;
}
