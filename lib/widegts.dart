import 'dart:io';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../app_theme.dart';
import '../app_utils.dart';

extension IconButtonsStyleHelper on CustomIconButton {
    static BoxDecoration get none => BoxDecoration();
}

extension ImageTypeExtension on String {
    ImageType get imageType {
        if (this.startsWith('http') || this.startsWith('https')) {
            return ImageType.network;
        } else if (this.endsWith('.svg')) {
            return ImageType.svg;
        } else if (this.startsWith('file://')) {
            return ImageType.file;
        } else {
            return ImageType.png;
        }
    }
}

enum ImageType { svg, png, network, file, unknown }

enum Style { bgOutLineBlueGray58, bgOutLineBlueGray50_1, bgOutlineBluegray50 }

class BaseButton extends StatelessWidget {
    BaseButton({
        Key? key,
        required this.text,
        this.onPressed,
        this.buttonStyle,
        this.buttonTextStyle,
        this.isDisabled,
        this.height,
        this.width,
        this.margin,
        this.alignment,
    }) : super(key: key);

    final String text;
    final VoidCallback? onPressed;
    final ButtonStyle? buttonStyle;
    final TextStyle? buttonTextStyle;
    final bool? isDisabled;
    final double? height;
    final double? width;
    final EdgeInsetsGeometry? margin;
    final AlignmentGeometry? alignment;

    @override
    Widget build(BuildContext context) {
        return const SizedBox.shrink();
    }
}

// A class that offers pre-defined button styles for customizing button appearance.
class CustomButtonStyles {
    // Gradient button style
    static BoxDecoration get gradientGreenAToPrimaryDecoration => BoxDecoration(
        borderRadius: BorderRadius.circular(22.h),
        gradient: LinearGradient(
            begin: Alignment(0.5, 0),
            end: Alignment(0.5, 1),
            colors: [appTheme.greenA700, theme.colorScheme.primary],
        ),
    );

    // Text button style
    static ButtonStyle get none => ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
        elevation: MaterialStateProperty.all<double>(0),
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
            EdgeInsetsDirectional.zero,
        ),
        side: MaterialStateProperty.all<BorderSide>(
            BorderSide(color: Colors.transparent),
        ),
    );
}

class CustomElevatedButton extends BaseButton {
    CustomElevatedButton({
        Key? key,
        this.decoration,
        this.leftIcon,
        this.rightIcon,
        EdgeInsetsGeometry? margin,
        VoidCallback? onPressed,
        ButtonStyle? buttonStyle,
        AlignmentGeometry? alignment,
        TextStyle? buttonTextStyle,
        bool? isDisabled,
        double? height,
        double? width,
        required String text,
    }) : super(
        text: text,
        onPressed: onPressed,
        buttonStyle: buttonStyle,
        isDisabled: isDisabled,
        buttonTextStyle: buttonTextStyle,
        height: height,
        width: width,
        alignment: alignment,
        margin: margin,
    );

    final BoxDecoration? decoration;
    final Widget? leftIcon;
    final Widget? rightIcon;

    @override
    Widget build(BuildContext context) {
        return alignment != null
            ? Align(
                alignment: alignment ?? AlignmentDirectional.center,
                child: buildElevatedButtonWidget,
            )
            : buildElevatedButtonWidget;
    }

    Widget get buildElevatedButtonWidget => Container(
        height: height ?? 44.h,
        width: width ?? double.maxFinite,
        margin: margin,
        decoration: decoration ?? CustomButtonStyles.gradientGreenAToPrimaryDecoration,
        child: ElevatedButton(
            style: buttonStyle,
            onPressed: isDisabled ?? false ? null : onPressed ?? () {},
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                    leftIcon ?? const SizedBox.shrink(),
                    Text(
                        text,
                        style: buttonTextStyle ?? theme.textTheme.titleLarge,
                    ),
                    rightIcon ?? const SizedBox.shrink(),
                ],
            ),
        ),
    );
}

class CustomIconButton extends StatelessWidget {
    CustomIconButton({
        Key? key,
        this.alignment,
        this.height,
        this.width,
        this.decoration,
        this.padding,
        this.onTap,
        this.child,
    }) : super(key: key);

    final AlignmentGeometry? alignment;
    final double? height;
    final double? width;
    final BoxDecoration? decoration;
    final EdgeInsetsGeometry? padding;
    final VoidCallback? onTap;
    final Widget? child;

    @override
    Widget build(BuildContext context) {
        return alignment != null
            ? Align(
                alignment: alignment ?? AlignmentDirectional.center,
                child: iconButtonWidget,
            )
            : iconButtonWidget;
    }

    Widget get iconButtonWidget => SizedBox(
        height: height ?? 0,
        width: width ?? 0,
        child: DecoratedBox(
            decoration: decoration ??
                BoxDecoration(
                    color: appTheme.blueGray50,
                    borderRadius: BorderRadius.circular(12.h),
                ),
            child: IconButton(
                padding: padding ?? EdgeInsetsDirectional.zero,
                onPressed: onTap,
                icon: child ?? Container(),
            ),
        ),
    );
}

class CustomImageView extends StatelessWidget {
    CustomImageView({
        this.imagePath,
        this.height,
        this.width,
        this.color,
        this.fit,
        this.alignment,
        this.onTap,
        this.radius,
        this.margin,
        this.border,
        this.placeHolder = 'assets/images/image_not_found.png',
    });

    final String? imagePath;
    final double? height;
    final double? width;
    final Color? color;
    final BoxFit? fit;
    final String placeHolder;
    final AlignmentGeometry? alignment;
    final VoidCallback? onTap;
    final EdgeInsetsGeometry? margin;
    final BorderRadius? radius;
    final BoxBorder? border;

    @override
    Widget build(BuildContext context) {
        return alignment != null
            ? Align(alignment: alignment!, child: _buildWidget())
            : _buildWidget();
    }

    Widget _buildWidget() {
        return Padding(
            padding: margin ?? EdgeInsetsDirectional.zero,
            child: InkWell(
                onTap: onTap,
                child: _buildCircleImage(),
            ),
        );
    }

    Widget _buildCircleImage() {
        if (radius != null) {
            return ClipRRect(
                borderRadius: radius ?? BorderRadiusDirectional.zero,
                child: _buildImageWithBorder(),
            );
        } else {
            return _buildImageWithBorder();
        }
    }

    Widget _buildImageWithBorder() {
        if (border != null) {
            return Container(
                decoration: BoxDecoration(
                    border: border,
                    borderRadius: radius,
                ),
                child: _buildImageView(),
            );
        } else {
            return _buildImageView();
        }
    }

    Widget _buildImageView() {
    if (imagePath != null) {
        switch (imagePath!.imageType) {
            case ImageType.svg:
                return Container(
                    height: height,
                    width: width,
                    child: SvgPicture.asset(
                        imagePath!,
                        height: height,
                        width: width,
                        fit: fit ?? BoxFit.contain,
                        colorFilter: this.color != null
                            ? ColorFilter.mode(
                                this.color ?? Colors.transparent, BlendMode.srcIn)
                            : null,
                    ),
                );
            case ImageType.file:
                return Image.file(
                    File(imagePath!),
                    height: height,
                    width: width,
                    fit: fit ?? BoxFit.cover,
                    color: color,
                );
            case ImageType.network:
                return CachedNetworkImage(
                    height: height,
                    width: width,
                    fit: fit,
                    imageUrl: imagePath!,
                    color: color,
                    placeholder: (context, url) => Container(
                        height: 30,
                        width: 30,
                        child: LinearProgressIndicator(
                            color: Colors.grey.shade200,
                            backgroundColor: Colors.grey.shade100,
                        ),
                    ),
                    errorWidget: (context, url, error) => Image.asset(
                        placeHolder,
                        height: height,
                        width: width,
                        fit: fit ?? BoxFit.cover,
                    ),
                );
            case ImageType.png:
            default:
                return Image.asset(
                    imagePath!,
                    height: height,
                    width: width,
                    fit: fit ?? BoxFit.cover,
                    color: color,
                );
        }
    }
    return SizedBox();
}

}

class CustomSearchView extends StatelessWidget {
    CustomSearchView({
        Key? key,
        this.alignment,
        this.width,
        this.boxDecoration,
        this.scrollPadding,
        this.controller,
        this.focusNode,
        this.autofocus = false,
        this.textStyle,
        this.textInputType = TextInputType.text,
        this.maxLines,
        this.hintText,
        this.hintStyle,
        this.prefix,
        this.prefixConstraints,
        this.suffix,
        this.suffixConstraints,
        this.contentPadding,
        this.borderDecoration,
        this.fillColor,
        this.filled = true,
        this.validator,
        this.onChanged,
    }) : super(key: key);

    final AlignmentGeometry? alignment;
    final double? width;
    final BoxDecoration? boxDecoration;
    final TextEditingController? scrollPadding;
    final TextEditingController? controller;
    final FocusNode? focusNode;
    final bool? autofocus;
    final TextStyle? textStyle;
    final TextInputType? textInputType;
    final int? maxLines;
    final String? hintText;
    final TextStyle? hintStyle;
    final Widget? prefix;
    final BoxConstraints? prefixConstraints;
    final Widget? suffix;
    final BoxConstraints? suffixConstraints;
    final EdgeInsetsGeometry? contentPadding;
    final InputBorder? borderDecoration;
    final Color? fillColor;
    final bool? filled;
    final FormFieldValidator<String>? validator;
    final Function(String)? onChanged;


@override
Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? AlignmentDirectional.center,
            child: searchViewWidget,
        )
        : searchViewWidget;
}

Widget get searchViewWidget => Container(
    width: width ?? double.maxFinite,
    decoration: boxDecoration,
    child: TextFormField(
        scrollPadding: EdgeInsets.only(
            bottom: MediaQuery.of(Get.context!).viewInsets.bottom),
        controller: controller,
        focusNode: focusNode,
        onTapOutside: (event) {
            if (focusNode != null) {
                focusNode?.unfocus();
            } else {
                FocusManager.instance.primaryFocus?.unfocus();
            }
        },
        autofocus: autofocus ?? false,
        style: textStyle ?? theme.textTheme.titleMedium,
        keyboardType: textInputType,
        maxLines: maxLines ?? 1,
        decoration: decoration,
        validator: validator,
        onChanged: (String value) {
            onChanged?.call(value);
        },
    ),
);

InputDecoration get decoration => InputDecoration(
    hintText: hintText ?? "",
    hintStyle: hintStyle ?? theme.textTheme.titleMedium,
    prefixIcon: prefix ??
        Container(
            margin: EdgeInsetsDirectional.fromSTEB(8.h, 8.h, 6.h, 8.h),
            child: CustomImageView(
                imagePath: ImageConstant.imgSearch,
                height: 24.h,
                width: 24.h,
            ),
        ),
    prefixIconConstraints: prefixConstraints ??
        BoxConstraints(
            maxHeight: 42.h,
        ),
    suffixIcon: suffix ??
        Padding(
            padding: EdgeInsetsDirectional.only(
                end: 15.h,
            ),
            child: IconButton(
                onPressed: () => controller!.clear(),
                icon: Icon(
                    Icons.clear,
                    color: Colors.grey.shade600,
                ),
            ),
        ),
    suffixIconConstraints: suffixConstraints ??
        BoxConstraints(
            maxHeight: 42.h,
        ),
    isDense: true,
    contentPadding: contentPadding ?? EdgeInsetsDirectional.all(8.h),
    fillColor: fillColor ?? appTheme.blueGray50,
    filled: filled,
    border: borderDecoration ??
        OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.h),
            borderSide: BorderSide.none,
        ),
    enabledBorder: borderDecoration ??
        OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.h),
            borderSide: BorderSide.none,
        ),
    focusedBorder: (borderDecoration ??
        OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.h),
        )).copyWith(
            borderSide: BorderSide(
                color: theme.colorScheme.primary,
                width: 1,
            ),
        ),
);

}

class CustomTextFormField extends StatelessWidget {
    CustomTextFormField({
        Key? key,
        this.alignment,
        this.width,
        this.boxDecoration,
        this.scrollPadding,
        this.controller,
        this.focusNode,
        this.autofocus = false,
        this.textStyle,
        this.obscureText = false,
        this.readOnly = false,
        this.onTap,
        this.textInputAction = TextInputAction.next,
        this.textInputType = TextInputType.text,
        this.maxLines,
        this.hintText,
        this.hintStyle,
        this.prefix,
        this.prefixConstraints,
        this.suffix,
        this.suffixConstraints,
        this.contentPadding,
        this.borderDecoration,
        this.fillColor,
        this.filled = true,
        this.validator,
    }) : super(key: key);

    final AlignmentGeometry? alignment;
    final double? width;
    final BoxDecoration? boxDecoration;
    final TextEditingController? scrollPadding;
    final TextEditingController? controller;
    final FocusNode? focusNode;
    final bool? autofocus;
    final TextStyle? textStyle;
    final bool? obscureText;
    final bool? readOnly;
    final VoidCallback? onTap;
    final TextInputAction? textInputAction;
    final TextInputType? textInputType;
    final int? maxLines;
    final String? hintText;
    final TextStyle? hintStyle;
    final Widget? prefix;
    final BoxConstraints? prefixConstraints;
    final Widget? suffix;
    final BoxConstraints? suffixConstraints;
    final EdgeInsetsGeometry? contentPadding;
    final InputBorder? borderDecoration;
    final Color? fillColor;
    final bool? filled;
    final FormFieldValidator<String>? validator;

@override
Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? AlignmentDirectional.center,
            child: textFormFieldWidget,
        )
        : textFormFieldWidget;
}

Widget get textFormFieldWidget => Container(
    width: width ?? double.maxFinite,
    decoration: boxDecoration,
    child: TextFormField(
        scrollPadding: EdgeInsets.only(
            bottom: MediaQuery.of(Get.context!).viewInsets.bottom),
        controller: controller,
        focusNode: focusNode,
        onTapOutside: (event) {
            if (focusNode != null) {
                focusNode?.unfocus();
            } else {
                FocusManager.instance.primaryFocus?.unfocus();
            }
        },
        autofocus: autofocus ?? false,
        style: textStyle ?? theme.textTheme.titleMedium,
        obscureText: obscureText ?? false,
        readOnly: readOnly ?? false,
        onTap: () {
            onTap?.call();
        },
        textInputAction: textInputAction,
        keyboardType: textInputType,
        maxLines: maxLines ?? 1,
        decoration: decoration,
        validator: validator,
    ),
);

// Définition de la décoration pour un champ de texte
InputDecoration get decoration => InputDecoration(
  hintText: hintText ?? "", // Texte d'indication
  hintStyle: hintStyle ?? theme.textTheme.titleMedium, // Style du texte d'indication
  prefixIcon: prefix, // Icône avant le texte
  prefixIconConstraints: prefixConstraints, // Contraintes pour l'icône avant
  suffixIcon: suffix, // Icône après le texte
  suffixIconConstraints: suffixConstraints, // Contraintes pour l'icône après
  isDense: true, // Réduit la hauteur du champ
  contentPadding: contentPadding ?? EdgeInsetsDirectional.all(8.h), // Remplissage interne
  fillColor: fillColor ?? appTheme.blueGray50, // Couleur de fond
  filled: filled, // Indique si le champ doit être rempli
  border: borderDecoration ?? OutlineInputBorder(
    borderRadius: BorderRadius.circular(12.h), // Bordure arrondie
    borderSide: BorderSide.none, // Pas de bordure
  ),
  enabledBorder: borderDecoration ?? OutlineInputBorder(
    borderRadius: BorderRadius.circular(12.h), // Bordure arrondie
    borderSide: BorderSide.none, // Pas de bordure
  ),
  focusedBorder: (borderDecoration ?? OutlineInputBorder(
    borderRadius: BorderRadius.circular(12.h), // Bordure arrondie
  )).copyWith(
    borderSide: BorderSide(
      color: theme.colorScheme.primary, // Couleur de la bordure lorsqu'en focus
      width: 1, // Largeur de la bordure
    ),
  ),
);

}

// Définition d'un widget pour afficher une image dans l'AppBar
class AppbarLeadingImage extends StatelessWidget {
  AppbarLeadingImage({
    Key? key,
    this.imagePath,
    this.height,
    this.width,
    this.onTap,
    this.margin,
  }) : super(key: key);

  final double? height; // Hauteur de l'image
  final double? width; // Largeur de l'image
  final String? imagePath; // Chemin de l'image
  final Function? onTap; // Fonction à exécuter lors du clic
  final EdgeInsetsGeometry? margin; // Marge autour de l'image
  @override
Widget build(BuildContext context) {
  return Padding(
    padding: margin ?? EdgeInsets.zero,
    child: InkWell(
      onTap: () {
        onTap?.call();
      },
      child: CustomImageView(
        imagePath: imagePath,
        height: height ?? 24.h,
        width: width ?? 24.h,
        fit: BoxFit.contain,
      ),
    ),
  );
}
}

class AppbarSubtitle extends StatelessWidget {
  AppbarSubtitle({Key? key, required this.text, this.onTap, this.margin})
      : super(key: key);

  final String text;
  final Function? onTap;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: GestureDetector(
        onTap: () {
          onTap?.call();
        },
        child: Text(
          text,
          style: theme.textTheme.labelLarge!.copyWith(
            color: appTheme.blueGray500,
          ),
        ),
      ),
    );
  }
}

class AppbarTitle extends StatelessWidget {
  AppbarTitle({Key? key, required this.text, this.onTap, this.margin})
      : super(key: key);

  final String text;
  final Function? onTap;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: GestureDetector(
        onTap: () {
          onTap?.call();
        },
        child: Text(
          text,
          style: CustomTextStyles.titleSmallBlack900.copyWith(
            color: appTheme.black900,
          ),
        ),
      ),
    );
  }
}

class AppbarTitleButton extends StatelessWidget {
  AppbarTitleButton({Key? key, this.onTap, this.margin})
      : super(key: key);

  final Function? onTap;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: GestureDetector(
        onTap: () {
          onTap?.call();
        },
        child: CustomElevatedButton(
          width: 50.h,
          text: "lbl3".tr,
          buttonStyle: CustomButtonStyles.none,
          decoration: CustomButtonStyles.gradientGreenAToPrimaryDecoration,
        ),
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppBar({
    Key? key,
    this.height,
    this.shape,
    this.styleType,
    this.leadingWidth,
    this.leading,
    this.title,
    this.centerTitle,
    this.actions,
  }) : super(key: key);

  final double? height;
  final ShapeBorder? shape;
  final Style? styleType;
  final double? leadingWidth;
  final Widget? leading;
  final Widget? title;
  final bool? centerTitle;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      shape: shape,
      toolbarHeight: height ?? 56.h,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      flexibleSpace: _getStyle(),
      leadingWidth: leadingWidth ?? 0,
      leading: leading,
      title: title,
      titleSpacing: 0,
      centerTitle: centerTitle ?? false,
      actions: actions,
    );
  }


@override
Size get preferredSize => Size(
  SizeUtils.width,
  height ?? 56.h,
);

_getStyle() {
  switch (styleType) {
    case Style.bgOutlineBluegray50:
      return Container(
        height: 56.h,
        width: 374.h,
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: appTheme.blueGray50,
              width: 1.h,
            ),
          ),
        ),
      );

    case Style.bgOutLineBlueGray50_1:
      return Container(
        height: 56.h,
        width: 374.h,
        decoration: BoxDecoration(
          color: theme.colorScheme.onPrimaryContainer,
          border: Border(
            bottom: BorderSide(
              color: appTheme.blueGray50,
              width: 1.h,
            ),
          ),
        ),
      );

    default:
      return null;
  }
}

}





