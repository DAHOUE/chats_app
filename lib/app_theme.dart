import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../app_utils.dart';

LightCodeColors get appTheme => ThemeHelper().themeColor();
ThemeData get theme => ThemeHelper().themeData();

extension on TextStyle {}

// A collection of pre-defined text styles for customizing text appearance,
// categorized by different font families and weights.
// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.
class CustomTextStyles {
    // Label text style
    static TextStyle get labelLargeGreen900 =>
    theme.textTheme.labelLarge!.copyWith(
    color: appTheme.green900.withOpacity(0.8),
    );
    static TextStyle get labelLargeOnPrimary =>
    theme.textTheme.labelLarge!.copyWith(
    color: theme.colorScheme.onPrimary,
    );
    static TextStyle get labelLargeOnPrimary_1 =>
    theme.textTheme.labelLarge!.copyWith(
    color: theme.colorScheme.onPrimary.withOpacity(0.8),
    );
    // Title text style
    static TextStyle get titleSmallBlack900 =>
    theme.textTheme.titleSmall!.copyWith(
    color: appTheme.black900,
    fontSize: 15,
    fontWeight: FontWeight.w600,
    );
    static TextStyle get titleSmallOnPrimary =>
    theme.textTheme.titleSmall!.copyWith(
    color: theme.colorScheme.onPrimary,
    );
    static TextStyle get titleSmallSecondaryContainer =>
    theme.textTheme.titleSmall!.copyWith(
    color: theme.colorScheme.secondaryContainer,
    );
}

// Helper class for managing themes and colors.

// ignore_for_file: must_be_immutable
class ThemeHelper {
    // The current app theme
    final _appTheme = PrefUtils().getThemeData();

    // A map of custom color themes supported by the app
    final Map<String, LightCodeColors> _supportedCustomColor = {
    'LightCode': LightCodeColors()
    };
    // A map of color schemes supported by the app
    final Map<String, ColorScheme> _supportedColorScheme = {
    'LightCode': ColorSchemes.lightCodeColorScheme
    };


  // Changes the app theme to [_newTheme].
  void changeTheme(String _newTheme) {
      PrefUtils().setThemeData(_newTheme);
      Get.forceAppUpdate();
  }

  // Returns the LightCode colors for the current theme.
  LightCodeColors _getThemeColors() {
      return _supportedCustomColor[_appTheme] ?? LightCodeColors();
  }

// Returns the current theme data.
ThemeData _getThemeData() {
    var colorScheme =
    _supportedColorScheme[_appTheme] ?? ColorSchemes.lightCodeColorScheme;
    return ThemeData(
    visualDensity: VisualDensity.standard,
    colorScheme: colorScheme,
    textTheme: TextThemes.textTheme(colorScheme),
    elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(22.h),
    ),
    elevation: 0,
    visualDensity: const VisualDensity(
    vertical: -4,
    horizontal: -4,
    ),
    padding: EdgeInsetsDirectional.zero,
    ),
    ),
    dividerTheme: DividerThemeData(
    thickness: 1,
    space: 1,
    color: colorScheme.secondaryContainer,
    ),
    );
}

  // Returns the LightCode colors for the current theme.
  LightCodeColors themeColor() => _getThemeColors();

  // Returns the current theme data.
  ThemeData themeData() => _getThemeData();
} 

// Class containing the supported text theme styles.
class TextThemes {
    static TextTheme textTheme(ColorScheme colorScheme) => TextTheme(
    headlineLarge: TextStyle(
    color: colorScheme.onPrimary,
    fontSize: 32.fSize,
    fontFamily: 'Gilroy',
    fontWeight: FontWeight.w600,
    ),
    labelLarge: TextStyle(
    color: appTheme.blueGray500,
    fontSize: 12.fSize,
        fontFamily: 'Gilroy',
    fontWeight: FontWeight.w500,
    ),
    titleLarge: TextStyle(
    color: colorScheme.onPrimaryContainer,
    fontSize: 20.fSize,
    fontFamily: 'Gilroy',
    fontWeight: FontWeight.w700,
    ),
    titleMedium: TextStyle(
    color: colorScheme.secondaryContainer,
    fontSize: 16.fSize,
    fontFamily: 'Gilroy',
    fontWeight: FontWeight.w500,
    ),
    titleSmall: TextStyle(
    color: appTheme.green900,
    fontSize: 14.fSize,
    fontFamily: 'Gilroy',
    fontWeight: FontWeight.w500,
    ),
    );
}

// Class containing the supported color schemes.
class ColorSchemes {
    static const lightCodeColorScheme = ColorScheme.light(
    primary: Color(0XFF31C764),
    secondaryContainer: Color(0XFF9DB6CA),
    onPrimary: Color(0XFF2B333E),
    onPrimaryContainer: Color(0XFFFFFFFF),
    );
}

// Class containing custom colors for a LightCode theme.
class LightCodeColors {
    // Black
    Color get black900 => Color(0XFF000000);
    // BlueGray
    Color get blueGray50 => Color(0XFFEDF2F6);
    Color get blueGray500 => Color(0XFF5D7A90);
    // DeepOrange
    Color get deepOrangeA700 => Color(0XFFEC3800);
    // Green
    Color get green900 => Color(0XFF00521B);
    Color get greenA400 => Color(0XFF3BEC78);
    Color get greenA700 => Color(0XFF1EDA5E);
    // LightBlue
    Color get lightBlue500 => Color(0XFF00ACF6);
    Color get lightBlueA700 => Color(0XFF006CEC);
    // Orange
    Color get orange800 => Color(0XFFF66700);
}

class AppDecoration {

static BoxDecoration get fillBlueGray => BoxDecoration(
  color:  appTheme.blueGray50
);

static BoxDecoration get fillOnPrimaryContainer => BoxDecoration(
    color: theme.colorScheme.onPrimaryContainer,
);

// Gradient decorations
static BoxDecoration get gradientGreenAToPrimary => BoxDecoration(
    gradient: LinearGradient(
    begin: Alignment(0.5, 0),
    end: Alignment(0.5, 1),
    colors: [appTheme.greenA700, theme.colorScheme.primary],
    )
);
static BoxDecoration get gradientLightBlueToLightBlueA => BoxDecoration(
    gradient: LinearGradient(
    begin: Alignment(0.5, 0),
    end: Alignment(0.5, 1),
    colors: [appTheme.lightBlue500, appTheme.lightBlueA700],
    )
);
static BoxDecoration get gradientOrangeToDeepOrangeA => BoxDecoration(
    gradient: LinearGradient(
    begin: Alignment(0.5, 0),
    end: Alignment(0.5, 1),
    colors: [appTheme.orange800, appTheme.deepOrangeA700],
    )
);
// Green decorations
static BoxDecoration get green => BoxDecoration(
    color: appTheme.greenA400,
    );

// Outline decorations
static BoxDecoration get outlineBlueGray => BoxDecoration(
    border: Border(
    bottom: BorderSide(
    color: appTheme.blueGray50,
    width: 1.h,
    ),
    )
);
// Stroke decorations
static BoxDecoration get stroke => BoxDecoration(
    color: theme.colorScheme.onPrimaryContainer,
    border: Border(
    bottom: BorderSide(
    color: appTheme.blueGray50,
    width: 1.h,
    ),
    )
);
static BoxDecoration get strokeWhite => BoxDecoration(
    color: theme.colorScheme.onPrimaryContainer,
    border: Border(
    top: BorderSide(
    color: appTheme.blueGray50,
    width: 1.h,
    ),
    )
);

}


class BorderRadiusStyle {
    // Custom borders
    static BorderRadius get customBorderLR18 => BorderRadius.only(
    topLeft: Radius.circular(6.h),
    topRight: Radius.circular(18.h),
    bottomRight: Radius.circular(18.h),
    );
    static BorderRadius get customBorderTL18 => BorderRadius.only(
    topLeft: Radius.circular(18.h),
    topRight: Radius.circular(18.h),
    bottomLeft: Radius.circular(8.h),
    bottomRight: Radius.circular(8.h),
    );
    static BorderRadius get customBorderTL181 => BorderRadius.only(
    topLeft: Radius.circular(18.h),
    topRight: Radius.circular(6.h),
    bottomLeft: Radius.circular(18.h),
    );
    static BorderRadius get customBorderTL29 => BorderRadius.only(
    topLeft: Radius.circular(20.h),
    topRight: Radius.circular(20.h),
    bottomLeft: Radius.circular(20.h),
    );
    static BorderRadius get customBorderTL201 => BorderRadius.only(
    topLeft: Radius.circular(20.h),
    topRight: Radius.circular(20.h),
    bottomRight: Radius.circular(20.h),
    );
    // Rounded borders
    static BorderRadius get roundedBorder24 => BorderRadius.circular(
    24.h,
    );
}