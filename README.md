# Taller de Programacion para el Analisis de Datos (TPAD)

Material de clases y ejercicios del Taller de Programacion para el Analisis de Datos (TPAD) de la [Tecnicatura en Gestion y Analisis de Datos (TGAD)](https://www.econ.uba.ar/) - Facultad de Ciencias Economicas, UBA.

## Alcance del repositorio

Este repositorio contiene el material del primer parcial, organizado por unidades, clases, practica y teoria.

Estado actual del contenido (relevado en abril de 2026):

- 28 notebooks (`.ipynb`)
- 3 scripts Python (`.py`)
- 4 datasets CSV (`.csv`)
- PDFs de teoria y actividades por clase
- 6 libros/apuntes en `fuentes/`

## Estructura actual

```text
taller-tgad-fce/
├── fuentes/
│   └── *.pdf
├── sesiones/
│   └── primer-parcial/
│       ├── ejercicios/
│       │   └── 1.-ejercicios_resueltos_tipo_de_datos_basicos_1.ipynb
│       ├── parcial/
│       │   └── tema_B_alexander_ballera_919064.ipynb
│       ├── u1/
│       │   ├── clase1/
│       │   ├── clase2/
│       │   │   ├── teoria/
│       │   │   └── practica/
│       │   ├── clase3/
│       │   │   ├── teorica/
│       │   │   └── practica/
│       │   ├── clase4/
│       │   │   ├── teorica/
│       │   │   └── practica/
│       │   └── clase5/
│       │       ├── teorica/
│       │       └── practica/
│       └── u2/
│           ├── clase6/
│           │   ├── teorica/
│           │   └── practica/
│           ├── clase7/
│           │   ├── teorica/   (notebooks, CSV y scripts Selenium)
│           │   └── practica/
│           ├── clase8/
│           │   ├── teorica/
│           │   └── practica/
│           ├── clase9/
│           │   ├── teorica/   (notebooks y CSV)
│           │   └── practica/
│           └── clase10/
│               └── TPAD_Práctica_U2_1ra_parte.ipynb
├── requirements.txt
├── README.md
└── LICENSE
```

## Contenidos por unidad

### U1 (clases 1 a 5)

- Introduccion a programacion, Colab y VS Code.
- Tipos de datos y estructuras basicas.
- Diccionarios y tipos de objetos.
- Sentencias de control y funciones.
- Practica integradora y repaso.

### U2 (clases 6 a 10)

- Obtencion de datos y perfiles de datos.
- Web scraping basico.
- Automatizacion con Selenium (scripts de apoyo en clase 7).
- Analisis y manipulacion de datos con Pandas.
- Practicas por clase y actividad en clase 10.

## Requisitos

- Python 3.12 recomendado.
- Dependencias definidas en `requirements.txt`.

Librerias principales utilizadas en el material:

- `numpy`
- `pandas`
- `matplotlib`
- `seaborn`
- `jupyterlab`
- `beautifulsoup4`
- `selenium`
- `webdriver-manager`

## Puesta en marcha

1. Clonar el repositorio:

```bash
git clone <url-del-repo>
cd taller-tgad-fce
```

2. Crear y activar un entorno virtual:

```bash
python3 -m venv .venv
source .venv/bin/activate      # Linux/macOS
.venv\Scripts\activate         # Windows (PowerShell/CMD)
```

3. Instalar dependencias:

```bash
pip install -r requirements.txt
```

4. Abrir notebooks:

```bash
jupyter lab
```

Tambien puede abrir los notebooks con VS Code y la extension de Jupyter.

## Uso sugerido del material

- Seguir cada notebook en orden, de arriba hacia abajo.
- Resolver primero las actividades de practica antes de revisar soluciones.
- En U2 clase 7, ejecutar Selenium con navegador y driver compatibles.

## Licencia

Ver [LICENSE](LICENSE).