## **6.2 Guía Teórica de Equidad: Conceptos, Ejemplos y Costos de Negocio**

Para que un modelo de Machine Learning sea completamente justo y cumpla con las normativas legales de riesgos, cada una de estas métricas evalúa una forma diferente de "justicia" (Fairness). A continuación, se detalla el desglose teórico de cada indicador:

---

### **1. Equal Opportunity Ratio (Métrica de Igualdad de Oportunidades)**
* **Concepto:** Mide la proporción de **Verdaderos Positivos (TPR)** entre el grupo protegido y el privilegiado. Evalúa si el modelo es igual de eficiente para identificar a los **buenos pagadores** en ambos grupos. Busca que las personas que poseen la característica deseada (ser solventes) tengan la misma probabilidad de obtener el beneficio, sin importar su género.
* **Ejemplo Práctico:** Supongamos que se presentan 100 hombres y 100 mujeres que **sí van a pagar el crédito** si se les otorga (perfiles solventes). Si el modelo le aprueba el crédito a 90 hombres (TPR = 90%) pero solo a 65 mujeres (TPR = 65%), el ratio es $65 / 90 = 0.72$ (menor al límite de 0.8). Existe una discriminación algorítmica.
* **Riesgo o Costo Asociado (Costo de Oportunidad):** Al rechazar erróneamente a mujeres que sí tenían capacidad de pago (Falsos Negativos), el banco pierde clientes solventes. El costo principal es el **lucro cesante** (los intereses y comisiones que esas mujeres habrían pagado limpiamente) y un alto riesgo de **sanciones legales** por discriminación de género directa en productos financieros.

---

### **2. Predictive Parity Ratio (Paridad de Valor Predictivo Positivo)**
* **Concepto:** Mide la proporción de **Valor Predictivo Positivo (PPV) / Precisión**. Evalúa si una "predicción positiva" (aprobar el crédito) tiene el mismo significado o el mismo nivel de confianza para ambos grupos.
* **Ejemplo Práctico:** El modelo emite 100 aprobaciones para hombres y 100 para mujeres. Si en el grupo de hombres aprueba a 80 que resultan pagar bien (PPV = 80%) y en el de mujeres aprueba a 81 que también pagan bien (PPV = 81%), el ratio es $81 / 80 = 1.01$. Como se encuentra en la zona verde, el modelo genera confianza equitativa.
* **Riesgo o Costo Asociado (Confianza y Riesgo de Default):** Si esta métrica fallara (por ejemplo, si el PPV de las mujeres fuera significativamente más bajo), significaría que las aprobaciones emitidas a mujeres no son de fiar. El banco terminaría otorgando préstamos a perfiles que se cree que son buenos pero resultan ser malos, lo que elevaría la tasa de morosidad (Default) y generaría **pérdidas de capital directo**.

---

### **3. Predictive Equality Ratio (Métrica de Igualdad Predictiva)**
* **Concepto:** Mide la proporción de **Falsos Positivos (FPR)**. Evalúa si el algoritmo se equivoca al otorgar créditos a **malos pagadores** con la misma frecuencia en ambos grupos.
* **Ejemplo Práctico:** Imaginemos 100 hombres y 100 mujeres que **son insolventes (no van a pagar)**. Si el modelo se equivoca y le otorga el crédito a 20 hombres insolventes (FPR = 20%) pero solo a 10 mujeres insolventes (FPR = 10%), el ratio es $10 / 20 = 0.50$. El modelo es más "laxo" o permisivo con los hombres que representan un riesgo financiero.
* **Riesgo o Costo Asociado (Pérdida por Morosidad):** Un FPR alto en un grupo significa que estás inundando la cartera activa con clientes que van a caer en default. El costo asociado es la **pérdida directa del dinero prestado (capital hundido)**, además de los altos costos operativos derivados de los procesos de cobranza extrajudicial y judicial.

---

### **4. Accuracy Equality Ratio (Métrica de Igualdad de Exactitud)**
* **Concepto:** Mide la proporción de la **Exactitud Global (ACC)**. Evalúa si el modelo acierta en general (tanto al aprobar a los buenos como al rechazar a los malos) en la misma proporción en ambos grupos.
* **Ejemplo Práctico:** De 100 casos analizados de hombres, el modelo clasifica correctamente a 85 (ya sea aprobando al bueno o rechazando al malo, ACC = 85%). En 100 casos de mujeres clasifica correctamente a 84 (ACC = 84%). El ratio es $84 / 85 = 0.98$, lo que se considera completamente equitativo.
* **Riesgo o Costo Asociado (Ineficiencia Operativa):** Si la exactitud fuera muy dispar para un grupo, el modelo se volvería inútil para ese sector de la población. El costo asociado implica que el banco tendría que gastar recursos adicionales en **revisiones manuales por parte de analistas humanos**, ralentizando la colocación de créditos y elevando los costos de estructura.

---

### **5. Statistical Parity Ratio (Métrica de Paridad Estadística)**
* **Concepto:** Mide la **Tasa de Selección (STP)**. A esta métrica no le importa si el perfil es bueno o malo; simplemente exige que el porcentaje total de aprobaciones sea similar en ambos grupos, midiendo la igualdad de resultados de manera ciega al mérito individual.
* **Ejemplo Práctico:** Al banco ingresan solicitudes de 1000 hombres y 1000 mujeres. Si el algoritmo le aprueba el crédito a 500 hombres (Tasa = 50%) pero solo a 250 mujeres (Tasa = 25%), el ratio es $25 / 50 = 0.50$. Existe una disparidad estadística crítica que genera un impacto adverso.
* **Riesgo o Costo Asociado (Exclusión de Mercado y Demandas Legales):** Este es el indicador más vigilado por los reguladores gubernamentales y de cumplimiento normativo (Compliance). El costo asociado es el riesgo inminente de **demandas multimillonarias por discriminación sistemática institucional**, revocación de licencias para operar y una crisis de relaciones públicas que espantaría a los inversores y clientes.