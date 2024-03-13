/// [FunDsAvatarSize] is used to change the size of FunDsAvatar Widget.

enum FunDsAvatarSize {
  xxl,
  xl,
  large,

  /// Default size is [FunDsAvatarSize.medium]
  medium,
  small,
  xs,
  xxs,
}

extension FunDsAvatarSizeExtension on FunDsAvatarSize {
  double get value {
    switch (this) {
      case FunDsAvatarSize.xxs:
        return 20.0;
      case FunDsAvatarSize.xs:
        return 24.0;
      case FunDsAvatarSize.small:
        return 32.0;
      case FunDsAvatarSize.medium:
        return 40.0;
      case FunDsAvatarSize.large:
        return 48.0;
      case FunDsAvatarSize.xl:
        return 56.0;
      case FunDsAvatarSize.xxl:
        return 64.0;
      default:
        return 40.0;
    }
  }

  static List<FunDsAvatarSize> getAllAvatarSize() {
    return FunDsAvatarSize.values.map((size) => size).toList();
  }
}
