# VBIS-Chapter3-SQL

**Ad Soyad:** Əlicabbar Muradov  
**Qrup:** MRM24  
**Tapşırıq:** Chapter 3 Practice Assignment  
**Verilənlər bazası sistemi:** PostgreSQL (pgAdmin 4)

## Layihənin məqsədi

Bu repository Chapter 3 tapşırıqları üçün SQL sorğularını, sorğuların izahını və PostgreSQL-də icra zamanı çəkilmiş ekran görüntülərini bir yerdə saxlayır. Tapşırıqlar JOIN, aqreqat funksiyalar, GROUP BY/HAVING, alt sorğular və CTE kimi mövzuları əhatə edir.

## Həll edilən tapşırıqlar

**Məcburi tapşırıqlar**

- 3.11 (a, b, c, d)
- 3.15 (a, b, c)
- 3.24
- 3.25

**Əlavə tapşırıqlar**

- 3.26
- 3.27
- 3.28
- 3.31
- 3.32
- 3.33
- 3.34
- 3.35

**Ümumi:** 17 SQL sorğusu (9 məcburi, 8 əlavə).

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
    └── 06-bank-assets-comparison.png
```

## PostgreSQL icra görüntüləri

Aşağıdakı ekran görüntüləri **PostgreSQL 18 / pgAdmin 4** proqramında icra edilmiş real sorğulardan götürülüb. Screenshot-ların hamısı `screenshots/` qovluğundadır.

| Şəkil | Tapşırıq | Ekranda görünən nəticə |
|---|---|---|
| [01-university-queries.png](screenshots/01-university-queries.png) | 3.11(c) | Departamentlər üzrə `MAX(salary)`; məsələn Physics = 95000.00 |
| [02-bank-queries.png](screenshots/02-bank-queries.png) | 3.15(b) | Kreditlərin cəmi `67000.00` |
| [03-joins-and-subqueries.png](screenshots/03-joins-and-subqueries.png) | 3.31 | `NOT EXISTS` və `JOIN` ilə 9 müəllim |
| [04-aggregates-and-cte.png](screenshots/04-aggregates-and-cte.png) | 3.35 | Maksimum qeydiyyat: `CS-101`, bölmə `1`, 2017 Fall, `6` tələbə |
| [05-bank-all-branches.png](screenshots/05-bank-all-branches.png) | 3.15(a) | Brooklyn-in bütün filiallarında hesabı olan `C101` |
| [06-bank-assets-comparison.png](screenshots/06-bank-assets-comparison.png) | 3.15(c) | `Brooklyn-2` və `Downtown` |

**Qeyd:** Bank cədvəlləri bu layihə üçün yaradılmış nümunə məlumatlarla doldurulub; nəticələr həmin verilənlərə aiddir. Bu şəkillər 6 sorğunun real icrasını sənədləşdirir. Qalan sorğular da təhvil verməzdən əvvəl ayrıca yoxlanmalıdır.

## Faylların məzmunu

- `mandatory_queries.sql` — yalnız 3.11(a–d), 3.15(a–c), 3.24 və 3.25.
- `additional_queries.sql` — 3.26, 3.27, 3.28, 3.31, 3.32, 3.33, 3.34, 3.35.
- `explanation.md` — dörd izah sualının Azərbaycan dilində cavabları.
- `screenshots/` — SQL əmrlərinin, nəticələrin və PostgreSQL/pgAdmin mühitinin real ekran görüntüləri.

## İstifadə qaydası

1. PostgreSQL və pgAdmin 4 qurun. pgAdmin-də verilənlər bazanıza qoşulun.
2. Universitet sxemi üçün cədvəlləri yaradın və test məlumatlarını əlavə edin. Kitabın rəsmi universitet DDL və nümunə məlumatları: https://db-book.com/university-lab-dir/sample_tables-dir/index.html
3. **3.15 tapşırığı ayrıca bank sxeminə aiddir.** Onun üçün `branch`, `customer`, `account`, `depositor` və `loan` cədvəlləri mövcud olmalıdır. Universitet bazasında bank cədvəlləri yoxdursa, bu sorğuları həmin bazada icra etməyin.
4. pgAdmin-də **Tools → Query Tool** açın. SQL faylından yalnız uyğun verilənlər bazasına aid olan sorğunu seçib **Execute (F5)** edin.
5. `screenshots/` qovluğunda 6 real icra görüntüsü əlavə edilib (minimum 4 tələbi ödənilib).
6. Qalan sorğuları da pgAdmin-də yoxlayın və `explanation.md` mətnini öz icra təcrübənizə uyğun son dəfə nəzərdən keçirin.
7. GitHub-da `VBIS-Chapter3-SQL` adlı repository yaradın, ZIP-i açıb içindəki **faylları və screenshots qovluğunu** yükləyin, commit tarixçəsi yaradın və repo görünürlüyünü **Public** (və ya müəllimə açıq) edin.
8. LMS-ə **yalnız GitHub repository linkini** göndərin.

## Qeyd: istifadə edilən sxemlər

**University:** `student`, `takes`, `course`, `instructor`, `advisor`, `department`, `teaches`, `section`, `time_slot`.

**Bank:** `branch`, `customer`, `loan`, `depositor`, `account`.

Sorğular kitabdakı standart atribut adları ilə yazılıb. Məsələn, `advisor.s_ID`, `advisor.i_ID` və `time_slot.end_hr`. Əgər sizdə `time_slot` cədvəlində vaxt `end_time` (`TIME` tipində) sütununda saxlanılırsa, 3.33-də `ts.end_hr >= 12` şərtini `ts.end_time >= TIME '12:00'` ilə dəyişin.

**Nəticələr haqqında:** Verilənlər bazasında `Accounting`, `Philosophy` və ya `Brooklyn` kimi məlumatlar yoxdursa, uyğun sorğular 0 sətir qaytara bilər. Bu, avtomatik olaraq sintaksis səhvi demək deyil.

## GitHub commit nümunələri

```bash
git init
git add README.md mandatory_queries.sql
git commit -m "Add mandatory Chapter 3 queries"
git add additional_queries.sql explanation.md
git commit -m "Add additional queries and explanations"
git add screenshots/
git commit -m "Add PostgreSQL execution screenshots"
git branch -M main
git remote add origin https://github.com/USERNAME/VBIS-Chapter3-SQL.git
git push -u origin main
```

Əvvəl GitHub-da boş repository yaradılmalı və `USERNAME` öz GitHub istifadəçi adınızla əvəz edilməlidir.

## Mənbələr

- Müəllimin təqdim etdiyi `Ch3.docx` (Chapter 3 exercises).
- *Database System Concepts*, 7-ci nəşr — https://db-book.com/
- Universitet üçün rəsmi test verilənləri — https://db-book.com/university-lab-dir/sample_tables-dir/index.html
