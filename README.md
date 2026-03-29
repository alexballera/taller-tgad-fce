# Taller de Programación para el Análisis de Datos (TPAD)

Material de clases y ejercicios del **Taller de Programación para el Análisis de Datos (TPAD)** de la [Tecnicatura en Gestión y Análisis de Datos (TGAD)](https://www.econ.uba.ar/) — Facultad de Ciencias Económicas, UBA.

---

## ¿De qué trata este repositorio?

Este repo contiene los notebooks de clase, ejercicios y material de práctica del taller. Está organizado por parcial y unidad. Cada clase tiene su propio notebook con explicaciones y código listo para ejecutar.

El taller enseña **Python aplicado al análisis de datos** desde cero, sin requerir experiencia previa en programación. Los ejemplos y ejercicios están contextualizados en situaciones del ámbito económico y organizacional (precios, IVA, registros de datos, etc.).

---

## Estructura del proyecto

```
taller-tgad-fce/
├── sesiones/
│   └── primer-parcial/
│       ├── u1/
│       │   ├── clase1/   → Entorno de trabajo (Colab y VS Code)
│       │   ├── clase2/   → Tipos de datos y estructuras (int, float, str, bool, list, tuple)
│       │   ├── clase3/   → Diccionarios, fechas y NumPy
│       │   └── clase4/   → Control de flujo y funciones
│       └── ejercicios/   → Ejercicios resueltos de práctica
├── requirements.txt      → Dependencias del proyecto
└── README.md
```

---

## Temario

### Primer Parcial — Unidad 1

| Clase | Temas |
|-------|-------|
| Clase 0 | Configuración del entorno: Google Colab y VS Code |
| Clase 2 | Tipos de datos primitivos: `int`, `float`, `str`, `bool`; operadores; `input()`; f-strings; conversión de tipos |
| Clase 2 (cont.) | Estructuras de datos: `list`, `tuple`; indexación, slicing, `.append()`, `.sort()` |
| Clase 3 | `dict`: creación, lectura, modificación, eliminación; `.keys()`, `.values()`, `.items()`; fechas; NumPy: vectores y matrices |
| Clase 4 | Control de flujo: `if/elif/else`, `for`, `while`; definición de funciones |

---

## Requisitos

- Python 3.12
- Las dependencias están en `requirements.txt`. Las principales son:

| Librería | Versión | Uso |
|----------|---------|-----|
| `numpy` | 2.4.3 | Vectores y matrices |
| `pandas` | 3.0.1 | Análisis de datos tabulares |
| `matplotlib` | 3.10.8 | Visualización |
| `seaborn` | 0.13.2 | Visualización estadística |
| `jupyterlab` | 4.5.6 | Entorno de notebooks |

---

## Cómo empezar

### 1. Clonar el repositorio

```bash
git clone <url-del-repo>
cd taller-tgad-fce
```

### 2. Crear y activar el entorno virtual

```bash
python3 -m venv .venv
source .venv/bin/activate       # Linux / macOS
.venv\Scripts\activate          # Windows
```

### 3. Instalar dependencias

```bash
pip install -r requirements.txt
```

### 4. Abrir JupyterLab

```bash
jupyter lab
```

O bien, abrí los notebooks directamente desde **VS Code** con la extensión de Jupyter.

---

## Cómo usar los notebooks

Cada notebook de clase está pensado para ejecutarse de arriba hacia abajo, celda por celda. Las celdas de texto (Markdown) explican el concepto; las celdas de código muestran ejemplos que podés modificar y ejecutar.

Los notebooks de ejercicios en `ejercicios/` tienen el enunciado y la solución. Se recomienda intentar resolver cada ejercicio antes de mirar la solución.

---

## Licencia

Ver [LICENSE](LICENSE).

Prueba
