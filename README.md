# WinuxCmd I18N Catalogs

Optional language catalogs for WinuxCmd. The core executable keeps English as
the default and loads a catalog only when `WINUX_LANG` is set.

Install the `winuxcmd-i18n-zh-cn` package through WPM, then run:

```sh
export WINUX_LANG=zh-CN
winuxcmd ls --help
```

To make the language selection persistent for future Windows processes, use
the built-in Windows `setx.exe` command:

```cmd
setx WINUX_LANG zh-CN
```

Open a new terminal after running `setx`; existing processes keep their current
environment. To disable catalog loading persistently, run:

```cmd
setx WINUX_LANG off
```

Catalogs are installed below `.wpm/i18n/<locale>/catalog.json`. Missing keys
fall back to the English text compiled into WinuxCmd.

Translations are reviewed artifacts. Automated or model-generated translations
are drafts and must be checked before release.

## Release policy (mandatory)

Translations ship to users as the `winuxcmd-i18n-zh-cn` WPM package, so a
catalog change that is never released never reaches anyone. The rules below
are enforced by CI, not by memory:

- The `VERSION` file (single line, e.g. `0.4.0`) is the release version.
- Any change under `catalogs/` MUST bump `VERSION` (at least the patch
  segment) in the same PR. The `Version bump guard` workflow fails the PR
  otherwise. Versions only move forward.
- Merging a new `VERSION` to `main` automatically:
  1. tags `v<VERSION>` and publishes `winuxcmd-i18n-zh-cn.zip` as a GitHub
     release (zip layout: `zh-CN/catalog.json`),
  2. opens an automated PR on `unixwin/wpm-source` that refreshes the
     `winuxcmd-i18n-zh-cn` index entry (version, URL, SHA-256, size).
- After that PR merges, users get the update via `wpm index update` and
  `wpm install winuxcmd-i18n-zh-cn`.
- The automated `en-US/` sync from the WinuxCmd release workflow does not
  require a bump: that directory is a reference extract and is not packaged.

The `WPM_SOURCE_TOKEN` repository secret must hold a token with write access
to `unixwin/wpm-source`; without it the release still publishes but the index
update must be done by hand.
