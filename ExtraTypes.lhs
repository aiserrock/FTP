\section{Модуль \prg{ExtraTypes}: типы данных, определенные для решения некоторых задач}
\label{s:ExtraTypes}

В модуле:
\begin{code}
module ExtraTypes where
\end{code}
предопределены типы данных, необходимые для решения задач (рассмотрены далее).

%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%
\subsection{Полиномы от одной переменной}
\label{s:pol-x}

Многочлен степени $n$ от переменной $x$ может быть представлен списком его коэффициентов:
\begin{code}
newtype Poly = MkPoly [Float]
               deriving Show
\end{code}

Коэффициенты в списке следует размещать в порядке возрастания степеней $x$. Например, многочлен:
\begin{center}
   $3.1x^4 + 4.2x^3 + 9.3x + 7.4$,
\end{center}
который есть в точности многочлен:
\begin{center}
   $7.4  + 9.3x + 0.0x^2 + 4.2x^3 + 3.1x^4 $,
\end{center} 
представляется списком: 
\begin{center}
   \prg{МкPoly [7.4, 9.3, 0.0, 4.2, 3.1]}.
\end{center}

%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%
\subsection{Альтернативное представление полинома от одной переменной~--- <<разряженный список>>}
\label{s:pol-xx}

Кроме рассмотренного ранее представления полиномов от одной переменной $x$ (см.~раздел~\ref{s:pol-x}), возможно представление таких полиномов еще в виде <<разряженного списка>>.  При подобном подходе полином:
\[
     3.4x^3 + 2x^4 + 1.5x^3 + 7.1x^5
\]     
будет представлен следующим образом:
\begin{center}
     \prg{[(3.4, 3), (2.0, 4), (1.5, 3), (7.1, 5)]
          :: [(Float, Int)]}
\end{center}

Определим тип-синоним для представления полинома в виде <<разряженного списка>>:
\begin{code}
type Poly' = [(Float, Int)]
\end{code}

%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%
\subsection{Точки на двумерной плоскости}
\label{s:points}

Точка на двумерной плоскости может быть представлена парой ее координат:
\begin{code}
newtype Point2D = MkP2D (Float, Float)
                  deriving Show
\end{code}

%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%
\subsection{Логические формулы}
\label{s:prop}

Логической формулой $p$ называют формулу вида:
\begin{itemize}
  \item имя переменной~--- строка;
  \item булевская константа~--- \prg{True} или \prg{False};
  \item $p' \wedge p''$;
  \item $p' \vee p''$;
  \item $\lnot p'$
\end{itemize}
где $p'$ и $p''$~--- логические формулы.

Определим тип данных \prg{Prop} для представления логических формул:
\begin{code}
data Prop = Var String
          | Const Bool
          | And Prop Prop
          | Or  Prop Prop
          | Not Prop
          deriving Show
\end{code}

%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%
\subsection{Арифметическое выражение}
\label{s:expr}

Определим арифметическое выражение следующим образом:
\begin{itemize}
   \item число \prg{n};
   \item переменная \prg{x}, где \prg{x :: String};
   \item сумма двух выражений;
   \item произведение двух выражений.
\end{itemize}
Определим тип данных <<арифметическое выражение>> \prg{Expr}:
\begin{code}
data Expr = VarF String
          | ConstF Float
          | Add Expr Expr
          | Mul Expr Expr
          deriving Show
\end{code}

%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%
\subsection{Список контактов}
\label{s:contacts}

Структуры данных для хранения списка контактов зададим ти\-па\-ми-си\-но\-ни\-ма\-ми:
\begin{code}
type Contact  = (Name, Phone, Email)
type Name     = String
type Phone    = String
type Email    = String
type Contacts = [Contact]
\end{code}

%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%
\subsection{Дерево поиска}
\label{s:tree}

Дерево поиска будет представлено ровно так, как это обсуждалось на лекциях:
\begin{code}
data Tree a = Node a (Tree a) (Tree a) | Leaf
     deriving (Eq, Ord, Show)
\end{code}
