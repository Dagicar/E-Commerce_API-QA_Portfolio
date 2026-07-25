@echo off
chcp 65001 > nul
echo ====================================================
echo Ejecutando Suite de Pruebas (Consola): E-Commerce API
echo ====================================================
echo.

call newman run E-Commerce_API-QA_Portfolio.postman_collection.json -e E-Commerce_QA_Env.postman_environment.json

echo.
echo ====================================================
echo Pruebas finalizadas. Presiona cualquier tecla para salir.
echo ====================================================
pause