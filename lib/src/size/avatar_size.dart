/// [AvatarSize] is used to change the size of FunDsAvatar Widget.

enum AvatarSize {
  xxs,
  xs,
  small,

  /// Default size is [AvatarSize.medium]
  medium,
  large,
  xl,
  xxl,
}

extension AvatarSizeExtension on AvatarSize {
  double get value {
    switch (this) {
      case AvatarSize.xxs:
        return 20.0;
      case AvatarSize.xs:
        return 24.0;
      case AvatarSize.small:
        return 32.0;
      case AvatarSize.medium:
        return 40.0;
      case AvatarSize.large:
        return 48.0;
      case AvatarSize.xl:
        return 56.0;
      case AvatarSize.xxl:
        return 64.0;
      default:
        return 40.0;
    }
  }

  static List<AvatarSize> getAllAvatarSize() {
    return AvatarSize.values.map((size) => size).toList();
  }
}
