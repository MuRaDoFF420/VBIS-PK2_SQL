# Chapter 3 — SQL sorğularının izahı

**Ad Soyad:** Əlicabbar Muradov  
**Qrup:** MRM24

## 1. Ən çətin hesab etdiyiniz SQL sorğusu hansı oldu?

Mənim üçün ən çox diqqət tələb edən sorğu **3.15(a)** oldu. Bu tapşırıqda Brooklyn şəhərində yerləşən sadəcə bir filialda deyil, **bütün filiallarda** hesabı olan müştərilər tapılmalıdır. Adi `JOIN` əməliyyatı ilə müştərinin müəyyən filialda hesabı olduğunu göstərmək asandır. Lakin eyni yanaşma ilə müştərinin bütün filiallarda hesabı olmasını sübut etmək mümkün deyil. Buna görə `NOT EXISTS` daxilində ikinci `NOT EXISTS` istifadə etdim. Xarici alt sorğu Brooklyn filiallarını yoxlayır, daxili alt sorğu isə həmin filialda konkret müştərinin hesabı olub-olmadığını müəyyənləşdirir. Heç bir çatışmayan filial qalmırsa, müştəri nəticəyə daxil edilir. Bu üsul SQL-də “hamısı” şərtini düzgün ifadə etmək üçün münasibdir.

## 2. Hansı sorğu üçün alt sorğu (subquery) istifadə etdiniz?

Alt sorğulardan bir neçə yerdə istifadə etdim. Məsələn, **3.25** tapşırığında əvvəlcə `department` cədvəlindən `Philosophy` departamentinin büdcəsini əldə edən alt sorğu yazdım. Əsas sorğu digər departamentlərin büdcələrini həmin məbləğlə müqayisə edir və daha böyük büdcəsi olan departamentləri əlifba sırası ilə qaytarır. **3.11(d)** tapşırığında isə əvvəl hər departamentin ən yüksək müəllim maaşını `MAX(salary)` ilə hesabladım. Sonra həmin aralıq nəticədə `MIN()` funksiyasını tətbiq edərək maksimum maaşların ən kiçiyini tapdım. **3.27** tapşırığında da əvvəl təkrar götürülmüş kursları müəyyənləşdirib sonra hər tələbə üzrə fərqli təkrarlanan kursların sayını hesabladım. Beləliklə, mürəkkəb şərtləri daha kiçik məntiqi hissələrə böldüm.

## 3. JOIN istifadə etdiyiniz bir nümunəni izah edin.

**3.24** tapşırığı `JOIN` əməliyyatını izah etmək üçün yaxşı nümunədir. Məqsəd `Physics` departamentində çalışan müəllimin akademik məsləhət verdiyi `Accounting` tələbələrinin adını və ID-sini tapmaqdır. Tələbələrin məlumatı `student`, müəllimlərin məlumatı `instructor`, tələbə ilə məsləhətçisi arasındakı əlaqə isə `advisor` cədvəlində saxlanılır. `student.ID = advisor.s_ID` şərti tələbəni məsləhət qeydi ilə əlaqələndirir. `advisor.i_ID = instructor.ID` şərti isə məsləhətçini müəyyənləşdirir. Daha sonra `WHERE` bölməsində həm tələbənin, həm də müəllimin departamenti yoxlanılır. Burada `JOIN` istifadə etmək lazımdır, çünki tələb olunan nəticəni bir cədvəldən təkbaşına əldə etmək mümkün deyil. Üç cədvəlin açarları düzgün uyğunlaşdırılmalıdır.

## 4. SQL sorğularını yazarkən qarşılaşdığınız bir problemi və onun həllini izah edin.

Əsas problemlərdən biri çoxlu cədvəl birləşdirilən zaman **təkrarlanan nəticələrin** yaranması ehtimalıdır. Məsələn, **3.11(a)** sorğusunda eyni tələbə bir neçə `Comp. Sci.` kursu keçmiş ola bilər. `student`, `takes` və `course` cədvəlləri birləşdirildikdə həmin tələbə bir neçə sətirdə görünə bilər. Tapşırıq isə hər tələbənin yalnız bir dəfə göstərilməsini tələb edir. Buna görə `SELECT DISTINCT` tətbiq etdim. İkinci diqqət yetirdiyim məqam `COUNT(*)` ilə `COUNT(sütun)` arasındakı fərqdir. **3.35** sorğusunda `LEFT JOIN` zamanı tələbəsi olmayan bölmələr də nəzərə alınır. Belə vəziyyətdə `COUNT(*)` boş qoşulma sətrini də saya bilər. Buna görə `COUNT(t.ID)` istifadə etdim: bu, yalnız real tələbə qeydlərini sayır və sıfır qeydiyyatı olan bölmələr üçün düzgün nəticə verir. Həmçinin, **3.32** tapşırığında `NULL` qiymətlərin adi müqayisələrlə düzgün seçilmədiyini nəzərə alaraq `grade IS NOT NULL` şərtini açıq şəkildə yazdım. Bu yanaşmalar sorğuların məntiqi dəqiqliyini artırır.

---

## PostgreSQL-də icra qeydləri

Sorğuların hamısı `university` və ya `bank` bazasında ayrı-ayrılıqda işlədilib və nəticələri `screenshots/` qovluğuna əlavə olunub. 3.11(a) sorğusu 6, 3.11(b) sorğusu 13 tələbə qaytardı; 3.11(d)-də maksimum maaşların ən kiçiyi 40000.00 oldu. Bank nümunəsində 3.15(a) sorğusu `C101` müştərisini, 3.15(b) sorğusu 67000.00 məbləğini və 3.15(c) sorğusu iki filialı qaytardı. 3.28 sorğusu 5, 3.31 sorğusu 9 və 3.32 sorğusu 6 müəllim qaytardı. 3.33-də 2 kurs, 3.34-də 14 bölmə göründü; 3.35-də maksimum qeydiyyat 6 tələbə oldu.

**Boş nəticələr:** 3.24 və 3.25 sorğuları bu nümunə bazasında müvafiq olaraq `Accounting` tələbəsi və `Philosophy` departamenti olmadığı üçün sətir qaytarmadı. 3.26 üçün bir kursu ən çox iki dəfə götürmüş tələbə var, tələb olunan isə ən azı üç dəfərdir. 3.27-də heç bir tələbə ən azı üç fərqli kursu təkrar götürməyib. Bu hallar SQL xətası deyil, verilənlərin xüsusiyyətidir; tapşırıqların şərtləri dəyişdirilməyib.
