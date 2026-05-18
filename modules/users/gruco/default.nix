{ den, ... }:
{
  # user aspect
  den.aspects.gruco = {
    includes = [
      den.provides.define-user
      den.provides.primary-user
      (den.provides.user-shell "fish")
    ];
  };
}
