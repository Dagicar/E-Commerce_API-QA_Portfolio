# 🛒 E-Commerce API - QA Automation Portfolio

Suite de pruebas automatizadas para API REST de comercio electrónico desarrollada en **Postman** y ejecutada con **Newman**. El proyecto abarca flujos funcionales de autenticación, consulta de catálogo de productos, gestión de carrito de compras y validación de escenarios de seguridad (*Unhappy Paths*).

---

## 🛠️ Tecnologías y Herramientas

* **Postman:** Diseño de la colección, variables de entorno (*Environment*) y scripts de prueba.
* **JavaScript (Chai.js):** Aserciones BDD para validación de estructuras JSON y códigos de estado HTTP.
* **Newman:** Ejecutor de pruebas por línea de comandos (CLI).
* **FakeStoreAPI:** API Mock para simulación de transacciones de comercio electrónico.

---

## 📋 Estructura de la Colección de Pruebas

La suite consta de 5 peticiones organizadas de forma secuencial con **encadenamiento de datos (*Data Chaining*)**:

| # | Petición | Método | Descripción / Validaciones |
|---|---|---|---|
| **01** | `POST - 01 Auth Login` | `POST` | Autenticación. Obtiene el `token` de acceso y lo guarda en variable de entorno. |
| **02** | `GET - 02 Consultar Productos` | `GET` | Consulta catálogo completo. Valida Status Code `200`, tipo de respuesta `Array` y longitud > 0. |
| **03** | `GET - 03 Detalle de Producto` | `GET` | Consulta producto con ID 1. Extrae dinámicamente `id` y `price` al entorno. |
| **04** | `POST - 04 Agregar al Carrito` | `POST` | Creación de carrito utilizando las variables `{{productoId}}` almacenadas dinámicamente. |
| **05** | `POST - 05 Login Fallido` | `POST` | **Unhappy Path:** Envío de credenciales inválidas. Valida rechazo `400/401` y mensaje de error. |

---

## ⚙️ Conceptos Técnicos Aplicados

* **Data Chaining:** Captura dinámica de atributos en variables de entorno (`pm.environment.set`) para reutilización en peticiones dependientes.
* **Aserciones Flexibles:** Manejo de códigos de respuesta válidos esperados (`pm.expect().to.be.oneOf([200, 201])`).
* **Pruebas Negativas:** Validación explícita del comportamiento del servidor ante errores controlados (*Unhappy Path*).
* **Manejo de Errores en Parsing:** Uso de `pm.response.text()` para gestionar respuestas que no vienen formateadas en JSON en escenarios de error.

---

## 🚀 Cómo Ejecutar el Proyecto

### Requisitos Previos
* Tener instalado **Node.js**, **Newman** y el generador de reportes (`npm install -g newman newman-reporter-htmlextra`).

---

### Opción 1: Ejecución Rápida (Windows)
Haz doble clic en el archivo **`run.bat`** incluido en la raíz del proyecto para correr las pruebas rápidamente en la consola.

---

### Opción 2: Ejecución con Reporte HTML Automático (Windows)
Haz doble clic en el archivo **`run-report.bat`** incluido en la raíz del proyecto para correr las pruebas y generar el reporte visual.

---

### Opción 3: Ejecución Manual desde la Terminal (Consola)
Usa el siguiente comando desde la carpeta del proyecto para ver los resultados en la consola:

```bash
newman run E-Commerce_API-QA_Portfolio.postman_collection.json -e E-Commerce_QA_Env.postman_environment.json 
```
---
### Opción 4: Ejecución Manual con Reporte HTML desde la Terminal
Usa el siguiente comando desde la carpeta del proyecto para generar el reporte visual interactivo:
```bash
newman run E-Commerce_API-QA_Portfolio.postman_collection.json -e E-Commerce_QA_Env.postman_environment.json -r htmlextra --reporter-htmlextra-export ./reports/Reporte_Pruebas_API.html
```

