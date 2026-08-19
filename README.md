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

## Wstępna analiza danych za pomocą zapytań SQL
**Zrealizowany przychód**: Łączna wartość przetworzonych płatności dla dostarczonych  zamówień wyniosła 15 422 461,77 BRL (2 983 587,81 USD). 
**Na mapie** Największym rynkiem jest stan São Paulo (SP) z liczbą 41 746 klientów — wyprzedza on Rio de Janeiro (RJ) z 12 852 klientami oraz Minas Gerais (MG) z 11 635 klientami.
**Logistyka**: Średni czas realizacji zamówienia (od momentu zakupu do momentu doręczenia paczki do klienta) wyniósł 12 dni.