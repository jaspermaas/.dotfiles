\ProvidesClass{mluexercise}[2019/10/05 Exercise documentation in compliance with Martin-Luther-University, Institute of Computer Science.]
\NeedsTeXFormat{LaTeX2e}

% MIT License
%
% Copyright (c) 2019 Jan Heinrich Reimer
%
% Permission is hereby granted, free of charge, to any person obtaining a copy
% of this software and associated documentation files (the "Software"), to deal
% in the Software without restriction, including without limitation the rights
% to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
% copies of the Software, and to permit persons to whom the Software is
% furnished to do so, subject to the following conditions:
%
% The above copyright notice and this permission notice shall be included in all
% copies or substantial portions of the Software.
%
% THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
% IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
% FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
% AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
% LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
% OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
% SOFTWARE.

% Encoding:
\RequirePackage[utf8]{inputenc} % UTF-8 file encoding.
% \RequirePackage[T1]{fontenc} % Output font encoding.

% Class options:
\RequirePackage{kvoptions} % Options processing.
\SetupKeyvalOptions{family=mluexercise,prefix=mluexercise@}
\DeclareBoolOption[true]{showtitle}
\DeclareComplementaryOption{hidetitle}{showtitle}
\DeclareBoolOption[true]{showmatriculationnumber}
\DeclareComplementaryOption{hidematriculationnumber}{showmatriculationnumber}
\DeclareBoolOption[false]{showshorthandsymbol}
\DeclareComplementaryOption{hideshorthandsymbol}{showshorthandsymbol}
\ProcessKeyvalOptions{mluexercise}\relax % Process options.

% Base class:
\LoadClassWithOptions{scrartcl}

% Configuration:
\newcommand{\mluexercise@checkoptions@empty}[3]{%
    \ifthenelse{\equal{#1}{}}{%
        \ClassError{mluexercise}{Missing #2}{Set #2 using the \protect#3.}
    }{}
}
% Lecture name.
\newcommand*{\mluexercise@lecture}{} 
\newcommand{\lecture}[1]{\renewcommand*{\mluexercise@lecture}{#1}}
\newcommand{\mluexercise@checkoptions@lecture}{%
    \mluexercise@checkoptions@empty{\mluexercise@lecture}{lecture name}{\lecture}%
}
% Current semester. Set automatically based on the current date, if not overwritten.
\newcommand{\mluexercise@yearplus}[1]{\advance\year by #1 \the\year\advance\year by -#1}
\newcommand{\mluexercise@semester}{%
    \ifnum\month<4 % Winter semester, including previous year.
        WS~\mluexercise@yearplus{-1}/\the\year%
    \else\ifnum\month<10 % Summer semester.
        SS~\the\year%
    \else % Winter semester, including next year.
        WS~\the\year/\mluexercise@yearplus{1}%
    \fi\fi%
}
\newcommand{\semester}[1]{\renewcommand*{\mluexercise@semester}{#1}}
\newcommand{\mluexercise@checkoptions@semester}{%
    \mluexercise@checkoptions@empty{\mluexercise@semester}{semester}{\semester}%
}
% Exercise series number.
\newcommand{\mluexercise@exercise}{}
\newcommand{\exercise}[1]{\renewcommand*{\mluexercise@exercise}{#1}}
\newcommand{\mluexercise@checkoptions@exercise}{%
    \mluexercise@checkoptions@empty{\mluexercise@exercise}{exercise number}{\exercise}%
}
% Nummer of first task.
\newcommand{\mluexercise@task}{}
\newcommand{\task}[1]{\renewcommand*{\mluexercise@task}{#1}}
\newcommand{\mluexercise@checkoptions@task}{%
    \mluexercise@checkoptions@empty{\mluexercise@task}{task number}{\task}%
}
% Group number (or 0, if no group work).
\newcommand{\mluexercise@group}{}
\newcommand{\group}[1]{\renewcommand*{\mluexercise@group}{#1}}
\newcommand{\mluexercise@checkoptions@group}{%
    \mluexercise@checkoptions@empty{\mluexercise@group}{group number}{\group}%
} % TODO instead clear group string.
% Full student name.
\newcommand{\mluexercise@fullname}{}
\newcommand{\fullname}[1]{\renewcommand*{\mluexercise@fullname}{#1}}
\newcommand{\mluexercise@checkoptions@fullname}{%
    \mluexercise@checkoptions@empty{\mluexercise@fullname}{full name}{\fullname}%
}
% Matriculation number.
\newcommand{\mluexercise@matriculationnumber}{}
\newcommand{\matriculationnumber}[1]{\renewcommand*{\mluexercise@matriculationnumber}{#1}}
\newcommand{\mluexercise@checkoptions@matriculationnumber}{%
    \ifthenelse{\boolean{mluexercise@showmatriculationnumber}}{
        \mluexercise@checkoptions@empty{\mluexercise@matriculationnumber}{matriculation number}{\matriculationnumber}%
    }{}
}
% University IT shorthand symbol ("5-Steller").
\newcommand{\mluexercise@shorthandsymbol}{}
\newcommand{\shorthandsymbol}[1]{\renewcommand*{\mluexercise@shorthandsymbol}{#1}}
\newcommand{\mluexercise@checkoptions@shorthandsymbol}{%
    \ifthenelse{\boolean{mluexercise@showshorthandsymbol}}{
        \mluexercise@checkoptions@empty{\mluexercise@shorthandsymbol}{shorthand symbol}{\shorthandsymbol}%        
    }{}
}

% Basic support packages:
\RequirePackage{ifthen} % Conditional branches and loops.
\RequirePackage{etoolbox} % Hooks for executing code.
\RequirePackage[ngerman]{babel} % Language support for correct hyphenation and translation of LaTeX standard texts.
\RequirePackage{keycommand} % Commands with key-value options.
\RequirePackage{hyperref} % Cross-references for external websites und internal sections/figures/literature etc.
\RequirePackage{color,xcolor} % Colors.

% Page layout:
\RequirePackage{calc} % Calculate lengths.
\RequirePackage[ % Page size and margins (inner=left for one-page documents).
    a4paper,
    inner=2cm,
    outer=2cm,
    top=3cm,
    bottom=3cm,
    head=1.3cm,
    headsep=0.5cm,
    foot=0.75cm,
]{geometry}
\setlength{\parindent}{0em} % Disable horizontal paragraph indent.
\renewcommand{\baselinestretch}{1.15} % Line height.
\RequirePackage{lastpage} % Total page count.

% Fonts:
% \RequirePackage{concmath} % Font "Concrete Maths" for mathematics.
\RequirePackage{lmodern} % Font "Latin Modern" for block text, headings, code.
\RequirePackage{eulervm} % Font "Euler Maths" for mathematics.
% \RequirePackage[default,regular]{sourceserifpro} % Font "Source Serif Pro" for block text.
% \RequirePackage{heuristica}\renewcommand*{\oldstylenums}[1]{\textosf{#1}} % Font "Heuristica" for block text.
% \RequirePackage[defaultsans]{lato} % Font "Lato" for headings.
% \RequirePackage{sourcesanspro} % Font "Source Sans Pro" for headings
\RequirePackage[ttdefault]{sourcecodepro} % Font "Source Code Pro" for code. We should choose a "real" monospace font, otherwise LaTeX would fill gaps with spaces in PDFs.

% Font appearance:
\RequirePackage{eurosym} % Official Euro symbol.
\RequirePackage[autostyle=true,german=quotes]{csquotes} % Quotation marks and direct quotation.

% Font formatting:
% \newcommand{\strong}[1]{\textbf{#1}} \newcommand{\fett}[1]{\textbf{#1}} % Bold text.
% \newcommand{\italic}[1]{\textit{#1}} \newcommand{\kursiv}[1]{\textit{#1}} % Italic text.
% \newcommand{\code}[1]{\texttt{#1}} % Monospace text.
% \newcommand{\unterstrichen}[1]{\underline{#1}} % Underlined text.
% \newcommand{\Underline}[1]{\underline{\underline{#1}}} \newcommand{\Unterstrichen}[1]{\Underline{#1}} % Double-underlined text.
% \newcommand{\plural}[1]{\textsuperscript{\underline{$#1$}}} \newcommand{\pl}[1]{\plural{#1}} % Abbreviated plural (superscript and underlined) for "Linear Algebra (Rieger)" lecture.
\newcommand{\numberlinefont}{\tiny\bfseries} % Font for line numbers for algorithms and listings.
\newcommand{\numberlineskip}{0.8em} % Margin for line numbers for algorithms and listings.

% Title formatting:
\RequirePackage{titling} % Title formatting.
\newcommand{\Rom}[1]{\uppercase\expandafter{\romannumeral#1\relax}} % Uppercase Roman number representation (e.g. I,V,X,...).
\newcommand{\groupstring}{\ifnum\mluexercise@group>0{, Gruppe \Rom{\mluexercise@group}}\fi} % Exercise group number.
\setkomafont{title}{\sffamily\fontseries{sb}\scshape\huge\centering} % Title font.
\setkomafont{date}{\sffamily\itshape\large\centering} % Date font.
\renewcommand{\maketitle}{%
    \thispagestyle{scrheadings} % Include head/foot on first page.
    \newlength{\approxtitlewidth}\settowidth{\approxtitlewidth}{\mluexercise@lecture} \ifnum\approxtitlewidth>\textwidth\addtokomafont{title}{\LARGE}\fi % Automatically shrink large titles.
    \vspace{0ex}
    \begin{center}%
        \usefontofkomafont{title}
        \mluexercise@lecture \\[1ex]
        \usefontofkomafont{date}
        \today,
        \mluexercise@semester%
        \groupstring
    \end{center}
}

% Head/foot:
\RequirePackage[headsepline,footsepline]{scrlayer-scrpage} % Head/foot.
\pagestyle{scrheadings} % Use page style with head and foot.
\clearpairofpagestyles % Clear head and foot content.
\setkomafont{pageheadfoot}{\sffamily} % Head font.
\setkomafont{pagination}{\sffamily} % Foot font.
\ofoot{\arabic{page} von \pageref{LastPage}} % Page number in outer foot.

% Headings:
\setkomafont{sectioning}{\sffamily\mdseries} % Heading font.
\setkomafont{section}{\LARGE} % Section font size.
\setkomafont{subsection}{\Large} % Sub-section font size.
\setkomafont{subsubsection}{\large} % Sub-sub-section font size.
\setkomafont{paragraph}{\large} % Paragraph font size.
\setkomafont{subparagraph}{\normalsize} % Sub-paragraph font size.
\renewcommand\thesection{\bfseries\upshape Aufgabe \arabic{section}} % Section numbering.
\renewcommand\thesubsection{\bfseries\upshape \alph{subsection})} % Sub-section numbering.
\renewcommand\thesubsubsection{\upshape (\roman{subsubsection})} % Sub-sub-section numbering.
\renewcommand{\autodot}{} % Disable automatic dot after section numbering.

% Algorithms and pseudocode:
\RequirePackage[ruled, vlined, linesnumbered, german]{algorithm2e} % Algorithms and pseudocode.
\DontPrintSemicolon % Don't print semicolon after each line.
\SetKwProg{Function}{function}{\ is}{end function} % Function definition.
\SetKwComment{Comment}{$\triangleright$\ }{} \SetCommentSty{itshape} \SetSideCommentLeft % Comment style.
\SetNlSty{numberlinefont}{}{} % Line number font.
\SetNlSkip{\numberlineskip} % Line number margin.
\SetAlgoNlRelativeSize{0} % Line number size (relative).

% Code formatting:
\RequirePackage{listings} % Code listings.
\RequirePackage{listingsutf8} % UTF8 support in imported listings.
\definecolor{lsnumber}{rgb}{0,0,0} % Line number color.
\definecolor{lscomment}{rgb}{0.25,0.5,0.35} % Comment color.
\definecolor{lskeyword}{rgb}{0.5,0,0.35} % Keyword color.
\definecolor{lsstring}{rgb}{0.6,0,0} % String color.
\definecolor{lsdoc}{rgb}{0.25,0.35,0.75} % Documentation color.
\lstset{
    language=C, % Standard language.
    basicstyle=\ttfamily, % Font.
    breakatwhitespace=false, % Only break line at white space.
    breaklines=true, % Automatic line breaks.
    prebreak={\mbox{$\hookleftarrow$}}, % Symbol for marking line breaks.
    numbers=left,numberstyle=\numberlinefont,numbersep=\numberlineskip,stepnumber=1, % Line number style.
    commentstyle=\color{lscomment}, morecomment=[s][\color{lscomment}]{/**}{*/}, % Comment style.
    keepspaces=true, % Keep spaces.
    keywordstyle=\bfseries\color{lskeyword}, % Keyword style.
    stringstyle=\color{lsstring}, % String style.
    showtabs=false, showspaces=false, % Don't mark tabs and spaces.
    showstringspaces=false, % Don't mark spaces in strings.
    tabsize=4, % Tabulator size.
}
\lstdefinestyle{molitorassembler}{ % Source code style for the teaching processor from "Einführung in Rechnerarchitektur (Molitor)".
    language=[x86masm]Assembler,
    morekeywords={
        ldd, sto, shl, shr, rol, ror, sub, add, shli, 
        shri, roli, rori, subi, addi, or, and, xor, 
        xnor, jmp, beq, bneq, bgt, bo, ldpc, stpc
    },
    comment=[l]{\#},
}
\lstdefinestyle{haskell}{ % Source code style for Haskell from "Konzepte der Programmierung (Zimmermann)".
    language=haskell,
    escapeinside={*'}{'*},
    showstringspaces=false,
    morecomment=[l]\%,
    captionpos=b,
    emphstyle={\bfseries},
    tabsize=2,
}
\lstdefinestyle{ownstyle}{ % Source code style for LaTeX.
    language=[LaTeX]{TeX},
}

% Graphics and pictures:
\definecolor{yellow}{rgb}{1,1,0} % Yellow color.
\definecolor{cyan}{rgb}{0,1,1} % Cyan color.
\RequirePackage{graphicx} % Include external pictures/graphics.
\RequirePackage{tikz} % TikZ graph drawing.
\RequirePackage{pgfplots}\pgfplotsset{compat=1.16} % 2D/3D function plots.
\usetikzlibrary{positioning} % TikZ library for relative positioning.
\usetikzlibrary{automata} % TikZ library for automata.
\usetikzlibrary{trees} % TikZ library for tree graphs.
\tikzset{ % Standard TikZ configuration.
    >=latex,
    font=\sffamily,
}
\RequirePackage{rotating} % Rotate environment.

% Mathematics:
\RequirePackage{amsthm,amsmath,amssymb,amstext,MnSymbol} % Base packages for maths mode, special symbols, fractions etc. % TODO remove MnSymbol.
\RequirePackage{array} % Tables in maths mode.
\RequirePackage{cancel} % Cancel out symbols (e.g. \not\in).
\newcommand{\union}{\cup} \newcommand{\vereinigung}{\cup} % Union symbol.
\newcommand{\disjunction}{\uplus} \newcommand{\disjunktion}{\uplus} % Disjunct union symbol.
\newcommand{\intersection}{\cap} \newcommand{\intersect}{\cap} \newcommand{\schnitt}{\cap} \newcommand{\schnittmenge}{\cap} % Intersection symbol.
\newcommand{\lund}{\land} % Logical AND symbol.
\newcommand{\loder}{\lor} % Logical OR symbol.
\newcommand{\textland}{\(\land\)} \newcommand{\textlund}{\textland} % Logical AND symbol in text mode.
\newcommand{\textlor}{\(\lor\)} \newcommand{\textloder}{\textlor} % Logical OR symbol in text mode.
\newcommand{\C}{\mathbb{C}} \newcommand{\complexnumbers}{\C} \newcommand{\complexezahlen}{\C} % Symbol for the set of complex numbers.
\newcommand{\R}{\mathbb{R}} \newcommand{\realnumbers}{\R} \newcommand{\reelezahlen}{\R} % Symbol for the set of real numbers.
\newcommand{\Q}{\mathbb{Q}} \newcommand{\rationalnumbers}{\Q} \newcommand{\rationalezahlen}{\Q} % Symbol for the set of rational numbers.
\newcommand{\Z}{\mathbb{Z}} \newcommand{\wholenumbers}{\Z} \newcommand{\ganzezahlen}{\Z} % Symbol for the set of whole numbers.
\newcommand{\N}{\mathbb{N}} \newcommand{\naturalnumbers}{\N} \newcommand{\natuerlichezahlen}{\N} % Symbol for the set of natural numbers.
\newcommand{\B}{\mathbb{B}} \newcommand{\binarynumbers}{\B} \newcommand{\binaerezahlen}{\B} % Symbol for the set of binary numbers.
\renewcommand{\O}{\mathcal{O}} % Bachmann–Landau notation for asymptotic time/space, as used in "Datenstrukturen und effiziente Algorithmen (Müller-Hannemann)".
\newcommand{\base}[1]{\mathcal{#1}} % Base for groups, e.g. a vector space, as used in "Lineare Algebra (Rieger)".
\newcommand{\rechtspfeil}{\rightarrow} % Right arrow.
\newcommand{\Rechtspfeil}{\Rightarrow} % Double right arrow.
\newcommand{\linkspfeil}{\leftarrow} % Left arrow.
\newcommand{\Linkspfeil}{\Leftarrow} % Double left arrow.
\newcommand{\linksrechtspfeil}{\leftrightarrow} % Left right arrow.
\newcommand{\Linksrechtspfeil}{\Leftrightarrow} % Double left right arrow.
\renewcommand{\P}{\mathbf{P}} \newcommand{\probability}{\P} \newcommand{\wahrscheinlichkeit}{\P} % Probability symbol.
\newcommand{\E}{\mathbf{E}} \newcommand{\expectedvalue}{\E} \newcommand{\erwartungswert}{\E} % Expected value symbol.
\newcommand{\iseq}{\overset{?}{=}} % Symbol for checking equality.
\newcommand{\mbeq}{\overset{!}{=}} % Symbol for asserting equality.
\newcommand{\mblt}{\overset{!}{<}} % Symbol for asserting less-than-inequality.
\newcommand{\mbgt}{\overset{!}{>}} % Symbol for asserting greater-than-inequality.
\newcommand{\mbleq}{\overset{!}{\leq}} % Symbol for asserting less-than-or-equal-inequality.
\newcommand{\mbgeq}{\overset{!}{\geq}} % Symbol for asserting greater-than-or-equal-inequality.
\DeclareMathOperator{\Var}{Var} % Variance symbol.
\DeclareMathOperator{\Cov}{Cov} % Covariance symbol.
\DeclareMathOperator{\Bin}{Bin} % Binomial distribution.
\DeclareMathOperator{\Exp}{Exp} % Exponential distribution.
\newcommand{\Norm}{\mathcal{N}} % Normal distribution.
\DeclareMathOperator{\im}{im} % Image of a function.
\DeclareMathOperator{\id}{id} % Identity.
\DeclareMathOperator{\sel}{sel} % Selection.
\DeclareMathOperator{\dom}{dom} % Domain of a function.
\DeclareMathOperator{\ran}{ran} % Range of a function.
\DeclareMathOperator{\Hom}{Hom} % Homomorphism.
\DeclareMathOperator{\End}{End} % Endomorphism.
\DeclareMathOperator{\indeg}{indeg} % Indegree of a vertex in a graph.
\DeclareMathOperator{\outdeg}{outdeg} % Outdegree of a vertex in a graph.
\let\tmp\mod \let\mod\bmod \let\bmod\tmp % Swap \mod und \bmod.
\let\varemptyset\emptyset \let\emptyset\varnothing % Improved symbol for \emptyset. (Use \varemptyset for old symbol.)
\let\tmp\epsilon \let\epsilon\varepsilon \let\varepsilon\tmp % Improved symbol for Epsilon. (Swap \epsilon and \varepsilon.)
\let\tmp\phi \let\phi\varphi \let\varphi\tmp % Improved symbol for Phi. (Swap \phi and \varphi.)
\newcommand{\eqtransform}{\ensuremath{\qquad\big|~}} % Equivalence transformation of equations.
\newcommand{\infinity}{\infty} % Infinity symbol.
\newcommand{\corresponds}{\triangleq} % Correspondence symbol.
\newcommand{\ditto}{\textquotedbl} \newcommand{\dito}{\ditto} % Ditto (see above) symbol.
\renewcommand{\qed}{\nopagebreak\hfill\ensuremath{\square}} % Symbol for indicating the completion of a proof: "quod erat demonstrandum", lat. "what was to be shown".
\newcolumntype{L}{>{\(}l<{\)}} % Left aligned math mode table column. (Like l column in array environment.)
\newcolumntype{R}{>{\(}r<{\)}} % Right aligned math mode table column. (Like r column in array environment.)
\newcolumntype{C}{>{\(}c<{\)}} % Cent math mode table column. (Like c column in array environment.)

% Calculus:
\newcounter{calculusRowCount}
\newkeyenvironment{calculus}[symbol, bool show-index=false, context=\Gamma, context-command=context]{
    \setcounter{calculusRowCount}{0}
    \newcommand{\calculusSymbol}{\text{\sffamily\itshape\commandkey{symbol}}}
    \newcommand{\calculusContext}{\ensuremath{\commandkey{context}}}
    \expandafter\let\csname \commandkey{context-command}\endcsname\calculusContext
    \par\vspace{0.5em}
    \begin{minipage}{\textwidth}\begin{tabular}{
        @{\stepcounter{calculusRowCount} (\arabic{calculusRowCount})\hspace{1em}} R
        @{\hspace{0.4em} $\vdash_{\ifthenelse{\equal{\commandkey{show-index}}{1}}{\ifthenelse{\equal{\commandkey{symbol}}{}}{}{\calculusSymbol}}{\hspace{-0.1em}}}$\hspace{0.6em}}
        L l}
}{
    \end{tabular}\end{minipage}\vspace{0.5em}
    \let\calculusContext\undefined \let\calculusSymbol\undefined
}
\newenvironment{eqcalc}[1][]{\begin{calculus}[symbol=E, show-index=true,context=\calculusSymbol_{#1}, context-command=E]}{\end{calculus}} % Equation calculus, as used in "Mathematische Grunddlagen der Informatik und Konzepte der Modellierung II (Zimmermann.)".
\newenvironment{seqcalc}{\begin{calculus}[symbol=S, show-index=true, context=\calculusSymbol, context-command=seq]}{\end{calculus}} % Sequent calculus, as used in "Mathematische Grunddlagen der Informatik und Konzepte der Modellierung II (Zimmermann.)".

% Clean-up:
\let\title\undefined % Hide standard \title command.
\let\date\undefined % Hide standard \date command.
\let\author\undefined % Hide standard \author command.

% Hooks:
\AtEndPreamble{
    % Check options:
    \mluexercise@checkoptions@lecture
    \mluexercise@checkoptions@semester
    \mluexercise@checkoptions@exercise
    \mluexercise@checkoptions@task
    \mluexercise@checkoptions@group
    \mluexercise@checkoptions@fullname
    \mluexercise@checkoptions@matriculationnumber
    \mluexercise@checkoptions@shorthandsymbol

    % Title/headings:
    \setcounter{section}{\mluexercise@task} \addtocounter{section}{-1} % Set first section number to task number.

    % Head/foot:
    \ihead{\mluexercise@fullname} % Name in inner head.
    \chead{\strong{\mluexercise@exercise. Übungsserie}} % Exercise number in center head.
    \ohead{%
        \ifthenelse{\boolean{mluexercise@showmatriculationnumber}}{\mluexercise@matriculationnumber}{}%    
        \ifthenelse{\boolean{mluexercise@showmatriculationnumber} \and \boolean{mluexercise@showshorthandsymbol}}{\ /\,}{}%
        \ifthenelse{\boolean{mluexercise@showshorthandsymbol}}{\mluexercise@shorthandsymbol}{}
    } % Matrikel number and shorthand in outer head.

    % PDF meta information:
    \hypersetup{
        pdfauthor={\mluexercise@fullname, \mluexercise@matriculationnumber/\mluexercise@shorthandsymbol},
        pdftitle={\mluexercise@exercise. Übungsserie}
    }
}
\AfterEndPreamble{%
    \ifthenelse{\boolean{mluexercise@showtitle}}{\maketitle}{} % Print lecture name, date, semester, group.
}
