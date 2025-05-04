abstract interface class Dependencies {
  Dependencies();

  /// List of dependencies
  ///
  ///
  Dependencies freeze();
}

final class $MutableDependencies implements Dependencies {
  $MutableDependencies() : super();

  /// List of dependencies
  ///
  ///
  @override
  Dependencies freeze() => const _$ImmutableDependencies();
}

final class _$ImmutableDependencies implements Dependencies {
  const _$ImmutableDependencies() : super();

  /// List of dependencies
  ///
  ///
  @override
  Dependencies freeze() => this;
}
