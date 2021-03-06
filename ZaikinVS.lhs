% Самостоятельная работа студента в рамках курса
% <<Функциональное программирование>>
% (<<Haskell как первый язык программирования>>)

\section*{Автор решений задач}

% Здесь впишите свои данные по образцу:
\begin{flushleft}
\textbf{Студент:} Заикин Владислав Сергеевич.

\textbf{Группа:} ИТ41БО.

\textbf{Вуз:} ЯрГУ им. Демидова 

\textbf{Дата начала решения задач:} 18.10.2020.
\end{flushleft}

\section*{Введение}

Данный документ содержит литературный Haskell-код самостоятельной работы студента, выполненной в рамках курса <<Функциональное программирование>> (<<Haskell как первый язык программирования>>).

Решения задач студент готовит и автономно отлаживает в системе GHCi.
Для записи решений задач допускается и рекомендуется использование примитивов, определенных в прелюдии и в следующих двух стандартных модулях системы GHCi:
\begin{code}
import Data.Char
import Data.List
\end{code}
Другие стандартные модулии системы GHCi использовать не разрешено.

Студентам строго рекомендовано изучить функции, определенные в данных модулях.  Найти актуальное описание модулей легко, выполнив Google-поиск по запросам <<Haskell Data.Char>> и <<Haskell Data.List>>.  На найденных страницах с описанием модулей есть (в правом верхнем углу) ссылка на исходный код данных модулей, который полезно изучить.  Как минимум, код тех функций, которые будут использоваться в решении задач.
Особенно стоит обратить внимание на следующие функции:
\begin{semicode}
    (++) reverse sum product minimum concat iterate
    repeat replicate take drop splitAt takeWhile
    dropWhile span inits tails filter partition
    elemIndices findIndices zipWith lines words unwords
    nub delete union intersect sort sortOn sortBy
    ord chr isDigit digitToInt isAlpha toUpper
\end{semicode}

Кроме того, используются типы, определенные в следующем модуле (подробнее см. в разделе~\ref{s:ExtraTypes} на странице~\pageref{s:ExtraTypes}):
\begin{code}
import ExtraTypes
\end{code}

\section*{Предварительная проверка решений на тестах}

Следующий текст предназначен для управления предварительной автоматической проверкой решений на наборах тестов.  Сервис проверки доступен по адресу \url{http://haskell.pereslavl.ru}:

\begin{verbatim}
Для выполнения проверки некоторых (или всех) решений на сервере:
1) ниже в 1-й колонке соответствующих строк замените "-" на "+"
2) в третьей колонке этой строки напишите имя функции-решения
   данного задания (если использовали иное имя, а не указанное)
3) сохраните измененный файл
4) загрузите файл в форму автоматической проверки
5) дождитесь результата и изучите файл с результатом

    Проба пера19
    + chk1_1     cube               -- проверка задачи 1-1
    + chk1_2     decmls             -- проверка задачи 1-2
    + chk1_3     ese                -- проверка задачи 1-3
    + chk1_4     eso                -- проверка задачи 1-4
    + chk1_5     epo                -- проверка задачи 1-5
    + chk1_6     n_cups_m_saucers   -- проверка задачи 1-6
    + chk1_7     wonderland3        -- проверка задачи 1-7
    + chk1_8     wonderland4        -- проверка задачи 1-8
    + chk1_9     fortee             -- проверка задачи 1-9
    + chk1_10    bwtable            -- проверка задачи 1-10
    + chk1_11    lottery            -- проверка задачи 1-11
    + chk1_12    ones3              -- проверка задачи 1-12
    + chk1_13    same3              -- проверка задачи 1-13
    + chk1_14    diff3              -- проверка задачи 1-14
    + chk1_15    gcd3               -- проверка задачи 1-15
    + chk1_16    lcm2               -- проверка задачи 1-16
    + chk1_17    lcm3               -- проверка задачи 1-17
    + chk1_18    lcm3gcd            -- проверка задачи 1-18
    + chk1_19    pps                -- проверка задачи 1-19

    Корни уравнений
    + chk2_1     abRoot             -- проверка задачи 2-1
    + chk2_2     abcRoots           -- проверка задачи 2-2
    + chk2_3     ab_Roots           -- проверка задачи 2-3
    + chk2_4     abcdRoots          -- проверка задачи 2-4
    + chk2_5     abcdeRoots         -- проверка задачи 2-5
    + chk2_6     absRoots           -- проверка задачи 2-6
    + chk2_7     abs2Roots          -- проверка задачи 2-7
    + chk2_8     absabs2Roots       -- проверка задачи 2-8
    + chk2_9     min_ab_Root        -- проверка задачи 2-9
    + chk2_10    min_abcdRoot       -- проверка задачи 2-10
    + chk2_11    min_abcdeRoot      -- проверка задачи 2-11
    + chk2_12    min_absRoot        -- проверка задачи 2-12
    + chk2_13    min_2absRoot       -- проверка задачи 2-13
    + chk2_14    min_abs2absRoot    -- проверка задачи 2-14

    Вычислительные задачи
    + chk3_1     sumSq              -- проверка задачи 3-1
    + chk3_2     fibs               -- проверка задачи 3-2
    + chk3_3     bins               -- проверка задачи 3-3
    + chk3_4     eApr               -- проверка задачи 3-4
    + chk3_5     sqrtH              -- проверка задачи 3-5

    Числа и цифры
    + chk4_1     binary_dgts        -- проверка задачи 4-1
    + chk4_2     ternary_dgts       -- проверка задачи 4-2
    + chk4_3     decimal_dgts       -- проверка задачи 4-3
    + chk4_4     k_ary_dgts         -- проверка задачи 4-4
    + chk4_5     setun_dgts         -- проверка задачи 4-5
    + chk4_6     s2dgts             -- проверка задачи 4-6
    + chk4_7     p3dgts             -- проверка задачи 4-7
    + chk4_8     l4dgts             -- проверка задачи 4-8

    Строки и символы
    + chk5_1     dgt_chr            -- проверка задачи 5-1
    + chk5_2     chr_dgt            -- проверка задачи 5-2
    + chk5_3     sumDigits          -- проверка задачи 5-3
    + chk5_4     upAlpha            -- проверка задачи 5-4
    - chk5_5     abbrev             -- проверка задачи 5-5

    Кредит и его погашение
    + chk6_1     balances           -- проверка задачи 6-1
    - chk6_2     balance            -- проверка задачи 6-2
    + chk6_3     credit_years       -- проверка задачи 6-3
    - chk6_4     balances_y         -- проверка задачи 6-4

    Делители и простые числа
    + chk7_1     denominators       -- проверка задачи 7-1
    - chk7_2     isPrime            -- проверка задачи 7-2

    Операторы
    + chk8_1     (.+.)              -- проверка задачи 8-1
    - chk8_2     (./.)              -- проверка задачи 8-2
    - chk8_3     (.-:)              -- проверка задачи 8-3
    - chk8_4     (.+:)              -- проверка задачи 8-4
    - chk8_5     (.^)               -- проверка задачи 8-5
    - chk8_6     (.@)               -- проверка задачи 8-6
    - chk8_7     (.*.)              -- проверка задачи 8-7

    Списки
    + chk9_1     inRange            -- проверка задачи 9-1
    + chk9_2     pairs              -- проверка задачи 9-2
    + chk9_3     idxs               -- проверка задачи 9-3
    + chk9_4     delGt              -- проверка задачи 9-4
    - chk9_5     fsearch            -- проверка задачи 9-5
    - chk9_6     remdumps           -- проверка задачи 9-6
    - chk9_7     chkDups            -- проверка задачи 9-7
    - chk9_8     isSorted           -- проверка задачи 9-8
    - chk9_9     insWord            -- проверка задачи 9-9
    - chk9_10    insWords           -- проверка задачи 9-10
    - chk9_11    substrings         -- проверка задачи 9-11
    - chk9_12    isPermutation      -- проверка задачи 9-12
    - chk9_13    qs                 -- проверка задачи 9-13

    Сопоставление с образцом
    - chk10_1    pmatch             -- проверка задачи 10-1

    Ханойская башня
    - chk11_1    hanoiSteps         -- проверка задачи 11-1
    - chk11_2    hanoiNum           -- проверка задачи 11-2

    Точки на 2D-плоскости
    - chk12_1    dist2D             -- проверка задачи 12-1
    - chk12_2    dist2Ds            -- проверка задачи 12-2
    - chk12_3    minDist2Ds         -- проверка задачи 12-3

    Контакты
    - chk13_1    emails             -- проверка задачи 13-1
    - chk13_2    findContacts       -- проверка задачи 13-2

    Операции с полиномами
    - chk14_1    eqPP               -- проверка задачи 14-1
    - chk14_2    addPP              -- проверка задачи 14-2
    - chk14_3    subPP              -- проверка задачи 14-3
    - chk14_4    mulPP              -- проверка задачи 14-4
    - chk14_5    divModPP           -- проверка задачи 14-5
    - chk14_6    valPX              -- проверка задачи 14-6
    - chk14_7    mulCP              -- проверка задачи 14-7
    - chk14_8    povPN              -- проверка задачи 14-8
    - chk14_9    dPdX               -- проверка задачи 14-9
    - chk14_10   dNPdXN             -- проверка задачи 14-10

    Операции с полиномами (альтернативное представление)
    - chk15_1    sim'P              -- проверка задачи 15-1
    - chk15_2    eq'PP              -- проверка задачи 15-2
    - chk15_3    add'PP             -- проверка задачи 15-3
    - chk15_4    sub'PP             -- проверка задачи 15-4
    - chk15_5    mul'PP             -- проверка задачи 15-5
    - chk15_6    divMod'PP          -- проверка задачи 15-6
    - chk15_7    val'PX             -- проверка задачи 15-7
    - chk15_8    mul'CP             -- проверка задачи 15-8
    - chk15_9    pov'PN             -- проверка задачи 15-9
    - chk15_10   dP'dX              -- проверка задачи 15-10
    - chk15_11   dNP'dXN            -- проверка задачи 15-11

    Логические формулы
    - chk16_1    vars               -- проверка задачи 16-1
    - chk16_2    evalPV             -- проверка задачи 16-2
    - chk16_3    tauto              -- проверка задачи 16-3
    - chk16_4    contra             -- проверка задачи 16-4

    Арифметические формулы
    - chk17_1    evalEV             -- проверка задачи 17-1
    - chk17_2    ddv                -- проверка задачи 17-2

    Деревья поиска
    - chk18_1    trees              -- проверка задачи 18-1
    - chk18_2    nTrees             -- проверка задачи 18-2

    Конец списка заданий на автопроверку
\end{verbatim}

% Длина кода: вплоть до колонки 60. Дальше нельзя ---------!

%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\
\section{Проба пера}

Везде далее  приводятся формулировка задач и за ней решение студента.
%
Во всех задачах функции-решения должны быть не определены при некорректном значении аргументов.
%
Конкретная реализация данной неопределенности допускается любой: \prg{undefined}, \prg{error}, недопустимые операции (деление на ноль, \prg{head []} и т.~п.), неполные образцы, неполные охранные выражения и т.~п.
%
Если в условиях задачи упомянуты несколько параметров задачи, то у функции-решения эти параметры перечисляются в порядке их упоминания в условиях.

\textbf{1-1} Написать функцию \prg{cube :: Float {\AR} Float}, возводящую в куб заданное число.

Мое решение:
\begin{code}
cube :: Float -> Float
cube y = y*y*y
\end{code}

\textbf{1-2} Написать функцию \prg{decmls :: Integer {\AR} Integer}, которая вычисляет, сколько существует неотрицательных десятичных чисел с \prg{n} цифрами.

Мое решение:
\begin{code}
decmls :: Integer -> Integer
decmls n    | n<1 = undefined
            | n==1 = 10
            | otherwise = 10^(n - 1) * 9
\end{code}

\textbf{1-3} Написать функцию \prg{ese :: Integer {\AR} Bool}, вычисляющую, будет ли четной сумма \prg{n} четных чисел?

Мое решение:
\begin{code}
ese :: Integer -> Bool
ese n   | n<0 = undefined
        | otherwise = True
\end{code}

\textbf{1-4} Написать функцию \prg{eso :: Integer {\AR} Bool}, вычисляющую, будет ли четной сумма \prg{n} нечетных чисел?

Мое решение:
\begin{code}
eso :: Integer -> Bool
eso n   | n<0 = undefined
        | n >= 0 = even n
\end{code}

\textbf{1-5} Написать функцию \prg{epo :: Integer {\AR} Bool}, вычисляющую, будет ли четным произведение \prg{n} нечетных чисел?

Мое решение:
\begin{code}
epo :: Integer -> Bool
epo n   | n<0 = undefined
        | otherwise = False
\end{code}

\textbf{1-6} В магазине <<Все для чая>> есть \prg{n} разных чашек и \prg{m} разных блюдец. Сколькими способами можно купить чашку с блюдцем? Написать функцию, которая это вычисляет:
\begin{semicode}
n_cups_m_saucers :: Integer -> Integer -> Integer
\end{semicode}

Мое решение:
\begin{code}


n_cups_m_saucers n m  | n<0 || m<0 = undefined
                      | otherwise = n*m
                      

\end{code}

\textbf{1-7} В Стране Чудес есть три города: \emph{А}, \emph{Б} и \emph{В}.
Из города \emph{А} в город \emph{Б} ведет \prg{n} дорог, а из города \emph{Б} в город \emph{В} --- \prg{m} дорог.
Сколькими способами можно проехать от \emph{А} до \emph{В}?
Написать функцию, которая это вычисляет:  \prg{wonderland3 :: Integer {\AR} Integer {\AR} Integer}.

Мое решение:
\begin{code}
wonderland3 :: Integer -> Integer -> Integer
wonderland3 n m | n<0 || m<0 = undefined
                | otherwise = n*m
\end{code}

\textbf{1-8} В Стране Чудес есть четыре города: \emph{А}, \emph{Б}, \emph{В} и \emph{Г}.
Из города \emph{А} в город \emph{Б} ведет \prg{n} дорог, из города \emph{Б} в город \emph{В}~--- \prg{m} дорог, из города \emph{А} в город \emph{Г}~--- две дороги и из города \emph{Г} в город \emph{В}~--- тоже две дороги.
Сколькими способами можно проехать от \emph{А} до \emph{В}?
Написать функцию, которая это вычисляет:  \prg{wonderland4 :: Integer {\AR} Integer {\AR} Integer}.

Мое решение:
\begin{code}
wonderland4 :: Integer -> Integer -> Integer
wonderland4 n m | n<0 || m<0 = undefined
                | otherwise = n*m + 4
\end{code}

\textbf{1-9} В магазине <<Все для чая>> по-прежнему продается \prg{n} чашек, \prg{m} блюдец и 4 чайные ложки.
Сколькими способами можно купить два предмета с разными
названиями?
Написать функцию \prg{fortee :: Integer {\AR} Integer {\AR} Integer}, которая это вычисляет.

Мое решение:
\begin{code}
fortee :: Integer -> Integer -> Integer
fortee n m  | n<0 || m<0 = undefined
            | n==0 && m==0 = 0
            | n==0 || m==0 = 1
            | otherwise = 3
\end{code}

\textbf{1-10} Каждую клетку прямоугольной таблицы из \prg{n} строк и \prg{m} столбцов можно покрасить в черный или белый цвет.
Сколько существует различных раскрасок этой таблицы?
Написать функцию \prg{bwtable :: Integer {\AR} Integer {\AR} Integer}, которая это вычисляет.

Мое решение:
\begin{code}

bwtable :: Integer -> Integer -> Integer
bwtable n m | n<1 || m<1 = undefined
            | n==1 && m==1 = 2
            | otherwise = 2^(n*m)
\end{code}

\textbf{1-11} Сколькими способами можно заполнить одну карточку в лотерее <<Спортпрогноз>>?
В этой лотерее нужно предсказать итог \prg{n} спортивных матчей.
Итог каждого матча~--- победа одной из команд, либо ничья (счет роли не играет).
Написать функцию \prg{lottery :: Integer {\AR} Integer}, которая это вычисляет.

Мое решение:
\begin{code}
lottery :: Integer -> Integer
lottery n   | n<1 = undefined
            | otherwise = 3^n
\end{code}

\textbf{1-12} Имеется три ящика, в каждом из которых лежат шары с номерами от \prg{0} до \prg{n}.
Из каждого ящика вынимается по одному шару.
Какова вероятность того, что вынуты три единицы?
Написать функцию, которая вычисляет эту вероятность: \prg{ones3 :: Integer {\AR} Float}.

Эталонное решение и проверочная функция:
\begin{code}
ones3 :: Integer -> Float
ones3 n | n<0 = undefined
        | n==0 = 0
        | otherwise = 1 / cube(fromInteger(n+1))
\end{code}

\textbf{1-13} Имеется три ящика, в каждом из которых лежат шары с номерами от \prg{0} до \prg{n}.
Из каждого ящика вынимается по одному шару.
Какова вероятность того, что вынуты три одинаковых числа?
Написать функцию, которая вычисляет эту вероятность: \prg{same3 :: Integer {\AR} Float}.

Мое решение:
\begin{code}
same3 :: Integer -> Float
same3 n | n<0 = undefined
        | n==0 = 1
        | otherwise = 1 / (fromInteger (n+1)^2)
\end{code}

\textbf{1-14} Имеется три ящика, в каждом из которых лежат шары с номерами от \prg{0} до \prg{n}. Из каждого ящика вынимается по одному шару. Какова вероятность того, что вынуты три разных числа? Написать функцию, которая это вычисляет: \prg{diff3 :: Integer {\AR} Float}.

Мое решение:
\begin{code}
diff3 :: Integer -> Float
diff3 n | n<0 = undefined
        | n==1 || n==0 = 0.0
        | otherwise = fromInteger(n*(n-1)) / fromInteger(x*x)
                    where x = (n+1)

\end{code}

\textbf{1-15} Написать функцию \prg{gcd3 :: Integer {\AR} Integer {\AR} Integer {\AR} Integer}, вычисляющую \textbf{НОД}$(a,b,c)$, наибольший общий делитель чисел $a$, $b$ и $c$.

Мое решение:
\begin{code}
gcd3 :: Integer -> Integer -> Integer -> Integer
gcd3 a b c = gcd (gcd a b) c
\end{code}

\textbf{1-16} Написать функцию \prg{lcm2 :: Integer {\AR} Integer {\AR} Integer}, вычисляющую  \textbf{НОК}$(a,b)$, наименьшее общее кратное чисел $a$ и $b$.

Мое решение:
\begin{code}
lcm2 :: Integer -> Integer -> Integer
lcm2 = lcm
\end{code}

\textbf{1-17} Написать функцию \prg{lcm3 :: Integer {\AR} Integer {\AR} Integer {\AR} Integer}, вычисляющую  \textbf{НОК}$(a,b,c)$, наименьшее общее кратное чисел $a$, $b$ и $c$.

Мое решение:
\begin{code}
lcm3 :: Integer -> Integer -> Integer -> Integer
lcm3 a b c = lcm2 (lcm2 a b) c
\end{code}

\textbf{1-18} Написать функцию \prg{lcm3gcd :: Integer {\AR} Integer {\AR} Integer {\AR} Integer}, вычисляющую  для заданных чисел $a$, $b$ и $c$ значение выражения $\mbox{\textbf{НОК}}(\mbox{\textbf{НОД}}(a,b),\mbox{\textbf{НОД}}(b,c),\mbox{\textbf{НОД}}(c,a))$.

Мое решение:
\begin{code}
lcm3gcd :: Integer -> Integer -> Integer -> Integer
lcm3gcd a b c = lcm3 (gcd a b) (gcd b c) (gcd c a)
\end{code}

\textbf{1-19} Написать функцию \prg{pps :: [[Integer]] {\AR} [Integer]}, объединяющую любое число списков.

Мое решение:
\begin{code}
pps :: [[Integer]] -> [Integer]
pps = concat
\end{code}
%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%
\section{Корни уравнений}

\textbf{2-1} Написать функцию \prg{abRoot :: Float {\AR} Float {\AR} Float}, вычисляющую корень уравнения $ax+b=0$.  Если корней нет или их бесконечно много, то функция не определена.

Мое решение:
\begin{code}
abRoot :: Float -> Float -> Float
abRoot a b | a == 0 = undefined
           | otherwise = (-b)/a
\end{code}

\textbf{2-2} Написать функцию
\begin{semicode}
abcRoots :: Float -> Float -> Float -> [Float]
\end{semicode}
которая по заданным коэффициентам $a$, $b$ и $c$ будет вычислять список корней уравнения $ax^2+bx+c=0$.  Если корней бесконечно много, то функция не определена.

\begin{code}
abcRoots :: Float -> Float -> Float -> [Float]
abcRoots 0 0 0  = undefined
abcRoots 0 0 c  = []
abcRoots 0 b c  = [-c / b]
abcRoots a b c   | d <  0 = []
                 | d == 0 = [-b / t]
                 | d >  0 = [(-b + g) / t, (-b - g) / t]
                 where  d = b*b - 4.0*a*c
                        g = sqrt d
                        t = 2.0*a
\end{code}

\textbf{2-3} Написать функцию \prg{ab\_Roots :: Float {\AR} Float {\AR} [Float]}, которая вычисляет список корней уравнения $ax^2+bx=0$.  Если корней бесконечно много, то функция не определена.

Мое решение:
\begin{code}
ab_Roots :: Float -> Float -> [Float]
ab_Roots a b = abcRoots a b 0
\end{code}

\textbf{2-4} Написать функцию
\begin{semicode}
abcdRoots :: Float -> Float -> Float -> Float -> [Float]
\end{semicode}
вычисляющую корни уравнения $(ax^2+bx+c)(x+d)=0$.
Если корней бесконечно много, то функция не определена.

Мое решение:
\begin{code}
abcdRoots :: Float -> Float -> Float -> Float -> [Float]
abcdRoots a b c d = (abcRoots a b c)++[-d]
\end{code}

\textbf{2-5} Написать функцию
\begin{semicode}
abcdeRoots ::
    Float -> Float ->Float -> Float -> Float ->  [Float]
\end{semicode}
вычисляющую корни уравнения $(ax^2+bx+c)(dx^2+e)=0$. Если корней бесконечно много, то функция не определена.

Мое решение:
\begin{code}
abcdeRoots :: Float -> Float ->Float -> Float -> Float -> [Float]
abcdeRoots a b c d e = (abcRoots a b c)++(abcRoots d 0 e)


\end{code}

\textbf{2-6} Написать функцию \prg{absRoots :: Float {\AR} Float {\AR} [Float]}, которая вычисляет корни уравнения $|x-a|=b$.

Мое решение:
\begin{code}
absRoots :: Float -> Float -> [Float]
absRoots a b  | b<0 = []
              | b == 0 = [a]
              | otherwise = [a+b,a-b]


\end{code}

\textbf{2-7} Написать функцию
\begin{semicode}
abs2Roots :: Float -> Float -> Float ->[Float]
\end{semicode}
вычисляющую корни уравнения $|x-a|+|x-b|=c$.
Если корней бесконечно много, то функция не определена.

Мое решение:
\begin{code}
abs2Roots :: Float -> Float -> Float ->[Float]
abs2Roots a b c | c < d = []
                | c > d = [(a+b-c)/2,(a+b+c)/2]
                | c == d && d /= 0 = undefined
                | c == d && d == 0 = [a]
                where d = abs(a-b)
\end{code}

\textbf{2-8} Написать функцию
\begin{semicode}
absabs2Roots :: Float -> Float -> Float ->[Float]
\end{semicode}
вычисляющую корни уравнения  $||x-a|+|x-b||=c$.
Если корней бесконечно много, то функция не определена.

Мое решение:
\begin{code}
absabs2Roots = abs2Roots
\end{code}

\textbf{2-9} Написать функцию \prg{min\_ab\_Root :: Float {\AR} Float {\AR} Float}, которая будет вычислять меньший из корней уравнения $ax^2+bx=0$. Если корней нет или их бесконечно много, то функция не определена.

Решение:
\begin{code}
min_ab_Root :: Float -> Float -> Float
min_ab_Root 0 0 = undefined
min_ab_Root a b = minimum(ab_Roots a b)
\end{code}

\textbf{2-10} Написать функцию с типом
\begin{semicode}
min_abcdRoot :: Float -> Float -> Float -> Float -> Float
\end{semicode}
вычисляющую меньший из корней уравнения $(ax^2+bx+c)(x+d)=0$. Если корней бесконечно много, то функция не определена.

Мое решение:
\begin{code}
min_abcdRoot :: Float -> Float -> Float -> Float -> Float
min_abcdRoot a b c d = minimum(abcdRoots a b c d)
\end{code}

\textbf{2-11} Написать функцию
\begin{semicode}
min_abcdeRoot ::
    Float -> Float -> Float -> Float -> Float -> Float
\end{semicode}
вычисляющую меньший из корней уравнения \((ax^2+bx+c)(dx^2+e)=0\). Если корней нет или их бесконечно много, то функция не определена.

Мое решение:
\begin{code}
min_abcdeRoot :: Float -> Float -> Float -> Float -> Float -> Float
min_abcdeRoot a b c d e = minimum( abcdeRoots a b c d e)
\end{code}

\textbf{2-12} Написать функцию, которая вычисляет меньший из корней уравнения $|x-a|=b$: \prg{min\_absRoot :: Float {\AR} Float {\AR} Float}. Если корней нет, то функция не определена.

Мое решение:
\begin{code}
min_absRoot :: Float -> Float -> Float
min_absRoot a b = minimum(absRoots a b)
\end{code}

\textbf{2-13} Написать функцию
\begin{semicode}
min_2absRoot :: Float -> Float -> Float -> Float
\end{semicode}
вычисляющую меньший из корней уравнения $|x-a|+|x-b|=c$. Если корней нет, то функция не определена.

Мое решение:
\begin{code}
min_2absRoot :: Float -> Float -> Float -> Float
min_2absRoot a b c | c >= d = (a+b-c)/2
                   where d = abs(a-b)
\end{code}

\textbf{2-14} Написать функцию
\begin{semicode}
min_abs2absRoot :: Float -> Float -> Float -> Float
\end{semicode}
вычисляющую меньший из корней уравнения $||x-a|+|x-b||=c$. Если корней нет, то функция не определена.

Мое решение:
\begin{code}
min_abs2absRoot = min_2absRoot
\end{code}

%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%
\section{Вычислительные задачи}

\textbf{3-1} Напишите функцию, вычисляющую сумму квадратов всех чисел из отрезка \prg{[1 .. n]}: \prg{sumSq :: Int {\AR} Int}.

Мое решение:
\begin{code}
sumSq :: Int -> Int
sumSq n = (n*(n+1)*(2*n+1)) `div` 6 
\end{code}

\textbf{3-2} Написать функцию \prg{fibs :: [Integer]}, вычисляющую последовательность чисел Фибоначчи (последовательность начинается с нуля).

Мое решение:
\begin{code}
fibs :: [Integer]
fibs = 0:1:(zipWith (+) fibs (tail fibs))
\end{code}

\textbf{3-3} Написать функцию \prg{bins :: Integer {\AR} [Integer]}, вычисляющую список биномиальных коэффициентов для многочлена порядка $n$.

Мое решение:
\begin{code}
bins :: Integer -> [Integer]
bins n | n>=0 = ((map fst).(takeWhile a).(iterate b))(1,0)
       where a (c,k) = k <= n
             b (c,k) = let m = k+1 in (c * (n-k) `div` m, m)


\end{code}

\textbf{3-4} Основание натурального логарифма $e$ можно определить как:
\[
 e = \sum_{n=0}^\infty \frac{1}{n!}
\]
Напишите функцию, которая вычисляет \prg{eApr $\epsilon$ {\AR} $e'$} число $e$ с заданной точностью $\epsilon > 0$, суммируя все слагаемые из указанной суммы, большие или равные $\epsilon$:  \prg{eApr :: Float {\AR} Float}.

Мое решение:
\begin{code}
eApr :: Float -> Float
eApr eps | eps > 0 = (sum.(takeWhile (>= eps)).(map fst))(iterate h (1.0, 0.0))
         where h (t, n) = let m = n + 1.0 in (t / m, m)
\end{code}

\textbf{3-5} Для заданного $a \geq 0$ с заданной точностью $d$ требуется вычислить $\sqrt{a}$ при помощи алгоритма Герона, который основан на построении следующей последовательности чисел, сходящейся к значению $\sqrt{a}$:
\begin{itemize}
    \item $x_1 = 1$;
    \item $x_{n+1} = \frac{1}{2}(x_n + \frac{a}{x_n})$;
    \item условие достижения требуемой точности  $|x_{n+1} - x_n| \leq d$, в этом случае $x_{n+1}$~--- результат работы алгоритма Герона.
\end{itemize}
Написать функцию \prg{sqrtH :: Float {\AR} Float {\AR} Float}, которая по заданным $a$ и $d$ вычисляет приближение $\sqrt {a}$.

Мое решение:
\begin{code}
sqrtH :: Float -> Float -> Float
sqrtH a d | d<=0 || a < 0 = undefined
          | otherwise = step (iterate (\ xn -> (xn+a/xn)/2)1)
    where step (x:xs@(nextd : _)) | abs (nextd - x) <= d = nextd
                                  | otherwise = step xs 
\end{code}

%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%
\section{Числа и цифры}

Для решения группы задач, связанных с позиционными системами исчисления, рекомендуется (не обязательно, но рекомендуется!) вначале изучить (можно в Википедии) тему позиционных систем (стандартных и симметричных) и написать три вспомогательные функции.

\textbf{Функция revdigs.} 
Определите функцию перевода в любую позиционную систему (стандартную или симметричную), реверсный порядок цифр, без проверки допустимости аргументов:
\begin{semicode}
revdigs :: (Integer -> (Integer, Integer)) ->
           Integer -> [Integer]
\end{semicode}
Первый параметр~--- функция \prg{dm :: Integer {\AR} (Integer, Integer)} отделения младшей цифры от числа.  В случае стандартных позиционных систем:
\begin{semicode}
dm n = divMod n k
\end{semicode}
где \prg{k}~--- основание системы.

Мое решение:
\begin{code}
revdigs :: (Integer -> (Integer, Integer)) -> Integer -> [Integer]
revdigs dm n | d == 0    = [m]
             | otherwise = m : (revdigs dm d)
             where (d, m) = dm n
\end{code}

\textbf{Функция revsetun.} 
Определите функцию
\begin{semicode}
revsetun :: Integer -> [Integer]
\end{semicode}
переводa в симметричную троичную позиционную систему, реверсный порядок цифр.

Мое решение:
\begin{code}
revsetun :: Integer -> [Integer]
revsetun n = revdigs (dm) n
    where dm k = let (d, m) = divMod k 3 in
                 if m == 2 then (d + 1, -1) else (d, m)
\end{code}

\textbf{Функция revfigs.} 
Определите функцию
\begin{semicode}
revfigs :: Integer -> Integer -> [Integer]
\end{semicode}
перевода в любую стандартную k-ичную позиционную систему, с проверкой допустимости аргументов, реверсный порядок цифр.

Мое решение:
\begin{code}
revfigs :: Integer -> Integer -> [Integer]
revfigs k n | k > 1 && n >= 0 = revdigs (\ x -> divMod x k) n
\end{code}

\textbf{4-1} Написать функцию \prg{binary\_dgts :: Integer {\AR} [Integer]}, переводящую число \prg{n >= 0} в список его двоичных цифр.

Мое решение:
\begin{code}
binary_dgts :: Integer -> [Integer]
binary_dgts n = k_ary_dgts n 2 
\end{code}

\textbf{4-2} Написать функцию
\begin{semicode}
ternary_dgts :: Integer -> [Integer]
\end{semicode}
переводящую число \prg{n >= 0} в список его троичных цифр.

Мое решение:
\begin{code}
ternary_dgts :: Integer -> [Integer]
ternary_dgts n = k_ary_dgts n 3
\end{code}

\textbf{4-3} Написать функцию
\begin{semicode}
decimal_dgts :: Integer -> [Integer]
\end{semicode}
переводящую число \prg{n >= 0} в список его десятичных цифр.

Мое решение:
\begin{code}
decimal_dgts :: Integer -> [Integer]
decimal_dgts n = k_ary_dgts n 10
\end{code}

\textbf{4-4} Написать функцию
\begin{semicode}
k_ary_dgts :: Integer -> Integer -> [Integer]
\end{semicode}
переводящую число \prg{n >= 0} в список его цифр в системе счисления по основанию \prg{k > 1}.

Мое решение:
\begin{code}
k_ary_dgts :: Integer -> Integer -> [Integer]
k_ary_dgts n k= reverse (revfigs k n)
\end{code}

\textbf{4-5} Написать функцию
\begin{semicode}
setun_dgts :: Integer -> [Integer]
\end{semicode}
переводящую число $n$ в список его цифр в троичной симметричной системе счисления (троичных цифр машины <<Сетунь>>).

Мое решение:
\begin{code}
setun_dgts :: Integer -> [Integer]
setun_dgts = reverse.revsetun
\end{code}

\textbf{4-6} Написать функцию \prg{s2dgts :: Integer {\AR} Integer}, вычисляющую сумму последних двух цифр десятичной записи числа.

Мое решение:
\begin{code}
s2dgts :: Integer -> Integer
s2dgts n | l > 9 = (sum.(take 2).(revfigs 10)) l
         where l = abs n
\end{code}

\textbf{4-7} Написать функцию \prg{p3dgts :: Integer {\AR} Integer}, вычисляющую произведение последних трех цифр десятичной записи числа.

Мое решение:
\begin{code}
p3dgts :: Integer -> Integer
p3dgts n | l > 99 = (product.(take 3).(revfigs 10)) l
         where l = abs n
\end{code}

\textbf{4-8} Написать функцию \prg{l4dgts :: Integer {\AR} [Integer]}, выдающую список из последних четырех цифр числа.

Мое решение:
\begin{code}
l4dgts :: Integer -> [Integer]
l4dgts n | l > 999 = (reverse.(take 4).(revfigs 10)) l
         where l = abs n
\end{code}

%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%
\section{Строки и символы}

\textbf{5-1} Написать функцию \prg{dgt\_chr :: Integer {\AR} Char}, которая позволяет перевести цифру в символ. Функция не определена, если параметр не из отрезка \prg{[0..9]}.

Мое решение:
\begin{code}
dgt_chr :: Integer -> Char
dgt_chr n | n >= 0 && n <= 9 = toEnum ((fromInteger n) + (fromEnum '0'))
          | otherwise = undefined

\end{code}

\textbf{5-2} Написать функцию \prg{chr\_dgt :: Char {\AR} Integer}, которая позволяет перевести символ в цифру. Функция не определена, если параметр не является символом-цифрой.

Мое решение:
\begin{code}
chr_dgt :: Char -> Integer
chr_dgt n | n >= '0' && n <= '9' = toInteger((fromEnum n) - (fromEnum '0'))
          | otherwise = undefined
\end{code}

\textbf{5-3} Написать функцию \prg{sumDigits :: String {\AR} Int}, складывающую все цифры в строке, например:
\begin{semicode}
main:> sumDigits "CA 90210"
12

main:> sumDigits "No digits here!"
0
\end{semicode}

Мое решение:
\begin{code}
sumDigits :: String -> Int
sumDigits = sum.(map tmp).filter isDigit
   where tmp n = (ord n) - ord '0' :: Int
\end{code}

\textbf{5-4} Написать функцию \prg{upAlpha :: String {\AR} String}, которая выбирает из строки все латинские буквы и переводит их в верхний регистр, например:
\begin{semicode}
main:> upAlpha "Hello, World!"
"HELLOWORLD"

main:> upAlpha "Hi."
"HI"
\end{semicode}

Мое решение:
\begin{code}
upAlpha :: String -> String

upAlpha = (map toUpper).filter isAlpha
\end{code}

\textbf{5-5} Пусть имя человека записывается только в одном из трех форматов <<фамилия>>, <<имя фамилия>>, <<имя отчество фамилия>>. Определите функцию \prg{abbrev :: [String] {\AR} [String]}, которая в заданном списке имен людей, например:
\begin{semicode}
   xs = ["Синицин", "Игорь Федорович Поддубный", "Сергей Елкин"]
\end{semicode}
выполняет сокращение имен и отчеств до инициалов:
\begin{semicode}
   abbrev xs = ["Синицин", "И. Ф. Поддубный", "С. Елкин"]
\end{semicode}

Мое решение:
\begin{code}

\end{code}

%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\
\section{Кредит и его погашение}

\textbf{6-1} Василий Пыжиков берет в кредит \prg{k > 0} долларов. Годовая процентная ставка по кредиту \prg{p > 0}. Ежемесячно Василий обязуется отдавать \prg{x > 0} долларов, и это постепенно гасит кредит.
Написать функцию, которая выдает список задолженностей Василия перед банком по месяцам:
\begin{semicode}
balances :: Float -> Float -> Float -> [Float]
\end{semicode}
Первый элемент списка (нулевой месяц, месяц получения кредита)~--- \prg{k}, последний элемент (месяц завершения выплат по кредиту)~--- 0.
Функция не определена (и это верно для всех функций данного раздела) в случае некорректных исходных данных, в том числе если выплаты малы для погашения кредита.

Мое решение:
\begin{code}
balances :: Float -> Float -> Float -> [Float]
balances k p x  | k<=0 || p<=0 || x<=0 = undefined
                | k <= amount_with_percents k = undefined
                | otherwise = k : get_current_balance (amount_with_percents k)
                where amount_with_percents credit_amount = credit_amount * percent_per_month - x
                      percent_per_month = 1+p/1200
                      get_current_balance :: Float -> [Float]
                      get_current_balance current | current < 0 = [0]
                                                  | otherwise = current : get_current_balance (amount_with_percents current)
\end{code}

\textbf{6-2} Василий Пыжиков берет в кредит \prg{k > 0} долларов. Годовая процентная ставка по кредиту \prg{p > 0}. Ежемесячно Василий обязуется отдавать \prg{x > 0} долларов, и это постепенно гасит кредит.
Написать функцию \prg{balance :: Float {\AR} Float {\AR} Float {\AR} Integer {\AR} Float}, которая выдает задолженность Василия перед банком в месяц $m$.

Мое решение:
\begin{code}

\end{code}

\textbf{6-3} Василий Пыжиков берет в кредит \prg{k > 0} долларов. Годовая процентная ставка по кредиту \prg{p > 0}. Ежемесячно Василий обязуется отдавать \prg{x > 0} долларов, и это постепенно гасит кредит.
Через сколько лет он выплатит кредит? Написать функцию \prg{credit\_years :: Float {\AR} Float {\AR} Float {\AR} Float}, которая вычисляет эту величину.

Мое решение:
\begin{code}
credit_years :: Float -> Float -> Float -> Float
credit_years k p x = fromInteger(toInteger(length (balances k p x) - 1)) / 12
\end{code}

\textbf{6-4} Василий Пыжиков берет в кредит \prg{k > 0} долларов. Годовая процентная ставка по кредиту \prg{p > 0}. Ежемесячно Василий обязуется отдавать \prg{x > 0} долларов, и это постепенно гасит кредит.
Написать функцию, которая выдает список задолженностей Василия перед банком по годам: \begin{semicode}
balances_y :: Float -> Float -> Float -> [Float]
\end{semicode}
Первый элемент списка~--- \prg{k} (нулевой год~--- момент получения кредита),  второй элемент~--- долг перед банком после 1 года (после 12 месяцев), последний элемент~--- 0 (год, когда завершили выплаты по кредиту).

Мое решение:
\begin{code}

\end{code}

%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\
\section{Делители и простые числа}

\textbf{7-1} Написать функцию \prg{denominators :: Integer {\AR} [Integer]}, переводящую число \prg{n /= 0} в список его неотрицательных делителей (по возрастанию).

Moe решение:
\begin{code}
denominators :: Integer -> [Integer]
denominators n | n /= 0 =   if abs_n == 1 then [1] 
                            else 1:[ x | x <- [2 .. fin], n `mod` x == 0] ++ [abs_n]
                            where abs_n = abs n
                                  fin = abs_n `div` 2
\end{code}

\textbf{7-2} Написать функцию \prg{isPrime :: Integer {\AR} Bool} проверки простоты заданного числа $n > 1$.

Мое решение:
\begin{code}

\end{code}

%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\
\section{Операторы}

\textbf{8-1} Написать оператор \prg{(.+.) :: Integer {\AR} Integer {\AR} Integer}, вычисляющий сумму общих делителей двух чисел.

Мое решение:
\begin{code}
(.+.) :: Integer -> Integer -> Integer
(.+.) a b = sum(denominators(gcd a b))
\end{code}

\textbf{8-2} Написать оператор \prg{(./.) :: Integer {\AR} Integer {\AR} Integer}, который из двух чисел выдает то, у которого больше нулей в десятичной записи.

Мое решение:
\begin{code}

\end{code}

\textbf{8-3} Написать оператор \prg{(.-:) :: Integer {\AR} Integer {\AR} Integer}, который из двух чисел выдает то, у которого меньше наименьший делитель, больший 1.
Если для аргументов (или для одного из них) не удается найти делитель, больший 1, то функция не определена.

Мое решение:
\begin{code}

\end{code}

\textbf{8-4} Написать оператор \prg{(.+:) :: Integer {\AR} Integer {\AR} Integer}, который из двух чисел выдает то, у которого больше наименьший делитель, больший 1.
Если для аргументов (или для одного из них) не удается найти делитель, больший 1, то функция не определена.

Мое решение:
\begin{code}

\end{code}

\textbf{8-5} Определить оператор
\begin{semicode}
(.^) :: Float -> Integer -> Float
\end{semicode}
который в качестве первого параметра принимает начальную цену товара, в качестве второго параметра~--- количество месяцев и выдает, какая будет цена товара через этот период. Среднегодовой коэффициент инфляции принять равным \prg{0.7}.

Мое решение:
\begin{code}

\end{code}

\textbf{8-6} Написать оператор
\begin{semicode}
(.@) :: [String] -> String -> [String]
\end{semicode}
который в качестве первого параметра принимает список имен (например, <<aaron>>, <<asya>>, <<boris>>), в качестве второго параметра~--- имя домена (например, <<mail.ru>>) и выдает список возможных e-mail для рассылки электронных писем (<<aaron@mail.ru>>, <<asya@mail.ru>>, <<boris@mail.ru>>).

Мое решение:
\begin{code}

\end{code}

\textbf{8-7} Написать оператор \prg{(.*.) :: Integer {\AR} Integer {\AR} Integer}, который из двух чисел выдает то, у которого больше произведение десятичных цифр.

Мое решение:
\begin{code}

\end{code}

%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\
\section{Списки}

\textbf{9-1} Написать функцию
\prg{inRange :: Int {\AR} Int {\AR} [Int] {\AR} [Int]},
которая возвращает все элементы списка в заданных рамках (включительно), например:
\begin{semicode}
main:> inRange 5 10 [1..15]
[5,6,7,8,9,10]
\end{semicode}

Мое решение:
\begin{code}
inRange :: Int -> Int -> [Int] -> [Int]
inRange a b xs = [ x | x <- xs, x >= a, x <= b] 
\end{code}

\textbf{9-2} Напишите функцию
\prg{pairs :: Int {\AR} [(Int, Int)]},
которая строит список всех различных пар $(x, y)$, таких, что $1 \leq x \leq n$, $1 \leq y \leq n$.

Мое решение:
\begin{code}
pairs :: Int -> [(Int,Int)]
pairs n = [(x,y) | x <- [1..n], y <- [1..n]]
\end{code}

\textbf{9-3} Написать функцию \prg{idxs :: Eq a $\Rightarrow$ [a] {\AR} a {\AR} [Int]}, которая находит в списке все вхождения элементов, равных \prg{(==)} заданному, и выдает позиции, в которых он встретился, например:
\begin{semicode}
main:> idxs "Bookshop" 'o'
[1,2,6]

main:> idxs "senselessness's" 's'
[0,3,7,8,11,12,14]
\end{semicode}

Мое решение:
\begin{code}
idxs :: Eq a => [a] -> a -> [Int]
idxs = flip elemIndices
\end{code}

\textbf{9-4} Написать функцию, которая  удаляет из списка все элементы, больше заданного: \prg{delGt:: Ord a $\Rightarrow$ a {\AR} [a] {\AR} [a]}.

Мое решение:
\begin{code}
delGt:: Ord a => a -> [a] -> [a]
delGt n = filter(<= n)
\end{code}

\textbf{9-5} Дан список \prg{[Float]} вещественных чисел $x_1 \leq x_2 \leq \dots \leq x_n$ и дано вещественное число $y$. Напишите функцию \prg{fsearch :: [Float] {\AR} Float {\AR} Int}, вычисляющую такое $k$, что $x_k < y \leq x_{k+1}$.

\textbf{Особые случаи}.
Если список пустой или $y \leq x_1$, то функция возвращает \prg{0}.
Если $x_n < y$, то функция возвращает $n$.

Мое решение:
\begin{code}

\end{code}

\textbf{9-6} Написать функцию \prg{remdumps :: Eq a $\Rightarrow$ [a] {\AR} [a]}, которая удаляет копии одинаковых соседних элементов из списка, используя \prg{foldr}:
\begin{semicode}
main:> remdumps [1,2,2,3,3,3,1,1]
[1,2,3,1]
\end{semicode}

Мое решение:
\begin{code}

\end{code}

\textbf{9-7} Определите функцию \prg{chkDups :: Eq a $\Rightarrow$ [a] {\AR} Bool}, возвращающую \prg{True}, если в списке, являющемся ее аргументом, дважды содержится хотя бы один элемент.
\begin{semicode}
main:> chkDups [1,2,3,4,5]
False

main:> chkDups [1,2,3,2]
True
\end{semicode}
Мое решение:
\begin{code}

\end{code}

\textbf{9-8} Напишите функцию \prg{isSorted :: Ord a $\Rightarrow$ [a] {\AR} Bool}, возвращающую \prg{True}, если ее аргумент~--- отсортированный список, \prg{True}~--- иначе.

Мое решение:
\begin{code}

\end{code}

\textbf{9-9} Имеется список слов \prg{ys}, расположенных в алфавитном порядке. Написать функцию
\prg{insWord :: String {\AR} [String] {\AR} [String]}
вставки нового слова \prg{x} в список \prg{ys} с сохранением порядка, при условии, что \prg{x} в \prg{ys} нет (если уже есть, то \prg{x} не вставляется в \prg{ys}).

Мое решение:
\begin{code}

\end{code}

\textbf{9-10} Имеется список слов \prg{ys}, расположенных в алфавитном порядке.  Написать функцию
\prg{insWords :: [String] {\AR} [String] {\AR} [String]},
которая все слова \prg{x} из \prg{xs} добавляет в \prg{ys}, в соответствии с условиями задачи 9-9.

Мое решение:
\begin{code}

\end{code}

\textbf{9-11} Напишите функцию \prg{substrings :: String {\AR} [String]}, которая по заданной строке возвращает все возможные уникальные (неповторяющиеся) подстроки.

Мое решение:
\begin{code}

\end{code}

\textbf{9-12} Перестановкой называется список, состоящий из тех же элементов, что и исходный список, но расположенных в другом порядке. Например, \prg{[1,2,1]} является перестановкой \prg{[2,1,1]}. Напишите функцию
\begin{semicode}
isPermutation :: Eq a => [a] -> [a] -> Bool
\end{semicode}
возвращающую \prg{True}, если один из ее аргументов является перестановкой другого.

Мое решение:
\begin{code}

\end{code}

\textbf{9-13} Напишите функцию
\prg{qs :: Int {\AR} [(Int, Int, Int, Int)]},
которая находит список
всех различных четверок $(a, b, c, d)$, таких, что числа $(a, b, c, d)$ взаимно простые, $a^2 + b^2 = c^2 + d^2$ и
$1 \leq a < c  \leq d < b \leq n$.

Мое решение:
\begin{code}

\end{code}

%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\
\section{Сопоставление с образцом}

В Unix shell можно писать, например, такие образцы: \prg{*.hs}, которые сопоставляются с некоторым множеством имен файлов.

Формальные правила сопоставления образца $p$ со строкой $s$ следующие:
\begin{itemize}
 \item пустой образец сопоставляется только с пустой строкой;
 \item символ звездочка \prg{'*'} сопоставляется с любой (возможно и пустой) последовательностью символов;
 \item любой другой символ сопоставляется только с таким же символом;
 \item если образец $p'$ сопоставляется сo строкой $s'$, а образец $p''$ сопоставляется сo строкой $s''$, то образец $p'\,p''$ сопоставляется сo строкой $s'\,s''$.
\end{itemize}

\textbf{10-1} Напишите функцию
\prg{pmatch :: String {\AR} String {\AR} Bool},
которая проверяет, сопоставляется ли образец \prg{p} со строкой \prg{s}.

Мое решение:
\begin{code}

\end{code}

%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\
\section{Ханойская башня}

Головоломка <<Ханойская башня>> устроена следующим образом. На доске есть три иглы (1, 2, 3). На игле 1 размещена башня из \prg{n} дисков; нижний диск имеет самый большой диаметр, а диаметр каждого следующего диска (над ним) меньше предыдущего.

За один ход с любой иглы $i \in \{1, 2, 3\}$ можно взять один верхий диск и переместить его на другую иглу $j \in \{1, 2, 3\}$. Однако разрешено класть диск лишь либо на доску (то есть до хода игла $j$ была пустой), либо на диск большего диаметра, который до хода был верхним на игле $j$.

Каждый ход записывают парой \prg{($i$, $j$) :: (Int, Int)}, а последовательность ходов записывают при помощи списка подобных пар.

\textbf{Цель головоломки.} Нужно найти последовательность ходов для перемещения всей башни с иглы 1 на иглу 3.

\textbf{Решение головоломки.} Рассматривается такой алгоритм решения головоломки.  Для переноса башни из $n$ дисков с иглы 1 на иглу 3 (используя вспомогательную иглу 2) необходимо:
\begin{itemize}
    \item перенести башню из $(n-1)$ дисков с диска 1 на иглу 2,  используя вспомогательную иглу 3;
    \item затем одним шагом перенести нижний диск с иглы 1 на иглу 3;
    \item затем перенести башню из $(n-1)$ дисков с диска 2 на иглу 3, используя вспомогательную иглу 1.
\end{itemize}


\textbf{11-1} Напишите функцию
\prg{hanoiSteps :: Int {\AR} [(Int, Int)]},
вычисляющую цепочку ходов, необходимых для того, чтобы решить головоломку для заданного \prg{n}~--- переместить \prg{n} дисков с 1-й иглы на 3-ю.

Мое решение:
\begin{code}

\end{code}

\textbf{11-2} Напишите функцию
\prg{hanoiNum :: Integer {\AR} Integer},
вычисляющую количество ходов, необходимых для того, чтобы решить головоломку для заданного \prg{n}~--- переместить \prg{n} дисков с 1-й иглы на 3-ю.

\textbf{Замечание:} функция \prg{hanoiNum} должна вычисляться для весьма больших \prg{n}.  Поэтому не следует функцию \prg{hanoiNum} писать с использованием \prg{hanoiSteps} (по идее <<построим список ходов, потом посчитаем длину списка>>), такой подход не пройдет (например, из-за нехватки памяти).

Мое решение:
\begin{code}

\end{code}

%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\
\section{Точки на 2D-плоскости}

О представлении точек на 2D-плоскости читайте в разделе~\ref{s:points} на странице~\pageref{s:points} (модуль \prg{ExtraTypes}).

\textbf{12-1} Напишите функцию
\begin{semicode}
dist2D :: Point2D -> Point2D -> Float
\end{semicode}
вычисляющую расстояние  $\rho(A(x_1,y_1), B(x_2,y_2))$ между точками.

Мое решение:
\begin{code}

\end{code}

\textbf{12-2} Напишите функцию
\begin{semicode}
dist2Ds :: Point2D -> [Point2D] -> [Float]
\end{semicode}
вычисляющую расстояния от заданной точки до всех точек, перечисленных в списке.

Мое решение:
\begin{code}

\end{code}

\textbf{12-3} Напишите функцию \prg{minDist2Ds :: [Point2D] {\AR} Float}, находящую минимальное расстояние между разными точками из заданного списка:
%\begin{flushleft}
\prg{minDist2Ds [$p_1, \ldots p_n$]
     = $min\{\rho(p_i,p_j)\,|\, 1 \leq i<j \leq n\}$
    }.
%\end{flushleft}

Мое решение:
\begin{code}

\end{code}

%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%
\section{Контакты}

О представлении списков контактов читайте в разделе~\ref{s:contacts} на странице~\pageref{s:contacts} (модуль \prg{ExtraTypes}).

\textbf{13-1} Определите функцию \prg{emails :: Contacts {\AR} [Email]}, которая извлекает из списка контактов список (без повторов) всех электронных адресов.

Мое решение:
\begin{code}

\end{code}

\textbf{13-2} Определите функцию
\begin{semicode}
findContacts :: Contacts -> Name -> [(Phone, Email)]
\end{semicode}
которая из списка контактов по имени персоны разыскивает все телефоны и адреса персоны.

Мое решение:
\begin{code}

\end{code}

%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%
\section{Операция с полиномами}

О представлении полиномов структурой данных \prg{Poly} читайте в разделе~\ref{s:pol-x} на странице~\pageref{s:pol-x} (модуль \prg{ExtraTypes}).

\textbf{14-1} Напишите функцию \prg{eqPP :: Poly {\AR} Poly {\AR} Bool}, сравнивающую на равенство два многочлена.

Мое решение:
\begin{code}

\end{code}

\textbf{14-2} Напишите функцию \prg{addPP :: Poly {\AR} Poly {\AR} Poly}, складывающую два многочлена.

Мое решение:
\begin{code}

\end{code}

\textbf{14-3} Напишите функцию \prg{subPP :: Poly {\AR} Poly {\AR} Poly}, вычитающую из одного полинома другой.

Мое решение:
\begin{code}

\end{code}

\textbf{14-4} Напишите функцию \prg{mulPP :: Poly {\AR} Poly {\AR} Poly}, перемножающую два полинома.

Мое решение:
\begin{code}

\end{code}

\textbf{14-5} Напишите функцию \prg{divModPP :: Poly {\AR} Poly {\AR} (Poly, Poly)} деления с остатком одного полинома на другой.
Пусть $A$, $B$~--- произвольные полиномы, \prg{($Q$, $R$) = divModPP $A$ $B$}, пусть $(a, b, q, r)$~--- степени полиномов $(A, B, Q, R)$.  Тогда должно выполняться $A = Q \times B + R$ и $r < b$.

Мое решение:
\begin{code}

\end{code}

\textbf{14-6} Напишите функцию \prg{valPX :: Poly {\AR} Float {\AR} Float}, вычисляющую значение \prg{valPX p x} многочлена \prg{p} при значении переменной \prg{x}.

Мое решение:
\begin{code}

\end{code}

\textbf{14-7} Напишите функцию \prg{mulCP :: Float {\AR} Poly {\AR} Poly}, выполняющую умножение \prg{mulCP c p} многочлена \prg{p} на скаляр \prg{c}.

Мое решение:
\begin{code}

\end{code}

\textbf{14-8} Напишите функцию \prg{povPN :: Poly {\AR} Int {\AR} Poly}, вычисляющую результат \prg{$p^n$ = povPN $p$ $n$} возведения полинома $p$ в степень $n \geq 0$.

Мое решение:
\begin{code}

\end{code}

\textbf{14-9} Напишите функцию \prg{dPdX :: Poly {\AR} Poly}, выполняющую дифференцирование многочлена.

Мое решение:
\begin{code}

\end{code}

\textbf{14-10} Напишите функцию \prg{dNPdXN :: Poly {\AR} Int {\AR} Poly}, вычисляющую производную \prg{dNPdXN p $n$} заданного порядка $n \geq 0$ от полинома \prg{p}.

Мое решение:
\begin{code}

\end{code}

%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%
\section{Операции с полиномами с альтернативным представлением}

Об альтернативном представлении полиномов структурой данных \prg{Poly} читайте в разделе~\ref{s:pol-xx} на странице~\pageref{s:pol-xx} (модуль \prg{ExtraTypes}).

При альтернативном представлении полинома полезно работать с <<упрощенным>> полиномом. В упрощенном полиноме приведены подобные члены, удалены члены с нулевым коэффициентом, все мономы отсортированы: левее~--- мономы с младшими степенями, правее~--- мономы со старшими степенями.

\textbf{15-1} Определите функцию \prg {sim'P :: Poly' {\AR} Poly'}, упрощающую полином (см. пояснения выше).

Мое решение:
\begin{code}

\end{code}

\textbf{15-2} Напишите функцию \prg{eq'PP :: Poly' {\AR} Poly' {\AR} Bool}, сравнивающую на равенство два многочлена.

Мое решение:
\begin{code}

\end{code}

\textbf{15-3} Напишите функцию \prg{add'PP :: Poly' {\AR} Poly' {\AR} Poly'}, складывающую два многочлена.  Результат функция \prg{add'PP} должна возвращать в упрощенном виде.

Мое решение:
\begin{code}

\end{code}

\textbf{15-4} Напишите функцию \prg{sub'PP :: Poly' {\AR} Poly' {\AR} Poly'}, вычитающую из первого аргумента (полинома), второй (полином).  Результат функция \prg{sub'PP} должна возвращать в упрощенном виде.

Мое решение:
\begin{code}

\end{code}

\textbf{15-5} Напишите функцию \prg{mul'PP :: Poly' {\AR} Poly' {\AR} Poly'}, перемножающую два полинома.   Результат функция \prg{mul'PP} должна возвращать в упрощенном виде.

Мое решение:
\begin{code}

\end{code}

\textbf{15-6} Напишите функцию
\begin{semicode}
divMod'PP :: Poly' -> Poly' -> (Poly', Poly')
\end{semicode}
деления с остатком одного полинома на другой.

Мое решение:
\begin{code}

\end{code}

\textbf{15-7} Напишите функцию \prg{val'PX :: Poly' {\AR} Float {\AR} Float}, вычисляющую значение многочлена \prg{p} для заданного значения \prg{x} переменной.

Мое решение:
\begin{code}

\end{code}

\textbf{15-8} Напишите функцию \prg{mul'CP :: Float {\AR} Poly' {\AR} Poly'}, выполняющую умножение многочлена на скаляр.

Мое решение:
\begin{code}

\end{code}

\textbf{15-9} Напишите функцию \prg{pov'PN :: Poly' {\AR} Int {\AR} Poly'}, вычисляющую результат \prg{$p^n$ = pov'PN $p$ $n$} возведения полинома $p$ в степень $n \geq 0$.

Мое решение:
\begin{code}

\end{code}

\textbf{15-10} Напишите функцию,
вычисляющую первую производную многочлена:
\prg{dP'dX :: Poly' {\AR} Poly'}.

Мое решение:
\begin{code}

\end{code}

\textbf{15-11} Напишите функцию \prg{dNP'dXN :: Poly' {\AR} Int {\AR} Poly'}, вычисляющую производную заданного порядка от полинома.

Мое решение:
\begin{code}

\end{code}

%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%
\section{Логические формулы}

О представлении логических формул читайте в разделе~\ref{s:prop} на странице~\pageref{s:prop} (модуль \prg{ExtraTypes}).

\textbf{16-1} Напишите функцию \prg{vars :: Prop {\AR} [String]}, которая возвращает список всех переменных  (без повторов), использованных в логической формуле.

Мое решение:
\begin{code}

\end{code}

\textbf{16-2} Пусть заданы логическая формула и означивание всех переменных из нее некими логическими значениями.  Означивание задается в виде списка пар <<переменная~--- значение>>, например: \prg{[("p"{},  True), ("q"{}, False)]}.
Напишите функцию \prg{evalPV :: Prop {\AR} [(String,Bool)] {\AR} Bool}, которая определяет, истинна ли логическая формула при заданных значениях переменных.

Мое решение:
\begin{code}

\end{code}

\textbf{16-3} Напишите функцию \prg{tauto :: Prop {\AR} Bool},
которая возвращает значение \prg{True}, если логическая формула истинна при любых значениях переменных, и значение \prg{False} в остальных случаях.

Мое решение:
\begin{code}

\end{code}

\textbf{16-4} Напишите функцию \prg{contra :: Prop {\AR} Bool},
которая возвращает значение \prg{True}, если логическая формула ложна при любых значениях переменных, и значение \prg{False} в остальных случаях.

Мое решение:
\begin{code}

\end{code}

%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\
\section{Арифметические выражения}

О представлении арифметических выражений читайте в разделе~\ref{s:expr} на странице~\pageref{s:expr} (модуль \prg{ExtraTypes}).

\textbf{17-1} Пусть задано арифметическое выражение и означивание всех переменных из выражения некими значениями.  Означивание задается в виде списка пар <<переменная~--- значение>>, например: \prg{[("p"{}, -1.7), ("q"{}, 3.14)] :: [(String,Float)]}.
%
Напишите функцию, вычисляющую значение арифметического выражения при заданных значениях переменных:
\begin{semicode}
evalEV :: Expr -> [(String,Float)] -> Float
\end{semicode}


Мое решение:
\begin{code}

\end{code}

\textbf{17-2} Напишите функцию \prg{ddv :: Expr {\AR} String {\AR} Expr} дифференцирования выражения, принимающую на вход выражение и переменную, по которой происходит дифференцирование.

Мое решение:
\begin{code}

\end{code}

%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%
\section{Деревья поиска}

О представлении деревьев поиска читайте в разделе~\ref{s:tree} на странице~\pageref{s:tree} (модуль \prg{ExtraTypes}).

\textbf{18-1} Пусть \prg{a} тип такой, что \prg{Ord a}, \prg{xs :: [a]}~--- отсортированный список конечной длины без повторов элементов. Определите функцию
\begin{semicode}
trees :: Ord a => [a] -> [Tree a]
\end{semicode}
которая по списку \prg{xs} строит список всех различных возможных деревьев \prg{t}, таких, что \prg{xs == flatten t}.

Мое решение:
\begin{code}

\end{code}

\textbf{18-2} Определите функцию \prg{nTrees :: Int {\AR} Integer}, которая по заданному числу \prg{n} вычисляет число всех различных возможных деревьев \prg{t}, таких, что \prg{[1..n] == flatten t}.

\textbf{Замечание:} функция \prg{nTrees} должна вычисляться для весьма больших \prg{n}.  Поэтому не следует функцию \prg{nTrees} писать с использованием \prg{trees} (например, по схеме \prg{length (trees [1..n])}), такой подход не пройдет (из-за огромных необходимых ресурсов: времени счета и памяти).

Мое решение:
\begin{code}

\end{code}

%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%

\input{../ExtraTypes.lhs}

\end{document}