# Commercial Audit of Global Fashion Platform (SQL & Big Data)

## 📌 Project Overview
Комплексный бизнес-анализ и финансовый аудит международной e-commerce платформы. В рамках проекта обработан реальный массив данных объемом **6.4 млн транзакций**.

## 🛠 Tech Stack
* **Database:** PostgreSQL
* **Tool:** DBeaver
* **Ключевые SQL-навыки:** Многотабличные склейки `INNER JOIN`, мультивалютная конвертация через `CASE WHEN`, агрегация с фильтрацией `FILTER (WHERE...)`, группировка и фильтрация сложных когорт `GROUP BY` / `HAVING`, предобработка и очистка данных `LENGTH` / `TRIM`, усечение дат `DATE_TRUNC`.

## 📊 Business Insights & Audit Results

### Block 1. Financial Audit & Global GMV
* **Total Revenue (Общая выручка):** €544 810 208.99
* **Total Quantity (Продано товаров):** 7 060 071 шт.
* **Average Order Value (Средний чек):** €84.90
* *Вывод:* Полумиллиардный оборот с сильным для фэшн-индустрии **AOV**.

### Block 2. Category Management & Product Marginality
* **Top Categories by Revenue:** `Masculine - Suits and Blazers` (€37.62M) и `Feminine - Suits and Sets` (€37.26M) [1.1].
* **Top Category by Quantity:** `Feminine - Dresses and Jumpsuits` (346 761 шт. на €31.55M) [1.1].
* **Most Profitable Item:** `Product ID #17792` (средняя маржа €114.60/шт.).
  
<img width="1003" height="487" alt="category_management" src="https://github.com/user-attachments/assets/09e2accf-eb16-4f19-b240-352c9cae9af8" />

### Block 3. Geographical Expansion & Store Efficiency
* **Top Efficient City:** Лос-Анджелес, США (Показатель `revenue_per_employee` составил €5.3 млн на одного сотрудника).
* **Runner-up:** Шанхай, Китай (€5.1 млн на сотрудника).
* *Рекомендация:* Модель управления персоналом и логистикой из ЛА и Шанхая необходимо масштабировать на европейские филиалы (Берлин, Мадрид), чтобы поднять их удельную эффективность.

### Block 4. Customer Behavior & Whale-Segments
* Выявлен Топ-5 самых прибыльных профессиональных когорт среди покупателей с высокой частотой покупок (`HAVING COUNT(DISTINCT "Invoice ID") >= 5`). Ключевое ядро лояльной аудитории — женщины на руководящих должностях: `Conference centre manager`, `Proofreader` и `Theme park manager`.

### Block 5. Time Series & Calendar Seasonality
* **Peak Month:** Декабрь (€50.4 млн выручки в 2024 году) — исторический предновогодний максимум продаж платформы.
* **Lowest Month:** Февраль (падение до €8.6 млн в 2023 году и €10.0 млн в 2025 году) — стабильный сезонный провал в конце зимы.
* *Рекомендация:* В феврале необходимо внедрять агрессивные маркетинговые акции и закрытые распродажи для удержания кассовой стабильности торговых точек.
  
<img width="1002" height="517" alt="graph" src="https://github.com/user-attachments/assets/ac105b48-78e3-4b0d-b7de-22ec3198c537" />
