@echo off& call load.bat _getDeskWallpaperPath& call loadF.bat _help& call loadE.bat imagemagick-convert zipMini elevate& setlocal enabledelayedexpansion
:::˵��
:::  ����LOL������汳��
:::����
:::  [imgPath]
:::      imgPath - ͼƬ��ַ������ʹ�õ�ǰ�����ֽ
:::  [help\-help\-h]
:::      help - ��ӡע����Ϣ
:::external
:::  date       2018-02-06 23:05:10
:::  face       ����
:::  weather    shanghai �� 4��/-2�� ����

set lolPath=C:\Program Files\��Ѷ��Ϸ\Ӣ������
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