Sales Analysis Project (T-SQL)

📌 Cel projektu

Projekt symuluje procesy analityczne w systemie klasie ERP. Celem było przygotowanie struktury bazy danych oraz stworzenie zaawansowanych zapytań SQL, które odpowiadają na realne potrzeby biznesowe, takie jak analiza marżowości, rankingi sprzedaży oraz udział kategorii w obrocie.

🛠 Wykorzystane technologie
Baza danych: Microsoft SQL Server

Narzędzie: DBeaver / SSMS

Język: T-SQL (Transact-SQL)

🔍 Kluczowe funkcjonalności (SQL)
W projekcie wykorzystałem zaawansowane techniki SQL, które stosuję w codziennej pracy jako analityk:

Relacyjna struktura: Projektowanie tabel z zachowaniem więzów integralności (Primary & Foreign Keys).

Common Table Expressions (CTE): Czytelna struktura zapytań dzieląca logikę na mniejsze, reużywalne moduły.

Funkcje Okienkowe (Window Functions): Zastosowanie DENSE_RANK() do tworzenia rankingów klientów oraz OVER() do obliczania procentowego udziału w całości sprzedaży.

Optymalizacja: Implementacja indeksów na kluczach obcych w celu przyspieszenia operacji typu JOIN.

📂 Struktura repozytorium

schema.sql – Definicja struktury bazy danych (DDL).

analysis.sql – Skrypty analityczne i raportowe (DML).

📈 Przykładowe pytania biznesowe
Jaki jest udział procentowy każdej kategorii produktów w całkowitym przychodzie?

Którzy klienci generują największy obrót (ranking sprzedaży)?

Jakie są trendy sprzedaży w poszczególnych kategoriach?
