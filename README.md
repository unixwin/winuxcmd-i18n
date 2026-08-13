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
