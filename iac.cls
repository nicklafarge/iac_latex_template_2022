\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{iac}[2022/07/12 International Astronautical Congress conference paper LaTeX class]

\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{amstext}
\RequirePackage{amsfonts}

\LoadClass[twocolumn,letter paper,10pt]{article}

\RequirePackage[margin=1in,top=1.25in,height=\baselineskip]{geometry} % page layout
\RequirePackage{graphicx}
%\RequirePackage{array}
\RequirePackage{booktabs}
\RequirePackage{overcite}
\RequirePackage{lastpage}
\RequirePackage{fancyhdr}
\RequirePackage{lastpage}
\RequirePackage[explicit,compact]{titlesec}
\RequirePackage[normalem]{ulem}
\RequirePackage{etoolbox}
\RequirePackage{alphalph}

% Times New Roman
\RequirePackage{mathptmx}

% Bibliography
\bibliographystyle{ieeetr}
\usepackage[sort, numbers]{natbib}

% Email hyperlink
\RequirePackage{hyperref}
% \RequirePackage{xcolor}

% For corresponding author
\usepackage{ifthen}

% Hyperlink colors
% \definecolor{linkColor}{HTML}{1B00A7} % Google blue
%\definecolor{linkColor}{HTML}{000000} % black
\hypersetup{colorlinks, breaklinks,
			linkcolor=black, 
			citecolor=black, 
			urlcolor=black}
      \RequirePackage{etoolbox}
      \RequirePackage{alphalph}
      
\newcounter{authcount}
\newboolean{showaffil}
\newcommand{\IACauthor}[4][false]{%
	\stepcounter{authcount}%
	\csdef{iac@correauth\theauthcount}{#1}%
	\csdef{iac@author\theauthcount}{#2}%
	\csdef{iac@affiliation\theauthcount}{#3}%
  \csdef{iac@authoremail\theauthcount}{#4}
  }

% Keywords
\newcounter{keywordcount}
\newcommand{\IACkeyword}[1]{%
\stepcounter{keywordcount}%
\csdef{iac@keyword\thekeywordcount}{#1}}

% Template
\setlength\parindent{12pt}
\RequirePackage[]{caption}
\captionsetup[figure]{name=Fig.,labelsep=period}
\captionsetup[table]{labelsep=period}


% Section headers
\titlespacing{\section}{0pt}{*3}{*0.0}
\titlespacing{\subsection}{0pt}{*2.5}{*0.0}
\titlespacing{\subsubsection}{0pt}{*2}{*0.0}
\titleformat{\section}{\normalfont}{\bfseries\thesection.\ }{0.5em}{\textbf{#1}}
\titleformat{\subsection}{\normalfont\itshape}{\thesection.\arabic{subsection}}{0.5em}{#1}
\titleformat{\subsubsection}{\normalfont\itshape}{\thesection.\arabic{subsection}.\arabic{subsubsection}}{0pt}{#1}

% IAC
\renewcommand{\abstract}[1]{\def\iac@abstract{#1}}
\newcommand*{\IACpaperyear}[1]{\def\iac@paperyear{#1}}\IACpaperyear{}
\newcommand*{\IACpapernumber}[1]{\def\iac@papernumber{#1}}\IACpapernumber{}
\newcommand*{\IACcopyright}[1]{\def\iac@copyright{#1}}\IACcopyright{}
\newcommand*{\IAClocation}[1]{\def\iac@location{#1}}\IAClocation{}
\newcommand*{\IACdate}[1]{\def\iac@date{#1}}\IACdate{}

\newcommand*{\IACconference}[2]{\def\iac@conference{#1\textsuperscript{#2}}}

\newcommand{\IACcopyrightA}[2]{\def\iac@copyright{Copyright \copyright\,#1 by #2. All rights reserved.}}
\newcommand{\IACcopyrightAShort}[2]{\def\iac@copyright{Copyright \copyright\,#1 by #2.}}
\newcommand{\IACcopyrightB}[2]{\def\iac@copyright{Copyright \copyright\,#1 by #2. Published by the International Astronautical Federation with permission.}}
\newcommand{\IACcopyrightC}{\def\iac@copyright{This material is declared a work of the U.S.\ Government and is not subject to copyright protection in the United States.}}
\newcommand{\IACcopyrightD}[1]{\def\iac@copyright{Copyright \copyright\,#1 by the International Astronautical Federation. The U.S.\ Government has a royalty-free license to exercise all rights under the copyright claimed herein for Governmental purposes. All other rights are reserved by the copyright owner.}}
\newcommand{\IACcopyrightDAPL}[1]{\def\iac@copyright{Copyright \copyright\,#1 by the International Astronautical Federation. Under the copyright claimed herein, the U.S.\ Government has a royalty-free license to exercise all rights for Governmental purposes. All other rights are reserved by the copyright owner.}} 
\newcommand\iac@makecopyright{{\iac@copyright}}


\renewcommand\maketitle{\twocolumn[
  \begin{@twocolumnfalse}
  \lhead{}\chead{\footnotesize \iac@conference{} International Astronautical Congress (IAC), %
  {\iac@location, \iac@date}. \\ \iac@makecopyright}\rhead{}%
  \lfoot{IAC--\iac@paperyear--\iac@papernumber}\cfoot{}\rfoot{Page \thepage\ of \pageref{LastPage}}%
  \begingroup
    \global\@topnum\z@   % Prevents figures from going at top of page.
    \@maketitle
    \@thanks
  \endgroup
  \global\let\maketitle\relax
  \global\let\@maketitle\relax
  \global\let\@date\@empty
  \global\let\@title\@empty
  \global\let\title\relax
  \global\let\date\relax
  \global\let\and\relax
  \end{@twocolumnfalse}
  ]}
\def\@maketitle{%
  \newpage
  \begin{center}%
    IAC--\iac@paperyear--\iac@papernumber\par
    \vskip1em
    {\normalsize \textbf{\@title} \par}%
    \vskip 1.5em%
    {\normalsize
      \newcounter{authnum}%
      \setcounter{authnum}{0}
      \whileboolexpr
      { test {\ifnumcomp{\value{authnum}}{<}{\theauthcount-1}} }%
      {\stepcounter{authnum}%
        %\setboolean{showaffil}{true} %
        \setboolean{showaffil}{\csuse{iac@correauth\theauthnum}} %
      	\normalsize\textbf{\csuse{iac@author\theauthnum}\textsuperscript{\alph{authnum}}}%
        \ifthenelse{\boolean{showaffil}}{*}{}%
        {, }%
	  }%
    \stepcounter{authnum}
    \normalsize\textbf{\csuse{iac@author\theauthnum}\textsuperscript{\alph{authnum}}}
    }%
  \end{center}%
    {\normalsize
      \lineskip .5em%
      \newcounter{affilnum}%
      \setcounter{affilnum}{0}
      \whileboolexpr
      { test {\ifnumcomp{\value{affilnum}}{<}{\theauthcount}} }%
      {\stepcounter{affilnum}%
        \textsuperscript{\alph{affilnum}} %
        \textit{\normalsize\csuse{iac@affiliation\theaffilnum}}, %
    %    \underline{\href{mailto:\csuse{iac@authoremail\theaffilnum}}{\csuse{iac@authoremail\theaffilnum}}}\par%
        \href{mailto:\csuse{iac@authoremail\theaffilnum}}{\csuse{iac@authoremail\theaffilnum}}\par%
	    }%
      * Corresponding Author\par %
    }%
	\vskip 2ex \par%
  \centerline{\textbf{Abstract}}%
  \hspace{12pt}\iac@abstract\par%
  \ifthenelse{\thekeywordcount > 0}{
  \textbf{Keywords:}%
  \newcounter{keywordnum}%
  \setcounter{keywordnum}{0}
   \whileboolexpr
  { test {\ifnumcomp{\value{keywordnum}}{<}{\thekeywordcount-1}} }%
  {\stepcounter{keywordnum}%
  \csuse{iac@keyword\thekeywordnum}, %
  }\csuse{iac@keyword\thekeywordcount}%
  }{}
  \vskip 4.5ex}%
  \pagestyle{fancy}%
  \renewcommand{\headrulewidth}{0pt}

\makeatletter
\newcommand*{\fnsymbolsingle}[1]{%
  \ensuremath{%
    \ifcase#1%
    \or *%
    \or \dagger
    \or \ddagger
    \or \mathsection
    \or \mathparagraph
    \else
      \@ctrerr
    \fi
  }%
}
\makeatother
\newalphalph{\fnsymbolmult}[mult]{\fnsymbolsingle}{}
\renewcommand*{\thefootnote}{%
  \fnsymbolmult{\value{footnote}}%
}
\endinput