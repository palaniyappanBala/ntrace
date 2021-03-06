@echo off

if x%SDKBASE%x == xx (
	echo.
	echo SDKBASE not set. Set to base directory of Windows SDK.
	echo Note that the path must not contain any spaces - required by build.exe
	echo.
	goto exit
)

if x%WRKBASE%x == xx (
	echo.
	echo WRKBASE not set. Set to base directory of WMK/HP.
	echo Note that the path must not contain any spaces - required by build.exe
	echo.
	goto exit
)

if NOT x%DDKBUILDENV%x == xx (
	echo.
	echo Build environment found. Execute this command in a normal shell, not in a WDK shell.
	echo.
	goto exit
)

copy /Y Jpufbt\jpufbt\jpufbtmsg_u.mc + Jpfbt\jpfbt\jpfbtmsg.mc Jpufbt\jpufbt\jpufbtmsg.mc
copy /Y Jpkfbt\jpkfbt\jpkfbtmsg_u.mc + Jpfbt\jpfbt\jpfbtmsg.mc Jpkfbt\jpkfbt\jpkfbtmsg.mc

cmd /C ddkbuild -WLHNET checked . -cZ
cmd /C ddkbuild -WLHNET free . -cZ

:exit
