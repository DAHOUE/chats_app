import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';


final Map<String, String> ru = {
"lbl": "Чат",
"lbl10": "A готов",
"lbl11": "ПЖ",
"lbl12": "Пётр Жаринов",
"lbl13": "Я вышел",
"lbl14": "АЖ",
"lbl15": "Алина Жукова",
"lbl16": "B cети",
"lbl17": "Хорошо",
"lbl18": "Сегодня",
"lbl19": "Сообщение",
"lbl21": "Поиск",
"lbl20": "Какие горы",
"lbl3": "ВВ",
"lbl4": "Виктор Власов",
"lbl5": "Вы:",
"lbl6": "Уже сделал?",
"lbl7": "Вчера",
"lbl8": "СА",
"lbl9": "Саша Алексеев",
"lbl_09_23": "09:23",
"lbl_09_41": "09:41",
"lbl_12_01_22": "12.01.22",
"lbl_21_41": "21:41",
"lbl_22": "2 минуты назад",
"lbl_27_01_22": "27.01.22",
"msg": "Сделай мне кофе, пожалуйста",
"msg2": "Мне просто срочно нужно",
"msg_network_err": "Network Error",
"msg_something_went_wrong": "Something Went Wrong!"
};

final Map<String, String> en = {
    "lbl": "Chats", // Чаты -> Chats
    "lbl10": "A is ready", // A готов -> A is ready
    "lbl11": "PZ", // ПЖ -> PZ (nom, pas de traduction)
    "lbl12": "Pyotr Zharinov", // Пётр Жаринов -> Pyotr Zharinov
    "lbl13": "I'm out", // Я вышел -> I'm out
    "lbl14": "AZ", // АЖ -> AZ (nom, pas de traduction)
    "lbl15": "Alina Zhukova", // Алина Жукова -> Alina Zhukova
    "lbl16": "B is online", // B cети -> B is online
    "lbl17": "Okay", // Хорошо -> Okay
    "lbl18": "Today", // Сегодня -> Today
    "lbl19": "Message", // Сообщение -> Message
    "lbl21": "Search", // Поиск -> Search
    "lbl20": "Which mountains", // Какие горы -> Which mountains
    "lbl3": "VV", // ВВ -> VV (nom, pas de traduction)
    "lbl4": "Viktor Vlasov", // Виктор Власов -> Viktor Vlasov
    "lbl5": "You:", // Вы: -> You:
    "lbl6": "Already done?", // Уже сделал? -> Already done?
    "lbl7": "Yesterday", // Вчера -> Yesterday
    "lbl8": "SA", // СА -> SA (nom, pas de traduction)
    "lbl9": "Sasha Alekseev", // Саша Алексеев -> Sasha Alekseev
    "lbl_09_23": "09:23", // Pas de traduction nécessaire (heure)
    "lbl_09_41": "09:41", // Pas de traduction nécessaire (heure)
    "lbl_12_01_22": "12.01.22", // Pas de traduction nécessaire (date)
    "lbl_21_41": "21:41", // Pas de traduction nécessaire (heure)
    "lbl_22": "2 minutes ago", // 2 минуты назад -> 2 minutes ago
    "lbl_27_01_22": "27.01.22", // Pas de traduction nécessaire (date)
    "msg": "Make me coffee, please", // Сделай мне кофе, пожалуйста -> Make me coffee, please
    "msg2": "I just really need it", // Мне просто срочно нужно -> I just really need it
    "msg_network_err": "Network Error", // Pas de traduction nécessaire
    "msg_something_went_wrong": "Something Went Wrong!" // Pas de traduction nécessaire
};

// These are the Viewport values of your Figma Design.
// These are used in the code as a reference to create your UI Responsively.
const num FIGMA_DESIGN_WIDTH = 375;
const num FIGMA_DESIGN_HEIGHT = 812;
const num FIGMA_DESIGN_STATUS_BAR = 0;
const String dateTimeFormatPattern = 'dd/MM/yyyy';
extension ResponseiveExtension on num {
    double get _width => SizeUtils.width;
    double get h => ((this * _width) / FIGMA_DESIGN_WIDTH);
    double get fSize => ((this *_width) / FIGMA_DESIGN_WIDTH);
}
extension FormatExtension on double {
    // ignore: use_function_type_syntax_for_parameters
    double toDoubleValue({int fractionDigits = 2}) {
    return double.parse(this.toStringAsFixed(fractionDigits));
    }
    double isNonZero({num defaultValue = 0.0}) {
    return this > 0 ? this : defaultValue.toDouble();
    }
}
extension DateTimeExtension on DateTime {
    String format({
    String pattern = dateTimeFormatPattern,
    String? locale,
    }) {
    if (locale != null && locale.isNotEmpty) {
    initializeDateFormatting(locale);
    }
    return DateFormat(pattern, locale).format(this);
    }
}

enum DeviceType { mobile, tablet, desktop }

typedef ResponseiveBuild = Widget Function(
    BuildContext context, Orientation orientation, DeviceType deviceType);

// ignore_for_file: must_be_immutable
class ImageConstant {
    // Image folder path
    static String imagePath = 'assets/images';

    // Common images
    static String imgSearch = '$imagePath/img_search.svg';
    static String imgArrowLeft = '$imagePath/arrow_left_s.svg';
    static String imgRead = '$imagePath/img_read.svg';
    // static String imgMobile = '$imagePath/img_mobile.svg';
    // static String imgMobileBlueGray50 = '$imagePath/img_mobile_blue_gray_50.svg';
    static String imgUnread = '$imagePath/img_unread.svg';
    static String imgAttach = '$imagePath/img_attach.svg';
    static String imgMenu = '$imagePath/img_audio.svg';
    static String imgImage3 = '$imagePath/img_image_3.png';
    static String imgImage3160x274 = '$imagePath/img_image_3_160x274.png';
    static String imageNotFound = 'assets/images/image_not_found.png';
}

class AppLocalization extends Translations {
    @override
    Map<String, Map<String, String>> get keys => {'en': en, 'ru': ru};
}

// ignore_for_file: must_be_immutable
class PrefUtils {
    PrefUtils() {
        SharedPreferences.getInstance().then((value) {
            _sharedPreferences = value;
        });
    }

    static SharedPreferences? _sharedPreferences;

    Future<void> init() async {
        _sharedPreferences ??= await SharedPreferences.getInstance();
        print('SharedPreference Initialized');
    }

    // Will clear all the data stored in preference
    void clearPreferencesData() async {
        _sharedPreferences!.clear();
    }

    Future<void> setThemeData(String value) {
        return _sharedPreferences!.setString('themeData', value);
    }

    String getThemeData() {
        try {
            return _sharedPreferences!.getString('themeData') ?? 'primary';
        } catch (e) {
            return 'primary';
        }
    }
}

class Sizer extends StatelessWidget {
    const Sizer({
        Key? key, required this.builder
    }) : super(key: key);

  
    final ResponseiveBuild builder;

    @override
    Widget build(BuildContext context) {
        return LayoutBuilder(builder: (context, constraints) {
            return OrientationBuilder(builder: (context, orientation) {
                SizeUtils.setScreensize(constraints, orientation);
                return builder(context, orientation, SizeUtils.deviceType);
            });
        });
    }
}

// ignore_for_file: must_be_immutable
class SizeUtils {
    /// Device's BoxConstraints
    static late BoxConstraints boxConstraints;

    /// Device's Orientation
    static late Orientation orientation;

    /// Type of Device
    ///
    /// This can either be mobile or tablet
    static late DeviceType deviceType;

    /// Device's Height
    static late double height;

    /// Device's Width
    static late double width;

    static void setScreensize(
        BoxConstraints constraints,
        Orientation currentOrientation,
    ) {
        boxConstraints = constraints;
        orientation = currentOrientation;
        if (orientation == Orientation.portrait) {
            width = boxConstraints.maxWidth.isNonZero(defaultValue: FIGMA_DESIGN_WIDTH);
            height = boxConstraints.maxHeight.isNonZero();
        } else {
            width = boxConstraints.maxHeight.isNonZero(defaultValue: FIGMA_DESIGN_WIDTH);
            height = boxConstraints.maxWidth.isNonZero();
        }
        deviceType = DeviceType.mobile;
    }
}


// Pour formater la date
class CustomDateSeparator extends StatelessWidget {
  final int dateInt;

  const CustomDateSeparator({required this.dateInt, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Vérifier si la date est aujourd'hui
    DateTime date = DateTime.fromMillisecondsSinceEpoch(dateInt);
    final now = DateTime.now();
    final isToday = date.year == now.year &&
        date.month == now.month &&
        date.day == now.day;

    // Formater la date
    final dateText = isToday ? 'Today' : DateFormat('dd.MM.yy').format(date);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Expanded(
            child: Divider(
              color: Colors.grey, // Couleur des tirets
              thickness: 2, // Épaisseur des tirets
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              dateText,
              style: const TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: Divider(
              color: Colors.grey, // Couleur des tirets
              thickness: 2, // Épaisseur des tirets
            ),
          ),
        ],
      ),
    );
  }
}