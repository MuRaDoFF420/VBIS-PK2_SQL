# VBIS-PK2_SQL

**Ad Soyad:** Əlicabbar Muradov  
**Qrup:** MRM24  
**Tapşırıq:** Chapter 3 Practice Assignment  
**DBMS:** PostgreSQL 18 / pgAdmin 4

## Layihə haqqında

Bu repository Chapter 3 üzrə SQL sorğularının həllərini, qısa metodoloji izahları və pgAdmin 4-də alınmış real icra görüntülərini saxlayır. Sorğular `JOIN`, `NOT EXISTS`, alt sorğu, `GROUP BY`, `HAVING`, `MAX`, `MIN`, `SUM`, `COUNT` və `WITH` (CTE) mövzularını əhatə edir.

## Həll edilən tapşırıqlar

**Məcburi (9 sorğu):** 3.11(a), 3.11(b), 3.11(c), 3.11(d), 3.15(a), 3.15(b), 3.15(c), 3.24 və 3.25.

**Əlavə (8 sorğu):** 3.26, 3.27, 3.28, 3.31, 3.32, 3.33, 3.34 və 3.35.

**Cəmi:** 17 SQL sorğusu; hər biri üçün `screenshots/` qovluğunda ekran görüntüsü mövcuddur.

## Fayl strukturu

```text
VBIS-Chapter3-SQL/
├── README.md
├── mandatory_queries.sql
├── additional_queries.sql
├── explanation.md
└── screenshots/
    ├── 01-university-queries.png
    ├── 02-bank-queries.png
    ├── 03-joins-and-subqueries.png
    ├── 04-aggregates-and-cte.png
    ├── 05-bank-all-branches.png
    ├── 06-bank-assets-comparison.png
    ├── 07-exercise-3-11a.png
    ├── 08-exercise-3-11b.png
    ├── 09-exercise-3-11d.png
    ├── 10-exercise-3-24.png
    ├── 11-exercise-3-25.png
    ├── 12-exercise-3-26.png
    ├── 13-exercise-3-27.png
    ├── 14-exercise-3-28.png
    ├── 15-exercise-3-32.png
    ├── 16-exercise-3-33.png
    └── 17-exercise-3-34.png
```

## SQL faylları

- [`mandatory_queries.sql`](mandatory_queries.sql): 3.11(a–d), 3.15(a–c), 3.24, 3.25.
- [`additional_queries.sql`](additional_queries.sql): 3.26–3.28, 3.31–3.35.
- [`explanation.md`](explanation.md): ən çətin sorğu, alt sorğu, JOIN və problemlərin həlli barədə 250-dən çox sözlə dörd cavab.
- [`screenshots/`](screenshots/): PostgreSQL mühitində sorğu və nəticə görüntüləri.

## PostgreSQL icra görüntüləri

Bu nəticələr istifadə edilən nümunə məlumatlara aiddir. Boş nəticə səhv demək deyil: sorğu uğurla icra oluna bilər, amma uyğun sətir tapılmaya bilər.

| Tapşırıq | Ekran görüntüsü | Nəticə / qeydlər |
|---|---|---|
| 3.11(a) | [07](screenshots/07-exercise-3-11a.png) | 6 tələbə |
| 3.11(b) | [08](screenshots/08-exercise-3-11b.png) | 13 tələbə |
| 3.11(c) | [01](screenshots/01-university-queries.png) | Departamentlər üzrə `MAX(salary)`; Physics = 95000.00 |
| 3.11(d) | [09](screenshots/09-exercise-3-11d.png) | Minimum departament maksimumu = 40000.00 |
| 3.15(a) | [05](screenshots/05-bank-all-branches.png) | `C101` — Brooklyn-dəki hər iki filialda hesabı var |
| 3.15(b) | [02](screenshots/02-bank-queries.png) | `SUM(amount)` = 67000.00 |
| 3.15(c) | [06](screenshots/06-bank-assets-comparison.png) | `Brooklyn-2` və `Downtown` |
| 3.24 | [10](screenshots/10-exercise-3-24.png) | 0 sətir: nümunə bazasında `Accounting` tələbəsi yoxdur |
| 3.25 | [11](screenshots/11-exercise-3-25.png) | 0 sətir: nümunə bazasında `Philosophy` departamenti yoxdur |
| 3.26 | [12](screenshots/12-exercise-3-26.png) | 0 sətir: kursu ən azı 3 dəfə götürən yoxdur |
| 3.27 | [13](screenshots/13-exercise-3-27.png) | 0 sətir: ən azı 3 fərqli kursu təkrar götürən yoxdur |
| 3.28 | [14](screenshots/14-exercise-3-28.png) | 5 müəllim |
| 3.31 | [03](screenshots/03-joins-and-subqueries.png) | 9 müəllim |
| 3.32 | [15](screenshots/15-exercise-3-32.png) | 6 müəllim |
| 3.33 | [16](screenshots/16-exercise-3-33.png) | 2 kurs (`CS-101`, `CS-315`) |
| 3.34 | [17](screenshots/17-exercise-3-34.png) | 14 bölmə üzrə tələbə sayı |
| 3.35 | [04](screenshots/04-aggregates-and-cte.png) | `CS-101`, bölmə 1, 2017 Fall, 6 tələbə |

## İstifadə qaydası

1. PostgreSQL/pgAdmin 4 proqramında **university** verilənlər bazası yaradın. Universitet üçün [kitabın rəsmi DDL və nümunə verilənlərindən](https://db-book.com/university-lab-dir/sample_tables-dir/index.html) istifadə etmək olar.
2. **3.15(a–c)** sorğuları universitetə deyil, ayrıca **bank** verilənlər bazasına aiddir. Bank sxemində `branch`, `customer`, `account`, `depositor`, `loan` cədvəlləri olmalıdır; bank screenshot-ları üçün nümunə test məlumatları istifadə edilib.
3. pgAdmin-də **Tools → Query Tool** açın. Fayldan yalnız uyğun verilənlər bazasına aid sorğunu seçin və **Execute (F5)** düyməsini basın. Eyni `mandatory_queries.sql` faylında həm bank, həm universitet sorğuları var: hamısını bir bazada birlikdə icra etməyin.
4. SQL kodu ilə nəticəni müqayisə etmək üçün cədvəldəki screenshot keçidlərindən istifadə edin.

**Sxem adları:** Universitet üçün `student`, `takes`, `course`, `instructor`, `advisor`, `department`, `teaches`, `section`, `time_slot`; bank üçün `customer`, `branch`, `account`, `depositor`, `loan`.

**Qeyd:** SQL-lər standart sxem sütunları üçün yazılıb; `time_slot.end_hr` sütunu olmayan fərqli sxemdə 3.33 sorğusu uyğunlaşdırılmalıdır. Sorğunun nəticəsi yalnız cədvəllərdəki mövcud məlumatları əks etdirir.

## GitHub və təhvilvermə

Repository: **[MuRaDoFF420/VBIS-Chapter3-SQL](https://github.com/MuRaDoFF420/VBIS-Chapter3-SQL)** (Public). Dəyişikliklər `git commit` tarixçəsi ilə saxlanılır. LMS-ə yalnız repository linki göndərilir:

`https://github.com/MuRaDoFF420/VBIS-Chapter3-SQL`

## Mənbələr

- Müəllimin təqdim etdiyi `Ch3.docx` (Chapter 3 exercises).
- *Database System Concepts*, 7-ci nəşr — https://db-book.com/
- Rəsmi universitet sxemi və nümunə məlumatlar — https://db-book.com/university-lab-dir/sample_tables-dir/index.html
