# Descripción del Proyecto: Taller de Programación para el Análisis de Datos (TPAD)

---

## Descripción general

El **Taller de Programación para el Análisis de Datos (TPAD)** es una materia de la **Tecnicatura en Gestión y Análisis de Datos (TGAD)** de la Facultad de Ciencias Económicas de la **Universidad de Buenos Aires (UBA)**.

Este repositorio contiene el material completo del taller: notebooks de clase, ejercicios resueltos y recursos de referencia. Está organizado por parcial y unidad, siguiendo la progresión del programa oficial de la materia.

El taller está dirigido a **estudiantes sin experiencia previa en programación**, con un enfoque práctico y ejemplos contextualizados en el ámbito económico y organizacional (precios, IVA, registros de datos, presupuestos, etc.).

---

## Objetivos pedagógicos

- Introducir la programación en **Python** desde cero, sin suponer conocimientos previos.
- Desarrollar competencias para el **análisis de datos** aplicado al contexto económico y de gestión.
- Familiarizar al estudiante con herramientas del ecosistema de datos: NumPy, Pandas, Matplotlib y Seaborn.
- Fomentar el pensamiento computacional y la resolución de problemas mediante código.
- Trabajar con entornos profesionales de desarrollo: **JupyterLab** y **VS Code**.

---

## Estructura de carpetas y archivos

```
taller-tgad-fce/
├── .github/
│   └── agents/
│       └── tutor-tpad.agent.md     → Configuración del agente IA tutor del curso
├── fuentes/
│   └── Python-Programming-and-Numerical-Methods.pdf   → Material de referencia bibliográfica
├── sesiones/
│   └── primer-parcial/
│       ├── u1/
│       │   ├── clase1/
│       │   │   └── TPAD_Clase_0.ipynb         → Entorno de trabajo (Colab y VS Code)
│       │   ├── clase2/
│       │   │   ├── TPAD_Clase_2_1.ipynb       → Tipos de datos primitivos y operadores
│       │   │   └── TPAD_Clase_2_2.ipynb       → Listas y tuplas
│       │   ├── clase3/
│       │   │   └── TPAD_Clase_3.ipynb         → Diccionarios, fechas y NumPy
│       │   └── clase4/
│       │       └── TPAD_Clase_4.ipynb         → Control de flujo y funciones
│       └── ejercicios/
│           └── 1.-ejercicios_resueltos_tipo_de_datos_basicos_1.ipynb
├── requirements.txt                → Dependencias del proyecto
├── README.md                       → Documentación principal
└── ejercicio3.md                   → Este archivo
```

---

## Temario — Primer Parcial (Unidad 1)

| Clase | Temas |
|-------|-------|
| **Clase 0** | Configuración del entorno de trabajo: Google Colab y VS Code |
| **Clase 2 — Parte 1** | Tipos de datos primitivos: `int`, `float`, `str`, `bool`; operadores aritméticos; `input()`; conversión de tipos; f-strings |
| **Clase 2 — Parte 2** | Estructuras de datos: `list`, `tuple`; indexación, slicing, `.append()`, `.sort()`, `.reverse()` |
| **Clase 3** | `dict`: creación, lectura, modificación y eliminación (CRUD); `.keys()`, `.values()`, `.items()`, `.get()`, `zip()`; manejo de fechas; NumPy: vectores y matrices |
| **Clase 4** | Control de flujo: `if/elif/else`, bucles `for` y `while`; definición y uso de funciones |

> El curso está en **desarrollo activo**. A medida que se incorporen nuevas unidades en `sesiones/`, el temario se ampliará.

---

## Stack tecnológico y dependencias

### Requisitos del sistema

- **Python 3.12**
- **pip** para gestión de paquetes
- Entorno virtual recomendado: `.venv`

### Dependencias principales

| Librería | Versión | Uso |
|----------|---------|-----|
| `numpy` | 2.4.3 | Vectores, matrices y operaciones numéricas |
| `pandas` | 3.0.1 | Análisis y manipulación de datos tabulares |
| `matplotlib` | 3.10.8 | Visualización de datos (gráficos estáticos) |
| `seaborn` | 0.13.2 | Visualización estadística de alto nivel |
| `jupyterlab` | 4.5.6 | Entorno interactivo de notebooks |
| `ipywidgets` | 8.1.8 | Widgets interactivos en notebooks |

Todas las dependencias están listadas en [`requirements.txt`](requirements.txt).

---

## Instrucciones de instalación y uso

### 1. Clonar el repositorio

```bash
git clone <url-del-repo>
cd taller-tgad-fce
```

### 2. Crear el entorno virtual

```bash
python3 -m venv .venv
```

### 3. Activar el entorno virtual

```bash
# Linux / macOS
source .venv/bin/activate

# Windows
.venv\Scripts\activate
```

### 4. Instalar las dependencias

```bash
pip install -r requirements.txt
```

### 5. Abrir JupyterLab

```bash
jupyter lab
```

O bien, abrí los notebooks directamente desde **VS Code** con la extensión de Jupyter instalada.

### 6. Ejecutar los notebooks

Cada notebook está pensado para ejecutarse **de arriba hacia abajo, celda por celda**:
- Las celdas **Markdown** explican el concepto teórico.
- Las celdas de **código** muestran ejemplos listos para ejecutar y modificar.
- Los notebooks de `ejercicios/` incluyen enunciado y solución: se recomienda intentar resolver cada ejercicio antes de ver la respuesta.

---

## Agente IA tutor (`tutor-tpad`)

El proyecto incluye un **agente IA personalizado** configurado en `.github/agents/tutor-tpad.agent.md`. Este agente actúa como el profesor tutor del curso dentro de VS Code Copilot.

### Características del agente

- **Rol**: Tutor socrático del TPAD — guía al estudiante para que llegue a la respuesta por su cuenta antes de dársela directamente.
- **Idioma**: Español argentino (tuteo con _vos_). Ejemplo: "¿Qué pensás que hace este código?"
- **Enfoque pedagógico**:
  - Primero pregunta, después explica.
  - Usa ejemplos del contexto económico y de negocios (IVA, precios en pesos, códigos de materias UBA).
  - Descompone problemas complejos en partes más pequeñas (andamiaje progresivo).
  - Trata los errores como oportunidades de aprendizaje.
  - Referencia las clases del curso en cada respuesta.
- **Herramientas disponibles**: puede leer y editar notebooks, ejecutar celdas de código, buscar en el repositorio y crear archivos.

### Cómo usarlo

En VS Code con GitHub Copilot, seleccioná el modo de agente **"Tutor TPAD"** para interactuar con el tutor contextualizado en el material del curso.
