## **7. Guía Completa de la Matriz de Confusión: Fórmulas, Conceptos y Costo/Beneficio**

La **Matriz de Confusión** es una herramienta bidimensional que permite evaluar el desempeño de un modelo de clasificación binaria. Contrasta las predicciones del sistema (lo que el modelo cree que pasará) con los valores reales observados (lo que realmente pasó).

### **7.1 Estructura de la Matriz de Confusión**

| | **Observado: POSITIVO (1)** | **Observado: NEGATIVO (0)** |
|---|---|---|
| **Predicción: POSITIVO (1)** | **Verdadero Positivo (TP)** <br> *(True Positive)* | **Falso Positivo (FP)** <br> *(False Positive - Error Tipo I)* |
| **Predicción: NEGATIVO (0)** | **Falso Negativo (FN)** <br> *(False Negative - Error Tipo II)* | **Verdadero Negativo (TN)** <br> *(True Negative)* |

---

### **7.2 Métricas Fundamentales y Fórmulas**

A partir de estos cuatro cuadrantes, se calculan los indicadores clave para evaluar la rentabilidad o eficacia de un modelo:

#### **1. Exactitud (Accuracy - ACC)**
* **Fórmula:** $$\text{Accuracy} = \frac{TP + TN}{TP + TN + FP + FN}$$
* **Definición:** Es el porcentaje total de predicciones correctas hechas por el modelo sobre el total de casos evaluados.

#### **2. Precisión (Precision o Valor Predictivo Positivo - PPV)**
* **Fórmula:** $$\text{Precision} = \frac{TP}{TP + FP}$$
* **Definición:** De todas las veces que el modelo predijo "Positivo", mide qué porcentaje fue realmente correcto. Evalúa la calidad de la alarma.

#### **3. Sensibilidad (Recall, True Positive Rate o Exhaustividad - TPR)**
* **Fórmula:** $$\text{Recall / TPR} = \frac{TP}{TP + FN}$$
* **Definición:** De todos los casos que eran "Positivos" en la realidad, mide cuántos fue capaz de capturar o detectar el modelo. Evalúa la cobertura del modelo.

#### **4. Tasa de Falsos Positivos (False Positive Rate - FPR)**
* **Fórmula:** $$\text{FPR} = \frac{FP}{FP + TN}$$
* **Definición:** De todos los casos que eran "Negativos" en la realidad, mide qué porcentaje clasificó el modelo erróneamente como "Positivos".

---

## **7.3 Escenarios Prácticos de Costo y Beneficio**

El análisis de la matriz de confusión cobra verdadero valor cuando se le asigna un impacto económico o de vida a cada cuadrante. A continuación, se analizan dos contextos críticos:

### **Caso A: Ámbito Financiero (Otorgamiento de Créditos)**
* **Definición de Clases:**
    * **Clase 1 (Positivo):** Cliente Solvente / Buen riesgo (se aprueba el préstamo).
    * **Clase 0 (Negativo):** Cliente Insolvente / Mal riesgo (se rechaza el préstamo).



#### **Análisis de Costos y Beneficios Financieros:**
* **Verdadero Positivo (TP):** El modelo predice que es solvente y lo es. 
  * *Beneficio:* Alta rentabilidad. El banco cobra los intereses y comisiones pactadas en su totalidad de manera limpia.
* **Verdadero Negativo (TN):** El modelo predice que es insolvente y lo es (se rechaza el crédito).
  * *Beneficio/Ahorro:* Prevención de pérdidas. Se evita colocar capital en un cliente que no iba a devolver los fondos.
* **Falso Positivo (FP - Error Tipo I):** El modelo predice que es solvente pero en realidad es insolvente (se aprueba por error).
  * *Costo Financiero Alto:* **Pérdida directa de capital (Default).** El banco pierde el dinero prestado que no podrá recuperar. Es el error más costoso en finanzas.
* **Falso Negativo (FN - Error Tipo II):** El modelo predice que es insolvente pero en realidad era solvente (se rechaza por error).
  * *Costo Financiero Moderado:* **Costo de oportunidad (Lucro cesante).** El banco pierde un cliente sano y los intereses que este habría generado. El cliente se va a la competencia.

> **Estrategia de Negocio:** En finanzas, el objetivo suele ser maximizar la **Precisión (minimizar FP)** para evitar pérdidas catastróficas de capital por clientes morosos, o balancear con la **Sensibilidad** si el mercado es muy competitivo y se necesita colocar capital rápido.

---

### **Caso B: Ámbito de la Salud (Detección de una Enfermedad Grave, ej: Cáncer)**
* **Definición de Clases:**
    * **Clase 1 (Positivo):** Paciente enfermo (requiere tratamiento urgente).
    * **Clase 0 (Negativo):** Paciente sano.



#### **Análisis de Costos y Beneficios en Salud:**
* **Verdadero Positivo (TP):** El modelo detecta la enfermedad y el paciente está enfermo.
  * *Beneficio Vital:* Se inicia un tratamiento temprano, maximizando las probabilidades de salvar la vida del paciente y reduciendo costos de tratamientos paliativos futuros.
* **Verdadero Negativo (TN):** El modelo dice que está sano y lo está.
  * *Beneficio:* Paz mental para el paciente y optimización de recursos hospitalarios al no requerir más seguimiento.
* **Falso Positivo (FP - Error Tipo I):** El modelo dice que está enfermo pero está sano.
  * *Costo Moderado:* Estrés psicológico grave para el paciente y costos adicionales en estudios médicos confirmatorios (biopsias, tomografías) innecesarios. El error se subsana en la siguiente etapa médica.
* **Falso Negativo (FN - Error Tipo II):** El modelo dice que está sano pero en realidad está enfermo.
  * *Costo Crítico / Catastrófico:* **Riesgo de muerte o agravamiento irreversible.** El paciente se va a su casa creyendo que está sano mientras la enfermedad avanza sin tratamiento. Es el error más peligroso y costoso en medicina.

> **Estrategia de Salud:** En medicina, el objetivo principal es maximizar la **Sensibilidad / Recall (minimizar FN)**. Es preferible asumir el costo de algunos Falsos Positivos (hacer exámenes extra a personas sanas) que cometer un Falso Negativo (dejar ir a un enfermo terminal sin diagnóstico).