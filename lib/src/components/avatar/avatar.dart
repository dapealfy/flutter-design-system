import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_design_system/funds.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Avatar extends StatelessWidget {
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
  final AvatarSize size;

  /// The shape of the avatar.
  final AvatarShape shape;

  /// Create FunDsAvatar of all types i.e. round,rectangle with different sizes.
  const Avatar({
    Key? key,
    this.name,
    this.backgroundColor,
    this.foregroundColor,
    this.imagePath,
    this.imageUrl,
    this.size = AvatarSize.medium,
    this.shape = AvatarShape.round,
    this.border,
  })  : assert(
          (imagePath != null && imageUrl == null) ||
              (imagePath == null && imageUrl != null ||
                  (imagePath == null && imageUrl == null)),
          'You can only pass either imagePath or imageUrl',
        ),
        super(key: key);

  /// Create Avatar with image from network.
  factory Avatar.network({
    Key? key,
    required String imageUrl,
    String? name,
    Color? backgroundColor,
    Color? foregroundColor,
    AvatarSize size = AvatarSize.medium,
    AvatarShape shape = AvatarShape.round,
    BoxBorder? border,
  }) {
    return Avatar(
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
  factory Avatar.asset({
    Key? key,
    required String imagePath,
    String? name,
    Color? backgroundColor,
    Color? foregroundColor,
    AvatarSize size = AvatarSize.medium,
    AvatarShape shape = AvatarShape.round,
    BoxBorder? border,
  }) {
    return Avatar(
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
      case AvatarSize.xxs:
      case AvatarSize.xs:
        return 1;
      case AvatarSize.small:
      case AvatarSize.medium:
        return 2;
      case AvatarSize.large:
      case AvatarSize.xl:
      case AvatarSize.xxl:
        return 3;
      default:
        return 3;
    }
  }

  double get _borderRadius {
    switch (size) {
      case AvatarSize.xxs:
      case AvatarSize.xs:
        return 4;
      case AvatarSize.small:
      case AvatarSize.medium:
        return 8;
      case AvatarSize.large:
      case AvatarSize.xl:
      case AvatarSize.xxl:
        return 12;
      default:
        return 8;
    }
  }

  TextStyle get textStyle {
    switch (size) {
      case AvatarSize.xxs:
        return FunDsTypography.body10B.copyWith(color: foregroundColor);
      case AvatarSize.xs:
        return FunDsTypography.body12B.copyWith(color: foregroundColor);
      case AvatarSize.small:
        return FunDsTypography.heading14.copyWith(color: foregroundColor);
      case AvatarSize.medium:
        return FunDsTypography.heading16.copyWith(color: foregroundColor);
      case AvatarSize.large:
        return FunDsTypography.body18B.copyWith(color: foregroundColor);
      case AvatarSize.xl:
        return FunDsTypography.heading20.copyWith(color: foregroundColor);
      case AvatarSize.xxl:
        return FunDsTypography.heading24.copyWith(color: foregroundColor);
      default:
        return FunDsTypography.heading16.copyWith(color: foregroundColor);
    }
  }

  BoxShape get _avatarBoxShape {
    if (shape == AvatarShape.round) {
      return BoxShape.circle;
    } else if (shape == AvatarShape.rectangle) {
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
        borderRadius: shape == AvatarShape.rectangle
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
                  borderRadius: shape == AvatarShape.rectangle
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
                  borderRadius: shape == AvatarShape.rectangle
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
