@echo off
echo ================================================
echo Maa_MHXY_MG 项目初始化脚本
echo ================================================
echo.

echo [1/3] 检查并初始化 Git 子模块...
git submodule sync
git submodule update --init --recursive --force
if errorlevel 1 (
    echo 错误: Git 子模块初始化失败
    pause
    exit /b 1
)
echo Git 子模块初始化完成
echo.

echo [2/3] 配置 OCR 模型...
python tools\configure.py
if errorlevel 1 (
    echo 警告: OCR 模型配置失败，但继续执行
)
echo OCR 模型配置完成
echo.

echo [3/3] 验证项目结构...
if exist "assets\MaaCommonAssets\OCR" (
    echo ✓ MaaCommonAssets 子模块已正确初始化
) else (
    echo ✗ 警告: MaaCommonAssets 子模块可能未完全初始化
)

if exist "assets\resource\base\model\ocr" (
    echo ✓ OCR 模型已配置
) else (
    echo ✗ 警告: OCR 模型未找到
)

echo.
echo ================================================
echo 项目初始化完成！
echo ================================================
echo.
echo 下一步操作:
echo 1. 请参阅 docs\窗口运行教程.md 进行使用
echo 2. 确保已安装 VC++ Redistributable 和 .NET 10
echo 3. 配置模拟器为 1280x720 240dpi，使用 DirectX 模式
echo.
pause
