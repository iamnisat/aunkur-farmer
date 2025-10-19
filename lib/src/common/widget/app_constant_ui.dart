import 'dart:convert';
import 'dart:io';

import 'package:aunkur_farmer/main.dart';
import 'package:aunkur_farmer/src/common/constant/app_asset.dart';
import 'package:aunkur_farmer/src/common/constant/app_colors.dart';
import 'package:aunkur_farmer/src/common/constant/common_content.dart';
import 'package:aunkur_farmer/src/common/function/common_function.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_svg/svg.dart';

class AppConstantUI {
  static void showCustomSnackBar(
    String message, {
    bool isError = false,
    void Function()? onPressed,
  }) {
    if (message.isNotEmpty) {
      ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
        SnackBar(
          dismissDirection: DismissDirection.horizontal,
          // margin: const EdgeInsets.all(8),
          duration: const Duration(seconds: 3),
          backgroundColor: isError ? Colors.red : AppColors.primary,
          behavior: SnackBarBehavior.fixed,

          action: onPressed != null
              ? SnackBarAction(
                  textColor: AppColors.lowWhite,
                  label: "Open",
                  onPressed: onPressed,
                )
              : null,

          // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          content: Text(
            message,
            style: const TextStyle(fontSize: 15, color: AppColors.lowWhite),
          ),
        ),
      );
    }
  }

static  Widget buildImage(
    String imagePath,
    double size,
    Color borderColor,
    double borderWidth,
    VoidCallback onClicked,
  ) {
    return GestureDetector(
      onTap: onClicked,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          border: Border.all(color: borderColor, width: borderWidth),
          borderRadius: BorderRadius.circular(size / 2),
          boxShadow: [
            BoxShadow(
              offset: const Offset(-3, 3),
              spreadRadius: 2,
              blurRadius: 7,
              color: Colors.grey.withAlpha((0.5 * 255).toInt()),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(size)),
          child: shapedImage(imagePath, size),
        ),
      ),
    );
  }

  static Widget shapedImage(String imagePath, double size) {
    if (imagePath.isEmpty) {
      return Image.asset(
        'assets/background/Images/profilepic.png',
        height: size,
        width: double.infinity,
        fit: BoxFit.cover,
        alignment: Alignment.center,
      );
    } else if (imagePath.contains('https')) {
      return CachedNetworkImage(
        height: size,
        width: double.infinity,
        fit: BoxFit.cover,
        imageUrl: imagePath,
        cacheManager: CacheManager(
          Config(imagePath, stalePeriod: const Duration(days: 30)),
        ),
        placeholder: (context, url) => Image.asset(
          'assets/image/spinner.gif',
          fit: BoxFit.cover,
          width: double.infinity,
          height: 80,
        ),
        errorWidget: (context, url, error) {
          debugPrint("Url $url");
          debugPrint('error $error');
          return const Icon(Icons.error_outline);
        },
      );
    } else if (imagePath.contains('assets')) {
      return Image.asset(
        imagePath,
        height: size,
        width: double.infinity,
        fit: BoxFit.cover,
        alignment: Alignment.center,
        frameBuilder: (context, child, frame, wasSynchronouslyLoaded) =>
            AnimatedOpacity(
              opacity: frame == null ? 0 : 1,
              duration: const Duration(seconds: 1),
              curve: Curves.easeOut,
              child: child,
            ),
        errorBuilder: (context, error, stackTrace) => Image.asset(
          'assets/background/Images/profilepic.png',
          height: size,
          width: double.infinity,
          fit: BoxFit.cover,
          alignment: Alignment.center,
        ),
      );
    } else if (CommonFunction.isBase64(imagePath)) {
      return Image.memory(
        base64Decode(imagePath),
        height: size,
        width: double.infinity,
        fit: BoxFit.cover,
        alignment: Alignment.center,
        // frameBuilder: (context, child, frame, wasSynchronouslyLoaded) => AnimatedOpacity(
        //   opacity: frame == null ? 0 : 1,
        //   duration: const Duration(seconds: 1),
        //   curve: Curves.easeOut,
        //   child: child,
        // ),
        errorBuilder: (context, error, stackTrace) => Image.asset(
          'assets/background/Images/profilepic.png',
          height: size,
          width: double.infinity,
          fit: BoxFit.cover,
          alignment: Alignment.center,
        ),
      );
    }
    return Image.asset(
      'assets/background/Images/profilepic.png',
      height: size,
      width: double.infinity,
      fit: BoxFit.cover,
      alignment: Alignment.center,
    );
  }

  static Widget networkImageBuild({
    required String url,
    required double size,
    Color? borderColor,
    double? borderWidth,
    double? borderRadius,
    double? height,
    double? width,
    VoidCallback? onTap,
  }) {
    if (url.contains('https')) {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius ?? 8),
          border: Border.all(
            color: borderColor ?? Colors.transparent,
            width: borderWidth ?? 0,
          ),
        ),
        child: InkWell(
          onTap: onTap,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(borderRadius ?? 8),
            child: CachedNetworkImage(
              // color: AppColors.transparent,
              height: height ?? size,
              width: width ?? size,
              fit: BoxFit.cover,
              imageUrl: url,
              cacheManager: CacheManager(
                Config(
                  url,
                  stalePeriod: const Duration(days: 7),
                  //one week cache period
                ),
              ),
              placeholder: (context, url) => const Center(
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary),
                ),
              ),
              errorWidget: (context, url, error) => SvgPicture.asset(
                AppAssets.alertSVG,
                height: size,
                width: size,
              ),
            ),
          ),
        ),
      );
    } else if (CommonFunction.isBase64(url)) {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius ?? 8),
          border: Border.all(
            color: borderColor ?? Colors.transparent,
            width: borderWidth ?? 0,
          ),
        ),
        child: InkWell(
          onTap: onTap,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(borderRadius ?? 8),
            child: Image.memory(
              base64Decode(url),
              height: height ?? size,
              width: width ?? size,
              fit: BoxFit.fill,
              errorBuilder: (context, error, stackTrace) => SvgPicture.asset(
                AppAssets.alertSVG,
                height: height ?? size,
                width: width ?? size,
              ),
            ),
          ),
        ),
      );
    } else {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius ?? 8),
          border: Border.all(
            color: borderColor ?? Colors.transparent,
            width: borderWidth ?? 0,
          ),
        ),
        child: InkWell(
          onTap: onTap,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(borderRadius ?? 8),
            child: Image.file(
              File(url),
              height: height ?? size,
              width: width ?? size,
              fit: BoxFit.fill,
              frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
                if (wasSynchronouslyLoaded) {
                  return child;
                }
                return AnimatedOpacity(
                  opacity: frame == null ? 0 : 1,
                  duration: const Duration(seconds: 1),
                  curve: Curves.easeOut,
                  child: child,
                );
              },
              cacheWidth: 1000,
              cacheHeight: 1000,
              errorBuilder: (context, error, stackTrace) => Padding(
                padding: const EdgeInsets.all(16),
                child: SvgPicture.asset(
                  AppAssets.alertSVG,
                  height: height ?? size,
                  width: width ?? size,
                ),
              ),
            ),
          ),
        ),
      );
    }
  }
}

/// A widget displaying an icon and text with optional interaction.
///
/// [svgIcon] - Path to the SVG icon.
/// [text] - Text content to display.
/// [isExpanded] - If true, allows text to expand.
/// [backgroundColor] - Background color of the icon.
/// [iconSize] - Size of the icon.
/// [padding] - Padding around the icon.
/// [iconColor] - Color of the icon.
/// [onTap] - Callback when the widget is tapped.
class IconAndTextWidget extends StatelessWidget {
  final String svgIcon;
  final String text;
  final bool isExpanded;
  final Color backgroundColor;
  final double iconSize;
  final double padding;
  final Color iconColor;
  final void Function()? onTap;
  final IconData? icon;
  final double spacing;
  const IconAndTextWidget({
    super.key,
    this.svgIcon = "",
    required this.text,
    this.isExpanded = false,
    this.iconSize = 15,
    this.padding = 2,
    this.onTap,
    this.iconColor = AppColors.primaryBlack,
    this.icon,
    this.spacing = 3,
    this.backgroundColor = const Color(0xFFEEEEEE),
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: spacing,
        children: [
          Container(
            padding: EdgeInsets.all(padding),
            decoration: BoxDecoration(
              color: backgroundColor,
              shape: BoxShape.circle,
            ),
            child: icon != null
                ? Icon(icon, color: iconColor, size: iconSize)
                : SvgPicture.asset(
                    svgIcon,
                    height: iconSize,
                    width: iconSize,
                    colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
                  ),
          ),
          if (isExpanded) ...[
            Flexible(
              child: Text(text, style: Theme.of(context).textTheme.labelSmall),
            ),
          ] else ...[
            Text(text, style: Theme.of(context).textTheme.labelSmall),
          ],
        ],
      ),
    );
  }
}


/// A widget displaying a title and description pair for details in the card.
///
/// [title] - Title text of the card.
/// [discription] - Description text of the card.
/// [crossAxisAlignment] - Alignment of the text in the card.
/// [titleStyle] - Style of the title text.
/// [discriptionStyle] - Style of the description text.
///
class TitleAndDiscriptionCard extends StatelessWidget {
  final String title;
  final String discription;
  final CrossAxisAlignment crossAxisAlignment;
  final TextStyle? titleStyle;
  final TextStyle? discriptionStyle;

  const TitleAndDiscriptionCard(
      {super.key,
      required this.title,
      required this.discription,
      this.crossAxisAlignment = CrossAxisAlignment.start,
      this.titleStyle,
      this.discriptionStyle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: crossAxisAlignment,
      spacing: textLineGap,
      children: [
        Text(title,
            style: titleStyle ?? Theme.of(context).textTheme.bodyLarge),
        Text(discription,
            style: discriptionStyle ?? Theme.of(context).textTheme.labelSmall),
      ],
    );
  }
}
