\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cmcmemoir}[2024/02/19 CMC MSU document class]

%%%%%% Опция: статус документа. По умолчанию - чистовик.
\newcommand{\STATUS}{final}
\DeclareOption{draft}{\renewcommand{\STATUS}{draft}}
%%%%%% Опция: подключения пакета minted. По умолчанию он отключён
\newcommand{\MINTED}{}
\DeclareOption{minted}{\renewcommand{\MINTED}{
    \RequirePackage{minted}
}}

%%%%% Опция: подпись научного руководителя
\newcommand{\insertAdvisorShort}{%
}
\newcommand{\advisorshort}[1]{%
  \renewcommand{\insertAdvisorShort}{#1}
}
\newcommand{\insertAdvisorSign}{%
}
\DeclareOption{advsign}{%
  \renewcommand{\insertAdvisorSign}{%
    \vskip \baselineskip
    \raggedleft
    \begin{minipage}{0.58\textwidth}
      {\small\textit{C текстом работы ознакомлен}}
      \vskip 1.5em
      \underline{\hskip 11.5em} \insertAdvisorShort
      \vskip 1em
      <<\underline{\hskip 2em}>>\underline{\hskip 8.5em} \@date~г.
    \end{minipage}
  }
}

%%%% ОПЦИЯ: listings
%%%% Поддержка работы с листингами

\newcommand{\definelistings}{
  %%%%%%%%%%%%%%%%%%%%Обеспечиваем оформление алгоритмов и листингов%%%
%Включение в документ листингов
\RequirePackage{listings}
%решаем проблему с кириллицей в комментариях (в pdflatex) https://tex.stackexchange.com/a/103712
\lstset{extendedchars=true,keepspaces=true,literate=
    {Ö}{{\"O}}1
    {Ä}{{\"A}}1
    {Ü}{{\"U}}1
    {ß}{{\ss}}1
    {ü}{{\"u}}1
    {ä}{{\"a}}1
    {ö}{{\"o}}1
    {~}{{\textasciitilde}}1
    {а}{{\selectfont\char224}}1
    {б}{{\selectfont\char225}}1
    {в}{{\selectfont\char226}}1
    {г}{{\selectfont\char227}}1
    {д}{{\selectfont\char228}}1
    {е}{{\selectfont\char229}}1
    {ё}{{\"e}}1
    {ж}{{\selectfont\char230}}1
    {з}{{\selectfont\char231}}1
    {и}{{\selectfont\char232}}1
    {й}{{\selectfont\char233}}1
    {к}{{\selectfont\char234}}1
    {л}{{\selectfont\char235}}1
    {м}{{\selectfont\char236}}1
    {н}{{\selectfont\char237}}1
    {о}{{\selectfont\char238}}1
    {п}{{\selectfont\char239}}1
    {р}{{\selectfont\char240}}1
    {с}{{\selectfont\char241}}1
    {т}{{\selectfont\char242}}1
    {у}{{\selectfont\char243}}1
    {ф}{{\selectfont\char244}}1
    {х}{{\selectfont\char245}}1
    {ц}{{\selectfont\char246}}1
    {ч}{{\selectfont\char247}}1
    {ш}{{\selectfont\char248}}1
    {щ}{{\selectfont\char249}}1
    {ъ}{{\selectfont\char250}}1
    {ы}{{\selectfont\char251}}1
    {ь}{{\selectfont\char252}}1
    {э}{{\selectfont\char253}}1
    {ю}{{\selectfont\char254}}1
    {я}{{\selectfont\char255}}1
    {А}{{\selectfont\char192}}1
    {Б}{{\selectfont\char193}}1
    {В}{{\selectfont\char194}}1
    {Г}{{\selectfont\char195}}1
    {Д}{{\selectfont\char196}}1
    {Е}{{\selectfont\char197}}1
    {Ё}{{\"E}}1
    {Ж}{{\selectfont\char198}}1
    {З}{{\selectfont\char199}}1
    {И}{{\selectfont\char200}}1
    {Й}{{\selectfont\char201}}1
    {К}{{\selectfont\char202}}1
    {Л}{{\selectfont\char203}}1
    {М}{{\selectfont\char204}}1
    {Н}{{\selectfont\char205}}1
    {О}{{\selectfont\char206}}1
    {П}{{\selectfont\char207}}1
    {Р}{{\selectfont\char208}}1
    {С}{{\selectfont\char209}}1
    {Т}{{\selectfont\char210}}1
    {У}{{\selectfont\char211}}1
    {Ф}{{\selectfont\char212}}1
    {Х}{{\selectfont\char213}}1
    {Ц}{{\selectfont\char214}}1
    {Ч}{{\selectfont\char215}}1
    {Ш}{{\selectfont\char216}}1
    {Щ}{{\selectfont\char217}}1
    {Ъ}{{\selectfont\char218}}1
    {Ы}{{\selectfont\char219}}1
    {Ь}{{\selectfont\char220}}1
    {Э}{{\selectfont\char221}}1
    {Ю}{{\selectfont\char222}}1
    {Я}{{\selectfont\char223}}1
    {і}{{\selectfont\char105}}1
    {ї}{{\selectfont\char168}}1
    {є}{{\selectfont\char185}}1
    {ґ}{{\selectfont\char160}}1
    {І}{{\selectfont\char73}}1
    {Ї}{{\selectfont\char136}}1
    {Є}{{\selectfont\char153}}1
    {Ґ}{{\selectfont\char128}}1
}
% Ширина текста минус ширина надписи 999
\newlength{\twless}
\newlength{\lmarg}
\setlength{\lmarg}{\widthof{999}}   % ширина надписи 999
\setlength{\twless}{\textwidth-\lmarg}
\lstset{ %
%    language=R,                     %  Язык указать здесь, если во всех листингах преимущественно один язык, в результате часть настроек может пойти только для этого языка
    numbers=left,                   % where to put the line-numbers
    numberstyle=\fontsize{12pt}{14pt}\selectfont\color{Gray},  % the style that is used for the line-numbers
    firstnumber=1,                  % в этой и следующей строках задаётся поведение нумерации 5, 10, 15...
    stepnumber=5,                   % the step between two line-numbers. If it's 1, each line will be numbered
    numbersep=5pt,                  % how far the line-numbers are from the code
    backgroundcolor=\color{white},  % choose the background color. You must add \usepackage{color}
    showspaces=false,               % show spaces adding particular underscores
    showstringspaces=false,         % underline spaces within strings
    showtabs=false,                 % show tabs within strings adding particular underscores
    frame=leftline,                 % adds a frame of different types around the code
    rulecolor=\color{black},        % if not set, the frame-color may be changed on line-breaks within not-black text (e.g. commens (green here))
    tabsize=2,                      % sets default tabsize to 2 spaces
    captionpos=t,                   % sets the caption-position to top
    breaklines=true,                % sets automatic line breaking
    breakatwhitespace=false,        % sets if automatic breaks should only happen at whitespace
%    title=\lstname,                 % show the filename of files included with \lstinputlisting;
% also try caption instead of title
    basicstyle=\fontsize{12pt}{14pt}\selectfont\ttfamily,% the size of the fonts that are used for the code
%    keywordstyle=\color{blue},      % keyword style
    commentstyle=\color{ForestGreen}\emph,% comment style
    stringstyle=\color{Mahogany},   % string literal style
    escapeinside={\%*}{*)},         % if you want to add a comment within your code
    morekeywords={*,...},           % if you want to add more keywords to the set
    inputencoding=utf8,             % кодировка кода
    xleftmargin={\lmarg},           % Чтобы весь код и полоска с номерами строк была смещена влево, так чтобы цифры не вылезали за пределы текста слева
  }

  \renewcommand{\lstlistingname}{Листинг}
}

\newcommand{\makelistings}{%
}

\DeclareOption{listings}{%
  \renewcommand{\makelistings}{%
    \definelistings
  }
}

%%%%% Остальные опции пакета memoir
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{memoir}}
\ProcessOptions\relax
\LoadClass[
    a4paper,
    article,
    oneside,
    onecolumn,
    14pt,
    extrafontsizes,
    openright,
    \STATUS
]{memoir}

%%%%%%%%%%%%%%%%%%%Настройка шрифтов%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Поддержка русского языка
\RequirePackage[T1, T2A]{fontenc}
\RequirePackage[utf8]{inputenc}
\RequirePackage[english, russian]{babel}
\RequirePackage[cal=boondoxo]{mathalfa}  %% красивые каллиграфические
%% буквы


%%%%%%%%%%%%%%%%%%%Обеспечиваем работу с математикой%%%%%%%%%%%%%%%%%
\RequirePackage{amsthm}
\RequirePackage{amstext}
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{amsfonts}
%Красивые дроби
\RequirePackage{xfrac}
%Дополнительные математические окружения
\RequirePackage{mathtools}
%Прямые греческие буквы (принято в русской типографии)
\RequirePackage{upgreek}
%Дополнительные символы
\RequirePackage{textcomp}
\numberwithin{equation}{section}   %%%% нумеруем уравнения по разделам

\RequirePackage[libertine, vvarbb]{newtx}
%%%%%%%%%%%%%%%%%%%Настраиваем дизайн текста (отступы, интервалы и пр.)&&&&&&
%Отступ в первом абзаце раздела
\RequirePackage{indentfirst}
%Точка после номера раздела
\RequirePackage{misccorr}
%%% Красивые гиперссылки
\RequirePackage[hidelinks]{hyperref}
\hypersetup{
colorlinks = true,
urlcolor ={blue},
citecolor = {.},
linkcolor = {.},
anchorcolor = {.},
filecolor = {.},
menucolor = {.},
runcolor = {.}
pdftitle={},
pdfsubject={},
pdfauthor={},
pdfkeywords={}
}
\urlstyle{same}

%%% Изменяем метки ненумерованных списков

\renewcommand*{\labelitemi}{---}
\renewcommand*{\labelitemii}{---}
\renewcommand*{\labelitemiii}{---}
\renewcommand*{\labelitemiv}{---}

%Тонкое оформление перекрёстных ссылок
\RequirePackage[russian]{cleveref}
\RequirePackage[dvipsnames, table, hyperref]{xcolor}

\definecolor{green}{RGB}{168, 189, 145}
\definecolor{blue}{RGB}{135, 160, 190}
\definecolor{red}{RGB}{178, 102, 107}
\definecolor{yellow}{RGB}{230, 204, 147}
\definecolor{violet}{RGB}{174, 143, 171}
\definecolor{skyblue}{RGB}{148, 190, 206}


\RequirePackage{hyphenat}
\RequirePackage{titlesec}
%%%%%%%%%%%%%%%%%%%%Настройка дизайна страницы%%%%%%%%%%%%%%%%%%%%%%%
% Отключаем номер главы для эмуляции пакета article
\counterwithout{section}{chapter}
% Нумерация подразделов
\setsecnumdepth{subsubsection}
% Отображать подразделы в содержании
\maxtocdepth{subsubsection}
% Better page layout for A4 paper, see memoir manual.
\settrimmedsize{297mm}{210mm}{*}
\setlength{\trimtop}{0pt}
\setlength{\trimedge}{\stockwidth}
\addtolength{\trimedge}{-\paperwidth}
\settypeblocksize{620pt}{448.13pt}{*}
\setulmarginsandblock{2cm}{2cm}{*}
\setlrmarginsandblock{3cm}{1cm}{*}
\setmarginnotes{17pt}{51pt}{\onelineskip}
\setheadfoot{2\onelineskip}{1.5\onelineskip}
\setheaderspaces{*}{\onelineskip}{*}
\checkandfixthelayout

%Межстрочный интервал
\OnehalfSpacing

%Длина абзацного отступа по ГОСТ
\setlength{\parindent}{2.5em}

%Стандартный стиль оформления
\makepagestyle{standart}
%Настройка верхнего колонтитула
\makeevenhead{standart}{}{}{}  % номер по центру колонтитула
\makeoddhead{standart}{}{}{}

%Настройка нижнего колонтитула
\makeevenfoot{standart}{}{}{\thepage}
\makeoddfoot{standart}{}{}{\thepage}

%Ассоциируем новый стиль со встроенным стилем plain
\aliaspagestyle{plain}{standart}

%Устанавливаем основной стиль оформления страницы
\pagestyle{standart}

%Изменение ориентации страницы внутри документа
\RequirePackage{changepage}
%Для включения альбомных страниц
\RequirePackage{pdflscape}
%Добавление внешних pdf файлов
\RequirePackage{pdfpages}

%%%%%%Обеспечиваем работу с медиа-контентом (с рисунками)%%%%%%
% Крутой пакет для рисования
\RequirePackage{tikz}
% Подключаем пакет работы с графикой
\RequirePackage{graphicx}

% Пусть к папке с рисунками
\graphicspath{{images/}{../images/}}

% Можно указывать имя файлов без расширений
% LaTeX будет последовательно подставлять перечисленные
% пока файл не будет найден
\DeclareGraphicsExtensions{.pdf,.png,.jpg}

%%%%%%%%%%%%%%%%%%%Обеспечиваем работу с таблицами%%%%%%%%%%%%%%%%%%%
%Хорошие таблицы
\RequirePackage{booktabs}
%Длинные таблицы
\RequirePackage{longtable}
%Предоставляет окружение таблицы со столбцами, которые
%позволяют установить их фиксированную ширину в процентах
%и переносить слова в ячейке
\RequirePackage{tabu}

\makelistings

%Окружение для написания алгоритмов в псевдокоде
\RequirePackage[ruled, vlined, algosection, linesnumbered,
titlenumbered]{algorithm2e}

% Русификация окружения алгоритмов
\SetKwComment{Comment}{/* }{ */}
\SetKwInput{KwData}{Вход}
\SetKwInput{KwOutput}{Выход}
\SetAlgorithmName{Алгоритм}{алгоритм}{Список алгоритмов}

% Подстветка синтаксиса
% ВНИМАНИЕ! Требует установки python и пакета pygments
% Поэтому по умолчанию пакет отключён, чтобы не возникало ошибок компиляции
\MINTED



\RequirePackage[style=american]{csquotes}  %% испольуем американский стиль кавычек

%%%%%%%%%% Продвинутые теоремы
\RequirePackage{thmtools}

%% Определения
\declaretheorem[style=definition, numberwithin=section,
name=Определение]{definition}
\declaretheorem[style=definition, numbered=no,
name=Определение]{definition*}
%% Замечание
\declaretheorem[style=remark, numberwithin=section,
name=Замечание]{remark}
\declaretheorem[style=remark, numbered=no, name=Замечание]{remark*}
%% Пример
\declaretheorem[style=definition, numberwithin=section,
name=Пример]{example}
\declaretheorem[style=definition, numbered=no,
name=Пример]{example*}
%% Задача
\declaretheorem[style=remark, numberwithin=section,
name=Задача]{task}
\declaretheorem[style=remark, numbered=no, name=Задача]{task*}
%% Упражнение
\declaretheorem[style=remark, numberwithin=section,
name=Упражнение]{exercise}
\declaretheorem[style=remark, numbered=no,
name=Упражнение]{exercise*}
%% Проблема
\declaretheorem[style=remark, numberwithin=section,
name=Проблема]{problem}
\declaretheorem[style=remark, numbered=no, name=Проблема]{problem*}
%% Вопрос
\declaretheorem[style=remark, numberwithin=section,
name=Вопрос]{question}
\declaretheorem[style=remark, numbered=no, name=Вопрос]{question*}
%% Теорема
\declaretheorem[style=plain, numberwithin=section,
name=Теорема]{theorem}
\declaretheorem[style=plain, numbered=no, name=Теорема]{theorem*}
%% Утверждение
\declaretheorem[style=plain, numberwithin=section,
name=Утверждение]{proposition}
\declaretheorem[style=plain, numbered=no,
name=Утверждение]{proposition*}
\declaretheorem[style=plain, numberwithin=section,
name=Утверждение]{assertion}
\declaretheorem[style=plain, numbered=no, name=Утверждение]{assertion*}
%% Лемма
\declaretheorem[style=plain, numberwithin=section,
name=Лемма]{lemma}
\declaretheorem[style=plain, numbered=no, name=Лемма]{lemma*}
%% Следствие
\declaretheorem[style=plain, numberwithin=section,
name=Следствие]{corollary}
\declaretheorem[style=plain, numbered=no,
name=Следствие]{corollary*}


%%%%%%%%%%%%%%%%%%%Полезные команды%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Возможность использовать автонумерацию
\newcounter{index}
\newcommand*{\No}{\noindent\refstepcounter{index}\textnumero~\theindex}
\newcommand*{\Index}{\refstepcounter{index}\theindex}

%%% Русская традиция начертания математических знаков
\renewcommand{\le}{\ensuremath{\leqslant}}
\renewcommand{\leq}{\ensuremath{\leqslant}}
\renewcommand{\ge}{\ensuremath{\geqslant}}
\renewcommand{\geq}{\ensuremath{\geqslant}}
\renewcommand{\emptyset}{\varnothing}

%%% Русская традиция начертания математических функций
\renewcommand{\tan}{\operatorname{tg}}
\renewcommand{\cot}{\operatorname{ctg}}
\renewcommand{\csc}{\operatorname{cosec}}
%%% Русская традиция начертания греческих букв (пакет upgreek)
\renewcommand{\epsilon}{\ensuremath{\upvarepsilon}}   %  русская традиция записи
\renewcommand{\phi}{\ensuremath{\upvarphi}}
\renewcommand{\kappa}{\ensuremath{\varkappa}}
\renewcommand{\alpha}{\ensuremath{\upalpha}}
\renewcommand{\beta}{\ensuremath{\upbeta}}
\renewcommand{\gamma}{\ensuremath{\upgamma}}
\renewcommand{\delta}{\ensuremath{\updelta}}
\renewcommand{\varepsilon}{\ensuremath{\upvarepsilon}}
\renewcommand{\zeta}{\ensuremath{\upzeta}}
\renewcommand{\eta}{\ensuremath{\upeta}}
\renewcommand{\theta}{\ensuremath{\uptheta}}
\renewcommand{\vartheta}{\ensuremath{\upvartheta}}
\renewcommand{\iota}{\ensuremath{\upiota}}
\renewcommand{\kappa}{\ensuremath{\upkappa}}
\renewcommand{\lambda}{\ensuremath{\uplambda}}
\renewcommand{\mu}{\ensuremath{\upmu}}
\renewcommand{\nu}{\ensuremath{\upnu}}
\renewcommand{\xi}{\ensuremath{\upxi}}
\renewcommand{\pi}{\ensuremath{\uppi}}
\renewcommand{\varpi}{\ensuremath{\upvarpi}}
\renewcommand{\rho}{\ensuremath{\uprho}}
\renewcommand{\varrho}{\ensuremath{\upvarrho}}
\renewcommand{\sigma}{\ensuremath{\upsigma}}
\renewcommand{\varsigma}{\ensuremath{\upvarsigma}}
\renewcommand{\tau}{\ensuremath{\uptau}}
\renewcommand{\upsilon}{\ensuremath{\upupsilon}}
\renewcommand{\varphi}{\ensuremath{\upvarphi}}
\renewcommand{\chi}{\ensuremath{\upchi}}
\renewcommand{\psi}{\ensuremath{\uppsi}}
\renewcommand{\omega}{\ensuremath{\upomega}}

%%% operators
\DeclareMathOperator{\supp}{supp}
\DeclareMathOperator{\wt}{wt}
\DeclareMathOperator{\len}{len}
\DeclareMathOperator{\argmin}{argmin}
\DeclareMathOperator{\im}{}
\DeclareMathOperator{\ord}{ord}
\DeclareMathOperator{\rank}{rank}
\newcommand{\getsR}{\mathrel{\overset{\$}{\gets}}}

\newcommand*{\vect}[1]{\boldsymbol{#1}} %% разметка для выделения векторов
\newcommand*{\vectrow}[1]{\overrightarrow{\boldsymbol{#1}}}  %% разметка для векторов-строк
\newcommand*{\vectcol}[1]{\boldsymbol{#1^{\downarrow}}}      %% разметка для векторов-столбцов
\newcommand*{\matr}[1]{\boldsymbol{#1}}     %% разметка для выделения матриц
\newcommand*{\code}[1]{\mathcal{#1}}        %% разметка для выделения линейных кодов

%%%!!! масштабирование формулы
\newcommand\scalemath[2]{\scalebox{#1}{\mbox{\ensuremath{\displaystyle #2}}}}
%%%%

%%%%%%%%%%%%%%%%%%%%Оформление библиографии по ГОСТ
\RequirePackage[%
  backend=biber, %подключение пакета biber
  bibstyle=gost-numeric, %подключение одного из четырех главных стилей biblatex-gost
  citestyle=numeric-comp, %подключение стиля
  language=auto, %указание сортировки языков
  sorting=none, %тип сортировки в библиографии
  doi=true, eprint=false, isbn=false, dashed=true, url=true
]{biblatex}

\IfFileExists{refs.bib}{
  %%%% true code
  \addbibresource{refs.bib}}{%%%% false code
}

%%%%%%%%%%%%%%%%%%%Печатаем библиографию%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\bibliographyname}{Список литературы}

\AtEndDocument{
%    \section*{\bibliographyname}
%    \label{sec:bibliography}
%    \addcontentsline{toc}{section}{\protect\numberline{}\bibliographyname}
    \printbibliography[heading=bibintoc]
}

%%%%%%%%%%%%%%%%%% Title page style %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{titling}
%%%%%%%%% Title page commands %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\valUniver}{%
   Московский государственный университет имени М.В.Ломоносова%
}
\newcommand{\insertUniver}{%
  \MakeUppercase{\valUniver}%
}
\newcommand{\univer}[1]{%
  \renewcommand{\valUniver}{#1}%
}

\newcommand{\valFaculty}{%
   Факультет вычислительной математики и кибернетики%
}
\newcommand{\insertFaculty}{%
  \MakeUppercase{\valFaculty}%
}
\newcommand{\faculty}[1]{%
  \renewcommand{\valFaculty}{#1}%
}

\newcommand{\valDepartment}{%
   Кафедра информационной безопасности%
}
\newcommand{\insertDepartment}{%
  \MakeUppercase{\valDepartment}%
}
\newcommand{\department}[1]{%
  \renewcommand{\valDepartment}{#1}%
}

\date{\the\year}

% \vspace*{\droptitle}
% \maketitlehooka
% {\pretitle \title \posttitle}
% \maketitlehookb
% {\preauthor \author \postauthor}
% \maketitlehookc
% {\predate \date \postdate}
% \maketitlehookd

\makeatletter
\def\@maketitle{% modified from titling.sty
  \newpage
  \null
  %\vskip 2em%
  \vspace*{\droptitle}
  \maketitlehooka
  {\@bspreauthor \@author \@bspostauthor}
  \maketitlehookb
  {\@bspretitle \@title \@bsposttitle}
  \maketitlehookc
  {\@bspredate \@date \@bspostdate}
  \maketitlehookd
  \par
  \vskip 1.5em
}
\makeatother

\setlength{\droptitle}{-6em}

\newcommand{\subtitle}[1]{%
  \posttitle{%
    \par\end{center}
    \begin{center}\MakeUppercase{#1}\end{center}
    \vskip0.5em}%
}
\newcommand{\place}[1]{%
  \predate{\begin{center}\large #1, }
}

\postdate{%
\par\end{center}
}

\place{Москва}

\preauthor{%
  \begin{center}
    \includegraphics{logo}
    \small
    \par\insertUniver
    \par\insertFaculty
    \par\insertDepartment
  \end{center}
  \vskip 4\baselineskip
  \begin{center}
  \large
}
\postauthor{%
  \par\end{center}
}

\newcommand{\insertAdvisor}{%
}
\newcommand{\advisor}[1]{%
  \renewcommand{\insertAdvisor}{#1}
}
\renewcommand{\maketitlehookc}{%
  \vskip 2\baselineskip
  \raggedleft
  \begin{minipage}{0.58\textwidth}
    \textbf{Научный руководитель:}\\
    \insertAdvisor
  \end{minipage}
  \insertAdvisorSign
  \vfill
}

\AtBeginDocument{%
  % Титульная страница
  \begin{titlingpage}
    \begin{SingleSpace}
     \maketitle
    \end{SingleSpace}
  \end{titlingpage}
  % Вставляем оглавление
  \clearpage%
  \tableofcontents*%
  \clearpage%
}

%
%   Duplicate the symbol after the '\HM' command on the next line
%
\newcommand*{\HM}[1]{#1\nobreak\discretionary{}{\hbox{\(\mathsurround=0pt #1\)}}{}}
