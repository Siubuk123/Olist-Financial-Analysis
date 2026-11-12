# Analiza Finansowa

## O Projekcie

Projekt polega na przygotowaniu surowych danych pochodzących z rzeczywistego sklepu internetowego w brazylii, zapisania ich w bazie danych (microsoft sql server) oraz przeprowadzenie analizy finansowej za pomocą zapytań SQL oraz zilustrowania ich za pomocą Power BI. 

## Zastosowane technologie
* **Język programowania:** Python
* **Baza Danych:** Microsoft SQL Server (T-SQL)
* **Wizualizacja danych:** Power BI
* **IDE:** Visual Studio Code
* **System kontroli wersji:** Git & GitHub

## ETL
1. **Pobranie danych:** Surowe pliki `.csv` z danymi transakcyjnymi z platformy Kaggle przechowywane są w katalogu `data/`.
2. **Automatyzacja zasilania:** Skrypt `python/import_data.py` dynamicznie lokalizuje strukturę katalogów, odczytuje pliki CSV i przesyła je w bezpiecznych pakietyzowanych transakcjach do relacyjnej bazy danych `Olist_Finance` na lokalnym serwerze SQL.
3. **Modelowanie SQL (w trakcie realizacji):** Tworzenie widoków analitycznych i zapytań agregujących kluczowe wskaźniki.
4. **Raportowanie BI (planowane):** Połączenie bazy SQL z Power BI i budowa interaktywnego dashboardu zarządczego.

## Wyniki analizy: Przegląd sprzedaży (`01_sales_overview.sql`)
Rok **2017** stanowi jedyny pełny rok kalendarzowy w zbiorze danych Olist, dlatego posłużył jako główny punkt odniesienia dla oceny kondycji finansowej platformy.

### Główne wskaźniki (KPI)
- **Czysty przychód ze sprzedaży:** **5 962 902,01 BRL**  
  Całkowita wartość netto sprzedanych towarów dla pomyślnie doręczonych zamówień (`delivered`), z wyłączeniem kosztów dostawy oraz transakcji anulowanych.
- **Średnia wartość zamówienia (AOV):** **152,55 BRL**  
  Średnia kwota transakcji przypadająca na pojedynczą płatność dokonaną przez klienta.
- **Wolumen zamówień:** **45 101**  
  Łączna liczba wszystkich zamówień zarejestrowanych w systemie w 2017 roku.
- **Baza klientów:** **43 713**  
  Liczba unikalnych kupujących. Stosunek liczby zamówień do liczby klientów wynosi **1,03**, co wskazuje na model biznesowy zdominowany przez zakupy jednorazowe i niski wskaźnik powracalności.

### Dynamika miesięczna i sezonowość (2017)
Platforma odnotowała niemal **9-krotny wzrost** miesięcznych obrotów między styczniem a listopadem (z **111 798,36 BRL** do **987 765,37 BRL**). Wyraźny pik w listopadzie (**+62,9%** wolumenu zamówień względem października) odzwierciedla wpływ wyprzedaży Black Friday.

### Logistyka i skuteczność realizacji zamówień
- **Udział kosztów dostawy (Freight Ratio):** **13,85%**  
  Taki odsetek całkowitej kwoty brutto płaconej przez klientów (`price + freight_value`) stanowią koszty transportu.
- **Skuteczność doręczeń:** **96,29%** (**43 428** zamówień) zakończyło się skutecznym dostarczeniem do klienta (`delivered`).
- **Straty i niezrealizowane zamówienia:** Łącznie **1,60%** wolumenu nie doszło do skutku z powodu braku towaru w magazynie (`unavailable` – **1,01%**, 457 szt.) lub anulowania transakcji (`canceled` – **0,59%**, 265 szt.). Pozostałe **2,11%** stanowiły zamówienia będące w trakcie procesowania lub transportu (`shipped` – 1,18%, `processing` – 0,53%, `invoiced` – 0,39%, `created`/`approved` – 0,01%).

---