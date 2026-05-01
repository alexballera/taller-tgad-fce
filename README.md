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
├── fuentes/                    # Materiales de referencia (PDFs, apuntes)
├── sesiones/
│   └── primer-parcial/
│       ├── ejercicios/         # Ejercicios resueltos tipo datos básicos
│       ├── parcial/            # Evaluaciones del primer parcial
│       ├── u1/                 # Unidad 1: Introducción a programación (clases 1-5)
│       │   ├── clase1/         # Introducción a Colab y VS Code
│       │   ├── clase2/         # Tipos de datos y estructuras básicas
│       │   ├── clase3/         # Diccionarios y objetos
│       │   ├── clase4/         # Sentencias de control y funciones
│       │   └── clase5/         # Práctica integradora
│       └── u2/                 # Unidad 2: Datos y análisis (clases 6-10)
│           ├── clase6/         # Obtención de datos
│           ├── clase7/         # Web scraping y Selenium
│           ├── clase8/         # Estructuras de datos avanzadas
│           ├── clase9/         # Análisis con Pandas
│           ├── clase10/        # Práctica integradora
│           └── clase11/        # Base de datos SQL
├── requirements.in             # Dependencias directas (fuente)
├── requirements.txt            # Dependencias compiladas (generado)
├── README.md                   # Este archivo
└── LICENSE                     # Licencia del proyecto
```

Cada carpeta de clase contiene:
- **`teorica/`** — Notebooks con conceptos y ejemplos
- **`practica/`** — Notebooks con ejercicios y actividades
- Archivos de datos (`.csv`) cuando aplica
- Scripts auxiliares (`.py`) si son necesarios

---

## Contenidos por unidad

### Unidad 1 (clases 1 a 5)

Fundamentos de programación en Python:

- Introducción a entornos de ejecución (Colab, VS Code)
- Tipos de datos primitivos y estructuras básicas
- Diccionarios y estructuras de objetos
- Sentencias de control condicionales e iterativas
- Funciones y práctica integradora

### Unidad 2 (clases 6 a 11)

Adquisición, procesamiento y análisis de datos:

- Obtención de datos y perfiles exploratorios
- Web scraping con BeautifulSoup y Selenium
- Automatización con scripts Selenium
- Manipulación y análisis con Pandas (NumPy, filtrado, agregación)
- Conexión a bases de datos SQL (MySQL/Northwind)

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

## Cambios recientes (abril 2026)

- Se añadió `mysql-connector-python` a `requirements.in` y `requirements.txt` para soportar las notebooks que se conectan a MySQL (Northwind).
- Se verificó e instaló `pandas` y `numpy` en el kernel del notebook para evitar `ModuleNotFoundError` durante la ejecución.

## Dependencias principales actualmente en `requirements.txt`

- `mysql-connector-python==9.7.0`
- `pandas==3.0.2`
- `numpy==2.4.4`
- `python-dateutil==2.9.0.post0`
- `six==1.17.0`
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