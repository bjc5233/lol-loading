@echo off& call load.bat _getDeskWallpaperPath& call loadE.bat imagemagick-convert zipMini elevate& setlocal enabledelayedexpansion
::说明
::  修改LOL载入界面背景为指定壁纸
::调用方式
::  A:不带参数 - 使用当前桌面壁纸
::  B:带参数 - 使用指定图片
set lolPath=C:\Program Files\腾讯游戏\英雄联盟
if "%~1" EQU "" (
	(%_call% ("wallpaperPath") %_getDeskWallpaperPath%)
) else (
	set wallpaperPath=%~1
)


::dds
set tempPath=C:\DATA\LoadingScreen
md %tempPath% 2>nul
::极地大乱斗 召唤师峡谷
set ddsImgPath=%tempPath%\HABackground.dds
set ddsImgPath2=%tempPath%\SRBackground.dds
%imagemagick-convert% "%wallpaperPath%" "%ddsImgPath%"
%imagemagick-convert% "%wallpaperPath%" "%ddsImgPath2%"
::zip res replace
%elevate% -c %zipMini% "%lolPath%\Game\Loading.zip" "%ddsImgPath%" "%ddsImgPath2%"
::remove tempPath
timeout /t 5 >nul
rd /s /q C:\DATA