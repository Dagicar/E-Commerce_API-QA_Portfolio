@echo off
chcp 65001 > nul
echo ====================================================
echo Ejecutando Pruebas y Generando Reporte HTML...
echo ====================================================
echo.

if not exist "reports" mkdir reports

call newman run E-Commerce_API-QA_Portfolio.postman_collection.json -e E-Commerce_QA_Env.postman_environment.json -r htmlextra --reporter-htmlextra-export ./reports/Reporte_Pruebas_API.html

echo.
echo ====================================================
echo Reporte generado en: ./reports/Reporte_Pruebas_API.html
echo Pruebas finalizadas. Presiona cualquier tecla para salir.
echo ====================================================
pause