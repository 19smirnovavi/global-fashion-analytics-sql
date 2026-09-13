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
* *Вывод:* Компания оперирует оборотом более полумиллиарда евро, удерживая сильный для фэшн-индустрии показатель **AOV**.

### Block 2. Category Management & Product Marginality
* **Top Category by Revenue:** `Feminine` — `Dresses and Jumpsuits` (€31.5 млн).
* **Most Profitable Item:** `Product ID` #17792 (Истинная средняя маржа — €114.60 с одной штуки).
* *Результат:* В ходе аудита была обнаружена критическая ошибка отчётности (смешивание локальных валют в столбце `Unit Price` без конвертации). Применение корректного пересчета спасло маркетинговый бюджет от неэффективного вливания в низкомаржинальные позиции.
<img width="1003" height="487" alt="category_management" src="https://github.com/user-attachments/assets/09e2accf-eb16-4f19-b240-352c9cae9af8" />

### Block 3. Geographical Expansion & Store Efficiency
* **Top Efficient City:** Лос-Анджелес, США (Показатель `revenue_per_employee` составил €5.3 млн на одного сотрудника).
* **Runner-up:** Шанхай, Китай (€5.1 млн на сотрудника).
* *Рекомендация:* Модель управления персоналом и логистикой из ЛА и Шанхая необходимо масштабировать на европейские филиалы (Берлин, Мадрид), чтобы поднять их удельную эффективность.

### Block 4. Customer Behavior & Whale-Segments
* Выявлен Топ-5 самых прибыльных профессиональных когорт среди покупателей с высокой частотой покупок (`HAVING COUNT(DISTINCT "Invoice ID") >= 5`). Ключевое ядро лояльной аудитории — женщины на руководящих должностях: `Conference centre manager`, `Proofreader` и `Theme park manager`.

### Block 5. Time Series & Calendar Seasonality
* **Peak Month:** Декабрь (€45.2 млн выручки) — мощный предновогодний всплеск продаж.
* **Lowest Month:** Февраль (€8.6 млн выручки) — самый провальный месяц в году. 
* *Рекомендация:* В феврале необходимо внедрять агрессивные маркетинговые акции и закрытые распродажи для удержания кассовой стабильности торговых точек.
<img width="1002" height="517" alt="graph" src="https://github.com/user-attachments/assets/ac105b48-78e3-4b0d-b7de-22ec3198c537" />
