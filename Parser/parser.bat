@echo off
echo �����ʽ: parser [��ɽ����ͨ�γ�Ŀ¼(...\Typeeasy\11.4\course)] [����γ�Ŀ¼(...\course)]
echo ��ִ�б�����ǰ���Ƚ������л�������γ�Ŀ¼���ڴ���, �����ļ����ᴴ������ǰĿ¼��
pause
set fromDir=%1
set toDir=%2
setlocal enabledelayedexpansion
for /r %fromDir% %%i in (*.xml) do (
	set xmlFile=%%i
	getDir %%i >tmp
	set /p xmlDir=<tmp
	set xmlSaveDir=!xmlDir:%fromDir%=%toDir%!
	if not exist !xmlSaveDir! (
		if exist tmp del tmp
		md !xmlSaveDir!
	)
	cd !xmlSaveDir!
	xmlParser !xmlFile!
)
echo Done
