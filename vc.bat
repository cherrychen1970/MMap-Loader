setlocal
echo off
set VC_CMD="C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Auxiliary\Build\vcvarsall.bat"
:: x86/x64
set TARGET_ARCH=x64
:: debug/release
set CONFIG_DEFAULT=release
::set SDK=10.0.10240.0
:: set SDK=10.0.19041.0
::set CONFIG=release 
::14.16.27023, 14.29.30133, 14.36.32532
:: set TOOLSET=-vcvars_ver=14.16.27023 
::14.36.32532


if "%CONFIG%" == "" (
    set CONFIG=%CONFIG_DEFAULT%
)
::-fansi-escape-codes
@call %VC_CMD% %TARGET_ARCH% %SDK% %TOOLSET%

::where clang-cl
set CC="C:/Program Files/Microsoft Visual Studio/2022/Community/VC/Tools/Llvm/x64/bin/clang-cl.exe"
set CXX=%CC%


cmake -B build/%CONFIG% -GNinja -DTARGET_ARCH=%TARGET_ARCH% -DCMAKE_BUILD_TYPE=%CONFIG%
cmake --build build/%CONFIG%


if /I "%1"=="run" (
    cmake --build build/%CONFIG% --target run
    goto :END
)

:END
endlocal