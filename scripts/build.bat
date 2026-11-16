@echo off
setlocal
cd /d "%~dp0.."
if not exist "build\classes" mkdir "build\classes"
if not exist "dist" mkdir "dist"
if exist "build\sources.txt" del "build\sources.txt"
for /R "src\main\java" %%f in (*.java) do echo "%%f">> "build\sources.txt"
javac --release 17 -encoding UTF-8 -d "build\classes" @build\sources.txt
if errorlevel 1 exit /b 1
jar --create --file "dist\Jamb-Multiplayer.jar" --main-class com.jamb.Main -C "build\classes" .
if errorlevel 1 exit /b 1
echo Built dist\Jamb-Multiplayer.jar
