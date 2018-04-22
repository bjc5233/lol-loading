@echo off& call load.bat _getDeskWallpaperPath& call loadF.bat _help& call loadE.bat imagemagick-convert zipMini elevate& setlocal enabledelayedexpansion
:::说明
:::  更改LOL载入界面背景
:::参数
:::  [imgPath]
:::      imgPath - 图片地址；无则使用当前桌面壁纸
:::  [help\-help\-h]
:::      help - 打印注释信息
:::external
:::  date       2018-02-06 23:05:10
:::  face       ●︿●
:::  weather    shanghai 晴 4℃/-2℃ 北风

set lolPath=C:\Program Files\腾讯游戏\英雄联盟
if "%~1" EQU "" (
	(%_call% ("wallpaperPath") %_getDeskWallpaperPath%)
) else (
	if "%~1" EQU "help" (call %_help% "%~f0"& goto :EOF)
	if "%~1" EQU "-help" (call %_help% "%~f0"& goto :EOF)
	if "%~1" EQU "-h" (call %_help% "%~f0"& goto :EOF)
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