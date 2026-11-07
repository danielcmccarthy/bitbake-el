# Release notes

## 0.2 (2026-11-06)
- Support for remote workspaces via TRAMP.
- New commands for visiting recipe dependencies: `bitbake-find-class`, `bitbake-find-include`, `bitbake-find-source`.
- `bitbake-browse-variable-documentation` uses the version of the manual corresponding to `DISTRO_VERSION` in the current workspace.
- Fixes:
    - Fix `bitbake-mode-hook` regression (#26).
    - `bitbake-buffer-recipe` handles recipes without a version number in their names.
    - Regexp stack overflow when a task takes a long time in "Loading cache:".
    - Run `bitbake-layers` in the build directory; required for kirkstone and older versions to be able to find `bblayers.conf`.
