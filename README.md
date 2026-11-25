# Olist E-commerce Sales & Operations Analytics

Analiza działalności brazylijskiej platformy e-commerce **Olist** na rzeczywistych danych transakcyjnych (**09.2016 – 10.2018**), obejmująca cały proces od przygotowania danych po dashboard w Power BI. Projekt skupia się na sprzedaży, klientach, produktach i logistyce — ze względu na brak danych kosztowych nie ocenia rentowności ani zysku firmy. Surowe pliki CSV pochodzą z publicznego zbioru [Olist Brazilian E-Commerce Dataset (Kaggle)](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce) i są wykluczone z repozytorium (`.gitignore`).

## Technologie
- **ETL i walidacja:** Python (`pandas`, `SQLAlchemy`)
- **Baza danych i analiza:** Microsoft SQL Server (`T-SQL`)
- **Wizualizacja:** Power BI (`DAX`, `Power Query`)
- **Narzędzia:** VS Code, Git & GitHub

## Etapy projektu
- [x] **Etap 0 – ETL:** Automatyczny import surowych danych CSV do SQL Server oraz walidacja poprawności załadowania.
- [ ] **Etap 1 – Data Quality** *(w trakcie)*: Audyt duplikatów, braków danych, spójności relacji oraz poprawności dat.
- [ ] **Etap 2 – Sales Analysis:** Analiza skali sprzedaży, sezonowości, porównania rok do roku oraz struktury płatności.
- [ ] **Etap 3 – Customer Analysis:** Badanie powracalności klientów oraz analiza kohortowa.
- [ ] **Etap 4 – Product & Seller Performance:** Ranking kategorii i sprzedawców wraz z analizą koncentracji sprzedaży (Pareto).
- [ ] **Etap 5 – Logistics & Customer Experience:** Ocena terminowości dostaw i jej związku z ocenami klientów.
- [ ] **Etap 6 – Reporting:** Przygotowanie warstwy widoków analitycznych SQL i walidacja zgodności danych.
- [ ] **Etap 7 – Power BI:** Budowa modelu gwiazdy, miar DAX oraz interaktywnego dashboardu zarządczego.
- [ ] **Etap 8 – Business Insights:** Sformułowanie kluczowych wniosków i rekomendacji biznesowych.

## Dotychczasowe wnioski

### Etap 0 – ETL
- Wszystkie 9 tabel ze zbioru Kaggle zostało załadowanych do bazy ze **100% zgodnością** liczby wierszy i kolumn między plikami CSV a SQL Server.

### Etap 1 – Data Quality *(w trakcie)*
- **Klucze i ziarnistość:** Tabele główne (`orders`, `customers`, `products`, `sellers`) nie mają duplikatów. Tabele z wieloma rekordami na jedno zamówienie (`order_items`, `order_payments`, `order_reviews`) wymagają agregacji przed łączeniem, aby uniknąć przekłamań w metrykach (np. w AOV).
- **Braki i anomalie:** 6 z 9 tabel nie zawiera żadnych wartości `NULL`. W zamówieniach wykryto drobne niespójności (m.in. **8** doręczonych zamówień bez daty dostawy i **6** anulowanych z datą dostawy) — rekordy pozostawiono w bazie bez usuwania i będą filtrowane dopiero w metrykach logistycznych.
- **Kategorie produktów:** **610 produktów (1,85%)** nie ma przypisanej kategorii, a **2 kategorie** (13 produktów) nie mają angielskiego tłumaczenia — w analizach wymagają łączenia przez `LEFT JOIN` i oznaczenia braków jako `Unknown`.
- **Spójność relacji:** Pełna spójność kluczy obcych (0 osieroconych rekordów w badanych tabelach). Wykryto 775 zamówień bez przypisanych pozycji (w 99% `unavailable` i `canceled`, zero `delivered`) oraz 1 doręczone zamówienie z września 2016 r. bez rekordu płatności. W praktyce tabele można bezpiecznie łączyć bez ryzyka utraty danych o dostarczonej sprzedaży, ponieważ braki wynikają głównie z niezrealizowanych transakcji oraz pojedynczej luki w danych źródłowych z początku zbioru.


### Etap 2 – Wstępne wyniki sprzedaży *(rok referencyjny 2017)*
- **Sprzedaż i wolumen:** Wartość sprzedaży doręczonych produktów wyniosła **5 962 902,01 BRL** przy **45 101** wszystkich zamówieniach (**96,29%** skutecznych doręczeń).
- **Koszyk i dostawa:** Średnia wartość zamówienia (AOV) wyniosła **[wpisz nowy wynik] BRL**, a koszty transportu stanowiły **13,85%** wartości koszyka brutto.
- **Klienci i sezonowość:** Odnotowano **43 713** unikalnych kupujących (1,03 zamówienia na klienta — dominacja zakupów jednorazowych) oraz niemal 9-krotny wzrost miesięcznej sprzedaży od stycznia do listopadowego piku Black Friday (+62,9% zamówień m/m).