@echo off& call load.bat _getDeskWallpaperPath& call loadE.bat imagemagick-convert zipMini elevate& setlocal enabledelayedexpansion
::˵��
::  �޸�LOL������汳��Ϊָ����ֽ
::���÷�ʽ
::  A:�������� - ʹ�õ�ǰ�����ֽ
::  B:������ - ʹ��ָ��ͼƬ
set lolPath=C:\Program Files\��Ѷ��Ϸ\Ӣ������
if "%~1" EQU "" (
	(%_call% ("wallpaperPath") %_getDeskWallpaperPath%)
) else (
	set wallpaperPath=%~1
)


::dds
set tempPath=C:\DATA\LoadingScreen
md %tempPath% 2>nul
::���ش��Ҷ� �ٻ�ʦϿ��
set ddsImgPath=%tempPath%\HABackground.dds
set ddsImgPath2=%tempPath%\SRBackground.dds
%imagemagick-convert% "%wallpaperPath%" "%ddsImgPath%"
%imagemagick-convert% "%wallpaperPath%" "%ddsImgPath2%"
::zip res replace
%elevate% -c %zipMini% "%lolPath%\Game\Loading.zip" "%ddsImgPath%" "%ddsImgPath2%"
::remove tempPath
timeout /t 5 >nul
rd /s /q C:\DATA