import json

path = r"c:\Users\Alexander\Proyectos\educacion\datos\taller-tgad-fce\sesiones\segundo-parcial\u2\clase11\practica\U2_Clase_11_Actividad_11_de_clase.ipynb"

with open(path, "r", encoding="utf-8") as f:
    nb = json.load(f)

# Mapeo por CONTENIDO de la celda (no por ID)
soluciones = {
    "# A\n": [
        "promedio = df[\"Precio\"].mean()\n",
        "print(f\"Cotización promedio del Merval: ${promedio:,.2f}\")"
    ],
    "# B\n": [
        "p50 = df[\"Precio\"].quantile(0.50)\n",
        "idx = (df[\"Precio\"] - p50).abs().idxmin()\n",
        "print(f\"P50 = ${p50:,.2f}\")\n",
        "print(f\"Dia mas cercano: {df.loc[idx, 'Fecha'].date()}  ->  ${df.loc[idx, 'Precio']:,.2f}\")"
    ],
    "# C\n": [
        "p75 = df[\"Precio\"].quantile(0.75)\n",
        "idx = (df[\"Precio\"] - p75).abs().idxmin()\n",
        "print(f\"P75 = ${p75:,.2f}\")\n",
        "print(f\"Dia mas cercano: {df.loc[idx, 'Fecha'].date()}  ->  ${df.loc[idx, 'Precio']:,.2f}\")"
    ],
    "# D\n": [
        "q3 = df[\"Precio\"].quantile(0.75)\n",
        "top25 = df[df[\"Precio\"] >= q3]\n",
        "idx_min = top25[\"Precio\"].idxmin()\n",
        "print(f\"Q3 = ${q3:,.2f}  (umbral del 25% superior)\")\n",
        "print(f\"Minimo del 25% superior: ${top25.loc[idx_min, 'Precio']:,.2f}\")\n",
        "print(f\"Fecha: {top25.loc[idx_min, 'Fecha'].date()}\")"
    ],
    "# E": [
        "q1 = df[\"Precio\"].quantile(0.25)\n",
        "bot25 = df[df[\"Precio\"] <= q1]\n",
        "idx_max = bot25[\"Precio\"].idxmax()\n",
        "print(f\"Q1 = ${q1:,.2f}  (umbral del 25% inferior)\")\n",
        "print(f\"Maximo del 25% inferior: ${bot25.loc[idx_max, 'Precio']:,.2f}\")\n",
        "print(f\"Fecha: {bot25.loc[idx_max, 'Fecha'].date()}\")"
    ],
    "# F": [
        "print(f\"Las cotizaciones se encuentran entre ${df['Precio'].min():,.2f} y ${df['Precio'].max():,.2f}\")"
    ],
    "# G": [
        "q1 = df[\"Precio\"].quantile(0.25)\n",
        "q3 = df[\"Precio\"].quantile(0.75)\n",
        "rango_iqr = df[(df[\"Precio\"] >= q1) & (df[\"Precio\"] <= q3)]\n",
        "print(\"El 50% central se concentra entre:\")\n",
        "print(f\"  Desde: {rango_iqr['Fecha'].min().date()}  (Q1 = ${q1:,.2f})\")\n",
        "print(f\"  Hasta: {rango_iqr['Fecha'].max().date()}  (Q3 = ${q3:,.2f})\")\n",
        "print(f\"  IQR   = ${q3 - q1:,.2f}\")\n",
        "print(f\"  Valor acumulado: ${rango_iqr['Precio'].sum():,.2f}\")"
    ],
    "# H": [
        "print(f\"Varianza: {df['Precio'].var():,.2f}\")"
    ],
}

j_cells_found = 0
modificadas = 0

for cell in nb["cells"]:
    if cell["cell_type"] != "code":
        continue
    src = "".join(cell["source"])

    if src in soluciones:
        cell["source"] = soluciones[src]
        modificadas += 1
        print(f"  OK '{src.strip()}' actualizada")

    elif src == "# J":
        j_cells_found += 1
        if j_cells_found == 1:
            cell["source"] = [
                "print(f\"Desvio estandar: ${df['Precio'].std():,.2f}\")"
            ]
            modificadas += 1
            print("  OK inciso I (desvio estandar) actualizada")
        elif j_cells_found == 2:
            cell["source"] = [
                "from scipy import stats\n",
                "t_stat, p_valor = stats.ttest_1samp(df[\"Precio\"].dropna(), popmean=2_500_000, alternative='less')\n",
                "alpha = 0.05\n",
                "print(\"H0: media >= 2500000   |   H1: media < 2500000\")\n",
                "print(f\"Estadistico t : {t_stat:.4f}\")\n",
                "print(f\"p-valor       : {p_valor:.4f}\")\n",
                "print(f\"alfa          : {alpha}\")\n",
                "print()\n",
                "if p_valor < alpha:\n",
                "    print(\"RECHAZAMOS H0: hay evidencia suficiente con 95% de confianza\")\n",
                "else:\n",
                "    print(\"NO rechazamos H0: no hay evidencia suficiente\")"
            ]
            modificadas += 1
            print("  OK inciso J (test hipotesis) actualizada")

if modificadas == 0:
    print("\nDEBUG - Contenido actual de celdas codigo:")
    for cell in nb["cells"]:
        if cell["cell_type"] == "code":
            src = "".join(cell["source"])
            print(f"  [{repr(src)}]")

with open(path, "w", encoding="utf-8") as f:
    json.dump(nb, f, ensure_ascii=False, indent=1)

print(f"\nListo: {modificadas} celdas modificadas.")


