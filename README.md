# Analiza Finansowa

## O Projekcie

Projekt polega na przygotowaniu surowych danych pochodzących z rzeczywistego sklepu internetowego w brazylii, zapisania ich w bazie danych (microsoft sql server) oraz przeprowadzenie analizy finansowej za pomocą zapytań SQL oraz zilustrowania ich za pomocą Power BI. 

## Zastosowane technologie
* **Język programowania:** Python
* **Baza Danych:** Microsoft SQL Server (T-SQL)
* **IDE:** Visual Studio Code
* **System kontroli wersji:** Git & GitHub

## ETL
1. **Pobranie danych:** Surowe pliki `.csv` z danymi transakcyjnymi z platformy Kaggle przechowywane są w katalogu `data/`.
2. **Automatyzacja zasilania:** Skrypt `python/import_data.py` dynamicznie lokalizuje strukturę katalogów, odczytuje pliki CSV i przesyła je w bezpiecznych pakietyzowanych transakcjach do relacyjnej bazy danych `Olist_Finance` na lokalnym serwerze SQL.
3. **Modelowanie SQL (w trakcie realizacji):** Tworzenie widoków analitycznych i zapytań agregujących kluczowe wskaźniki.
4. **Raportowanie BI (planowane):** Połączenie bazy SQL z Power BI i budowa interaktywnego dashboardu zarządczego.

## Wstępna analiza

Rok 2017 stanowi jedyny pełny rok kalendarzowy w zbiorze danych Olist, co czyni go najbardziej wiarygodną bazą porównawczą dla analityki sprzedaży:

* **Czysty przychód ze sprzedaży:** **5 962 902,01 BRL**  
  Całkowita wartość netto sprzedanych towarów dla pomyślnie doręczonych zamówień (z wyłączeniem kosztów logistyki oraz anulowanych transakcji).
* **Średnia wartość zamówienia:** **152,55 BRL**  
  Średnia kwota transakcji przypadająca na zamówienie opłacone przez klienta.
* **Wolumen zamówień:** **45 101** zamówień zarejestrowanych w 2017 roku.
* **Baza unikalnych klientów:** **43 713** unikalnych kupujących 

---