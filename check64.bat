if /i "%PROCESSOR_ARCHITECTURE%"=="AMD64" (echo 64bit) else (echo 32bit)
if /i "%PROCESSOR_ARCHITEW6432%"=="AMD64" (echo 64bit) else (echo 32bit)