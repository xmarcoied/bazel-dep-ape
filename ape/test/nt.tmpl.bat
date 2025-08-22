@echo off

:: Enable Batch extensions
verify other 2>nul
setlocal EnableExtensions
if errorlevel 1 (
  echo "Failed to enable extensions"
  exit /b 120
)

:: Check for delayed expansion of variables with `!VAR!`
verify other 2>nul
setlocal EnableDelayedExpansion
if errorlevel 1 (
  echo "Failed to enable extensions"
  exit /b 120
)
setlocal DisableDelayedExpansion

:: Bazel substitutions
set "TARGET={{target}}"
set "ARGUMENTS={{arguments}}"
set "CODE={{code}}"

:: Runfiles
if [%RUNFILES_MANIFEST_ONLY%] neq [1] (
  echo>&2.Only runfile manifests are supported
  exit /b 2
)
setlocal EnableDelayedExpansion
for %%v in (TARGET) do (
    for /f "tokens=1,2* usebackq" %%a in ("%RUNFILES_MANIFEST_FILE%") do (
        if "_main/!%%v!" == "%%a" (
          set "%%v=%%~fb"
        )
        if "!%%v!" == "../%%a" (
          set "%%v=%%~fb"
        )
    )
)
setlocal DisableDelayedExpansion

:: Execute!
for /f %%a in ("%TARGET%") do set EXTENSION=%%~xa
if "%EXTENSION%" == ".bat" set LAUNCHER=call
%LAUNCHER% %TARGET% %ARGUMENTS%
set "STATUS=%ERRORLEVEL%"
if %STATUS% neq %CODE% (
  >&2 echo.Error: incorrect exit code ^(%STATUS%^): %TARGET% %ARGUMENTS%
  exit /b %STATUS%
)