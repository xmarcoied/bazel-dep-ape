@echo off

:: Enable Batch extensions
verify other 2>nul
setlocal EnableExtensions
if errorlevel 1 (
  echo "Failed to enable extensions"
  exit /b 120
)

:: Bazel substitutions
call :runfiles TARGET "{{src}}"
if errorlevel 1 exit /b %ERRORLEVEL%
call :runfiles APE "{{ape}}"
if errorlevel 1 exit /b %ERRORLEVEL%

:: Run the binary!
for %%a in ("%APE%") do set "APE=%%~fa"
%APE% %TARGET% %*
exit /b %ERRORLEVEL%

:runfiles - find a file in the Bazel runfiles
:: %1 - return variable
:: %2 - runfile path
setlocal
set "TARGET=%~2"

if [%RUNFILES_MANIFEST_FILE%] equ [] if exist "MANIFEST" (
  set "RUNFILES_MANIFEST_FILE=MANIFEST"
)

if exist "%RUNFILES_MANIFEST_FILE%" (
  for /f "tokens=1,2* usebackq" %%a in ("%RUNFILES_MANIFEST_FILE%") do (
    if "_main/%TARGET%" == "%%a" (
      set "RESOLVED=%%~fb"
      break
    )
    if "%TARGET%" == "../%%a" (
      set "RESOLVED=%%~fb"
      break
    )
  )
)

if [%RESOLVED%] equ [] if exist "external/%TARGET:../=%" (
  set "RESOLVED=external/%TARGET:../=%"
)

if [%RESOLVED%] equ [] (
  echo>&2.Failed to find runfile: %TARGET%
  exit /b 2
)

endlocal & set %~1=%RESOLVED%
goto :eof
