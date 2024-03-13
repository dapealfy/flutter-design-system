import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_design_system/funds.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FunDsAvatar extends StatelessWidget {
  /// The text to display as the avatar.
  final String? name;

  /// The image from asset to display as the avatar.
  final String? imagePath;

  /// The image from network to display as the avatar.
  final String? imageUrl;

  /// use[FunDsColors]. The color with which to fill the round.
  final Color? backgroundColor;

  /// use[FunDsColors]. The default text color for text in the round.
  final Color? foregroundColor;
  final BoxBorder? border;

  /// The size of the avatar.
  final FunDsAvatarSize size;

  /// The shape of the avatar.
  final FunDsAvatarShape shape;

  /// Create FunDsAvatar of all types i.e. round,rectangle with different sizes.
  const FunDsAvatar({
    Key? key,
    this.name,
    this.backgroundColor,
    this.foregroundColor,
    this.imagePath,
    this.imageUrl,
    this.size = FunDsAvatarSize.medium,
    this.shape = FunDsAvatarShape.round,
    this.border,
  })  : assert(
          (imagePath != null && imageUrl == null) ||
              (imagePath == null && imageUrl != null ||
                  (imagePath == null && imageUrl == null)),
          'You can only pass either imagePath or imageUrl',
        ),
        super(key: key);

  /// Create Avatar with image from network.
  factory FunDsAvatar.network({
    Key? key,
    required String imageUrl,
    String? name,
    Color? backgroundColor,
    Color? foregroundColor,
    FunDsAvatarSize size = FunDsAvatarSize.medium,
    FunDsAvatarShape shape = FunDsAvatarShape.round,
    BoxBorder? border,
  }) {
    return FunDsAvatar(
      key: key,
      imageUrl: imageUrl,
      name: name,
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
      size: size,
      shape: shape,
      border: border,
    );
  }

  /// Create Avatar with image from asset.
  factory FunDsAvatar.asset({
    Key? key,
    required String imagePath,
    String? name,
    Color? backgroundColor,
    Color? foregroundColor,
    FunDsAvatarSize size = FunDsAvatarSize.medium,
    FunDsAvatarShape shape = FunDsAvatarShape.round,
    BoxBorder? border,
  }) {
    return FunDsAvatar(
      key: key,
      imagePath: imagePath,
      name: name,
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
      size: size,
      shape: shape,
      border: border,
    );
  }

  String _getInitialsUserName(String text) {
    // Get initials from the user's name
    List<String> nameParts = text.split(' ');

    // Get the first two characters of each part (or the first character if only one part)
    String avatarText = '';
    if (text.isEmpty) return avatarText;
    for (String part in nameParts.take(2)) {
      avatarText += part[0];
    }

    return avatarText;
  }

  double getCircularProgressStrokeWidth() {
    switch (size) {
      case FunDsAvatarSize.xxs:
      case FunDsAvatarSize.xs:
        return 1;
      case FunDsAvatarSize.small:
      case FunDsAvatarSize.medium:
        return 2;
      case FunDsAvatarSize.large:
      case FunDsAvatarSize.xl:
      case FunDsAvatarSize.xxl:
        return 3;
      default:
        return 3;
    }
  }

  double get _borderRadius {
    switch (size) {
      case FunDsAvatarSize.xxs:
      case FunDsAvatarSize.xs:
        return 4;
      case FunDsAvatarSize.small:
      case FunDsAvatarSize.medium:
        return 8;
      case FunDsAvatarSize.large:
      case FunDsAvatarSize.xl:
      case FunDsAvatarSize.xxl:
        return 12;
      default:
        return 8;
    }
  }

  TextStyle get textStyle {
    switch (size) {
      case FunDsAvatarSize.xxs:
        return FunDsTypography.body10B.copyWith(color: foregroundColor);
      case FunDsAvatarSize.xs:
        return FunDsTypography.body12B.copyWith(color: foregroundColor);
      case FunDsAvatarSize.small:
        return FunDsTypography.heading14.copyWith(color: foregroundColor);
      case FunDsAvatarSize.medium:
        return FunDsTypography.heading16.copyWith(color: foregroundColor);
      case FunDsAvatarSize.large:
        return FunDsTypography.body18B.copyWith(color: foregroundColor);
      case FunDsAvatarSize.xl:
        return FunDsTypography.heading20.copyWith(color: foregroundColor);
      case FunDsAvatarSize.xxl:
        return FunDsTypography.heading24.copyWith(color: foregroundColor);
      default:
        return FunDsTypography.heading16.copyWith(color: foregroundColor);
    }
  }

  BoxShape get _avatarBoxShape {
    if (shape == FunDsAvatarShape.round) {
      return BoxShape.circle;
    } else if (shape == FunDsAvatarShape.rectangle) {
      return BoxShape.rectangle;
    } else {
      return BoxShape.circle;
    }
  }

  @override
  Widget build(BuildContext context) {
    final Color? backgroundColor = this.backgroundColor;
    return Container(
      constraints: BoxConstraints(
        minHeight: size.value,
        minWidth: size.value,
        maxWidth: size.value,
        maxHeight: size.value,
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
        image: (imagePath != null && imagePath!.isNotEmpty)
            ? DecorationImage(
                image: AssetImage(imagePath!),
                fit: BoxFit.cover,
              )
            : null,
        shape: _avatarBoxShape,
        border: border,
        borderRadius: shape == FunDsAvatarShape.rectangle
            ? BorderRadius.circular(_borderRadius)
            : null,
      ),
      child: (imageUrl != null && imageUrl!.isNotEmpty)
          ? CachedNetworkImage(
              imageUrl: imageUrl!,
              imageBuilder: (context, imageProvider) => Container(
                decoration: BoxDecoration(
                  color: backgroundColor,
                  image: imageUrl != null
                      ? DecorationImage(
                          image: CachedNetworkImageProvider(imageUrl!),
                          fit: BoxFit.cover,
                        )
                      : null,
                  shape: _avatarBoxShape,
                  border: border,
                  borderRadius: shape == FunDsAvatarShape.rectangle
                      ? BorderRadius.circular(_borderRadius)
                      : null,
                ),
              ),
              placeholder: (context, url) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircularProgressIndicator(
                  strokeWidth: getCircularProgressStrokeWidth(),
                ),
              ),
              errorWidget: (context, url, error) => Container(
                decoration: BoxDecoration(
                  color: FunDsColors.colorNeutral200,
                  shape: _avatarBoxShape,
                  border: border,
                  borderRadius: shape == FunDsAvatarShape.rectangle
                      ? BorderRadius.circular(_borderRadius)
                      : null,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: SvgPicture.asset(
                    FunDsIconography.icAvatar,
                  ),
                ),
              ),
            )
          : (imagePath == null || (imagePath?.isEmpty == true))
              ? Center(
                  child: Text(
                    _getInitialsUserName(name ?? ''),
                    style: textStyle,
                  ),
                )
              : null,
    );
  }
}
