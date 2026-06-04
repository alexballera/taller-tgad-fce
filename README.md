# Taller de Programación para el Análisis de Datos (TPAD)

Material de clases y ejercicios del **Taller de Programación para el Análisis de Datos (TPAD)** de la [Tecnicatura en Gestión y Análisis de Datos (TGAD)](https://www.econ.uba.ar/) - Facultad de Ciencias Económicas, UBA.

## Descripción

Este repositorio contiene material educativo estructurado en notebooks Jupyter, scripts Python y datasets para el aprendizaje progresivo de programación, manipulación de datos y análisis exploratorio. Incluye teoría, ejercicios prácticos y evaluaciones de dos unidades de estudio.

---

## Requisitos

- **Python**: 3.12 recomendado
- **pip-tools**: Para gestionar dependencias
- **Entorno virtual**: Recomendado para aislamiento de dependencias

---

## Instalación del entorno

Ejecuta los siguientes comandos en orden:

```bash
python -m venv .venv
source .venv/Scripts/activate
pip install pip-tools
pip-compile
```

**Explicación de cada paso:**

1. `python -m venv .venv` — Crea un entorno virtual aislado en la carpeta `.venv`
2. `source .venv/Scripts/activate` — Activa el entorno (usa `.venv\Scripts\activate` en Windows CMD/PowerShell)
3. `pip install pip-tools` — Instala la herramienta de gestión de dependencias
4. `pip-compile` — Compila `requirements.in` a `requirements.txt` resolviendo todas las dependencias

Después, instala las dependencias compiladas:

```bash
pip install -r requirements.txt
```

---

## Gestión de dependencias con pip-tools

Este proyecto utiliza **pip-tools** para garantizar reproducibilidad y control preciso de versiones.

### Archivos clave

- **`requirements.in`** — Archivo fuente: lista solo las dependencias directas que necesita el proyecto
- **`requirements.txt`** — Archivo generado automáticamente: contiene todas las dependencias (directas e indirectas) con versiones pinned

### Agregar nuevas dependencias

```bash
echo "nombre_paquete" >> requirements.in
python -m piptools compile
pip install -r requirements.txt
```

Por ejemplo, para agregar `matplotlib`:

```bash
echo "matplotlib" >> requirements.in
python -m piptools compile
pip install -r requirements.txt
```

### Actualizar dependencias

Para actualizar todas las dependencias a sus versiones más recientes compatibles:

```bash
python -m piptools compile --upgrade
pip install -r requirements.txt
```

### Regla fundamental

⚠️ **NO editar manualmente `requirements.txt`**

Siempre modificar `requirements.in` y luego compilar con `python -m piptools compile`.

---

## Ejecución del proyecto

El proyecto consiste en notebooks Jupyter interactivos. Para visualizar y ejecutar:

### Con Jupyter Lab

```bash
jupyter lab
```

Abre una interfaz web en `http://localhost:8888` donde puedes navegar y ejecutar los notebooks.

### Con VS Code

Abre VS Code y utiliza la extensión oficial de Jupyter para VS Code. Selecciona el kernel `.venv` al abrir un notebook (`.ipynb`).

---

## Estructura del proyecto

```
taller-tgad-fce/
├── fuentes/                        # PDFs y materiales de referencia
├── docs/                           # Guías de entorno y configuración
├── sesiones/
│   ├── primer-parcial/
│   │   ├── parcial/                # Evaluaciones del primer parcial
│   │   ├── practica/               # Ejercicios resueltos tipo datos básicos
│   │   ├── u1/                     # Unidad 1: Fundamentos de Python (clases 0–5)
│   │   │   ├── clase1/             # Introducción a Colab y VS Code
│   │   │   ├── clase2/             # Tipos de datos primitivos y estructuras
│   │   │   ├── clase3/             # Diccionarios, fechas y NumPy
│   │   │   ├── clase4/             # Control de flujo y funciones
│   │   │   └── clase5/             # POO y práctica integradora
│   │   └── u2/                     # Unidad 2: Adquisición y análisis (clases 6–10)
│   │       ├── clase6/             # Obtención de datos y Profiling Report
│   │       ├── clase7/             # Web scraping (requests, BeautifulSoup, Selenium)
│   │       ├── clase8/             # DataFrames y manipulación con pandas
│   │       ├── clase9/             # Muestreo aleatorio y estratificado
│   │       └── clase10/            # Práctica integradora U2
│   └── segundo-parcial/
│       ├── u2/                     # Unidad 2 cont.: Estadística, viz y gobernanza (clases 11–18)
│       │   ├── clase11/            # Estadística descriptiva + MySQL/Northwind
│       │   ├── clase12/            # Práctica estadística (correlaciones, yfinance)
│       │   ├── clase13/            # Visualización: matplotlib, seaborn, plotly
│       │   ├── clase14/            # Práctica visualización: funciones gráficas dinámicas
│       │   ├── clase15/            # Visualización avanzada: KDE, mapas, animaciones
│       │   ├── clase16/            # Práctica integrada: dashboards y reportes
│       │   ├── clase17/            # SHAP Values y explicabilidad de modelos (XGBoost)
│       │   └── clase18/            # Privacidad diferencial (anonymizedf, opendp)
│       └── u3/                     # Unidad 3: Machine Learning responsable (clases 19–21)
│           ├── clase19/            # Sesgo, varianza y equidad
│           ├── clase20/            # Proyectos integradores: clasificación y regresión
│           └── clase21/            # Ejercicio integrador final: Heart Disease Dataset
├── requirements.in                 # Dependencias directas (fuente)
├── requirements.txt                # Dependencias compiladas (generado)
├── README.md                       # Este archivo
└── LICENSE                         # Licencia del proyecto
```

Cada carpeta de clase contiene:
- **`teorica/`** — Notebooks con conceptos y ejemplos
- **`practica/`** — Notebooks con ejercicios y actividades
- Archivos de datos (`.csv`) cuando aplica
- Scripts auxiliares (`.py`) si son necesarios

---

## Contenidos por unidad

### Unidad 1 — Fundamentos de Python (Clases 0 a 5)

Introducción a la programación con Python:

- Entornos de ejecución: Google Colab y VS Code
- Tipos de datos primitivos: `int`, `float`, `str`, `bool`; f-strings; conversiones de tipo
- Estructuras de datos: `list`, `tuple`, `dict`; indexación, slicing, métodos
- Fechas (`datetime`) y arreglos numéricos con NumPy
- Control de flujo: `if/elif/else`, `for`, `while`; definición de funciones
- Programación Orientada a Objetos: clases, objetos, `__init__`, atributos y métodos

### Unidad 2 — Adquisición y análisis de datos — Primera parte (Clases 6 a 10)

Obtención, procesamiento y análisis exploratorio de datos:

- Lectura de archivos (CSV, ZIP) y descarga desde web con `requests`
- Descarga de datasets desde Kaggle con `kagglehub`
- Análisis exploratorio con Profiling Reports (`ydata-profiling`)
- Web scraping: HTTP, `BeautifulSoup`, automatización con `Selenium`
- Creación y manipulación de DataFrames con `pandas`
- Muestreo aleatorio y estratificado con control de aleatoriedad

### Unidad 2 — Estadística, visualización y uso responsable (Clases 11 a 18)

Análisis estadístico, visualización avanzada y gobernanza de datos:

- Estadística descriptiva: media, mediana, moda, percentiles, varianza, asimetría, curtosis (`scipy.stats`, `sympy`)
- Conexión a bases de datos relacionales: MySQL + Northwind (`mysql-connector-python`)
- Correlaciones (Pearson, Spearman) y series financieras (`yfinance`)
- Visualización clásica (`matplotlib`), estadística (`seaborn`) e interactiva (`plotly`)
- Visualización avanzada: KDE, ECDF, QQ-plots, mapas geoespaciales (`geopandas`), animaciones
- Indicadores de desempeño y dashboards con Plotly
- Explicabilidad de modelos con SHAP Values (`shap`) y clasificación con XGBoost
- Balanceo de clases con SMOTE (`imbalanced-learn`)
- Privacidad diferencial: anonimización (`anonymizedf`) y mecanismo de Laplace (`opendp`)

### Unidad 3 — Machine Learning responsable (Clases 19 a 21)

Modelado supervisado con enfoque en equidad, explicabilidad y uso ético:

- Análisis de sesgo y varianza: overfitting, underfitting, curvas de aprendizaje
- Métricas de evaluación: accuracy, precision, recall, F1, AUC, curva ROC
- Modelos supervisados: Regresión Logística, Árbol de Decisión, Random Forest (`scikit-learn`)
- Equidad algorítmica: tasas de error diferenciadas por grupo sensible (género, zona, clase)
- SHAP Values para explicabilidad individual y global
- Proyectos integradores: clasificación de riesgo crediticio y regresión de precios inmobiliarios
- Flujo completo de modelado responsable: EDA → entrenamiento → diagnóstico → equidad

---

## Uso sugerido del material

1. **Orden secuencial** — Seguir cada notebook de arriba hacia abajo
2. **Práctica primero** — Resolver ejercicios antes de revisar soluciones
3. **Entorno local** — Ejecutar localmente con `.venv` para máxima compatibilidad
4. **Clase 7 (Selenium)** — Requiere navegador compatible y webdriver actualizado
5. **Referencia** — Consultar PDFs en `fuentes/` para profundizar conceptos

### Alternativa: Google Colab

Para usar Google Colab sin configuración local, consulta la guía en:
- [U1-Clase-1-1-Introduccion-a-Google-Colaboratory.pdf](sesiones/primer-parcial/u1/clase1/U1-Clase-1-1-Introduccion-a-Google-Colaboratory.pdf)

---

## Buenas prácticas

- **Siempre usar entorno virtual** — Evita conflictos de versiones a nivel del sistema
- **Reproducibilidad** — El archivo `requirements.txt` garantiza que cualquier otro desarrollador obtenga exactamente el mismo entorno
- **Separación de dependencias** — `requirements.in` lista solo lo que necesita tu código; `requirements.txt` incluye el árbol completo de dependencias
- **Mantener .venv en .gitignore** — El entorno virtual no debe versionarse; se regenera fácilmente con `pip install -r requirements.txt`

---

## Dependencias principales

El archivo `requirements.in` lista las dependencias directas del proyecto, organizadas por temática:

| Paquete | Uso en el curso |
|---------|------------------|
| `pandas` | Manipulación y análisis de DataFrames (U2 en adelante) |
| `numpy` | Arreglos numéricos y operaciones vectoriales (U1 en adelante) |
| `scipy` | Estadística descriptiva avanzada: correlaciones, distribuciones (Clase 11) |
| `sympy` | Cálculo simbólico para estadística (Clase 11) |
| `kagglehub` | Descarga de datasets desde Kaggle (Clase 6 en adelante) |
| `ydata-profiling` | Profiling Reports automáticos (Clase 6) |
| `requests` | Solicitudes HTTP y descarga de archivos (Clase 7) |
| `beautifulsoup4` | Web scraping y parsing HTML (Clase 7) |
| `selenium` + `webdriver-manager` | Scraping dinámico con navegador (Clase 7) |
| `matplotlib` | Visualización clásica: barras, líneas, histogramas (Clase 13 en adelante) |
| `seaborn` | Visualización estadística (Clase 13 en adelante) |
| `plotly` | Visualización interactiva y dashboards (Clase 13 en adelante) |
| `kaleido` | Exportación de gráficos Plotly a imagen estática |
| `mysql-connector-python` | Conexión a bases de datos MySQL (Clase 11) |
| `sqlalchemy` | ORM y conexiones SQL avanzadas |
| `yfinance` | Series financieras históricas desde YahooFinance (Clases 12, 15) |
| `scikit-learn` | Machine Learning supervisado: regresión, clasificación, métricas (Clase 17 en adelante) |
| `xgboost` | Clasificación de alta performance con Gradient Boosting (Clases 17, 19, 21) |
| `imbalanced-learn` | Balanceo de clases con SMOTE (Clase 17) |
| `shap` | Explicabilidad de modelos: SHAP Values (Clases 17, 20, 21) |
| `opendp` | Privacidad diferencial: mecanismo de Laplace (Clase 18) |
| `anonymizedf` | Anonimización de datos personales (Clase 18) |
| `geopandas` | Visualización geoespacial y mapas (Clase 15) |
| `geodatasets` | Datasets geográficos de referencia (Clase 15) |
| `nbformat` | Manipulación programática de archivos `.ipynb` |
| `ipywidgets` | Widgets interactivos en notebooks |
| `python-docx` | Lectura/escritura de archivos Word |
| `camelot-py` | Extracción de tablas desde PDFs |
| `pydrive2` | Integración con Google Drive |

> **Nota sobre dependencias del sistema**: `camelot-py` requiere [Ghostscript](https://www.ghostscript.com/) instalado. `selenium` y `webdriver-manager` requieren Chrome o Firefox. `mysql-connector-python` requiere acceso a un servidor MySQL externo.
- `tzdata==2026.2`

Si necesitas confirmar versiones locales, activa el entorno y ejecuta:

```bash
source .venv/Scripts/activate
pip freeze | grep -E "pandas|numpy|mysql-connector-python"
```

## Solución de problemas (troubleshooting)

- Error: `ModuleNotFoundError: No module named 'mysql'` o `No module named 'pandas'`:
	1. Asegurate de activar el entorno del proyecto antes de ejecutar notebooks:

		 ```bash
		 python -m venv .venv
		 source .venv/Scripts/activate    # PowerShell/CMD: .venv\Scripts\Activate.ps1 o .venv\Scripts\activate
		 pip install -r requirements.txt
		 ```

	2. Si al abrir el notebook en VS Code ves el error desde el kernel, seleccioná el kernel asociado a la carpeta `.venv` en la paleta de kernels de Jupyter (al abrir el `.ipynb`).

	3. Alternativa (desde el propio notebook): si el kernel no tiene un paquete, instalalo en el kernel y reiniciá la celda/kernel. Por ejemplo, en una celda de código:

		 ```python
		 !pip install mysql-connector-python pandas
		 ```

	4. Evitar instalaciones a nivel usuario: en Windows frecuentemente se instalan paquetes fuera del `.venv`. Siempre activar `.venv` antes de `pip install`.

- Error al conectar con MySQL:
	- Verificá que la base `northwind` está importada (archivo `northwind_mysql.sql`) y que MySQL está corriendo en `localhost`.
	- Revisá `CONN_PARAMS` en la notebook y actualizá `user` / `password` si corresponde.

## Recomendaciones finales

- Mantener `requirements.in` como la única fuente para agregar paquetes. Luego ejecutar `python -m piptools compile` para regenerar `requirements.txt`.
- Al actualizar paquetes globalmente usar:

```bash
python -m piptools compile --upgrade
pip install -r requirements.txt
```

- Si trabajás con notebooks en VS Code: después de instalar dependencias en el `.venv`, reiniciá el kernel y seleccioná el kernel correcto en la interfaz de notebooks.

## Licencia

Ver [LICENSE](LICENSE).