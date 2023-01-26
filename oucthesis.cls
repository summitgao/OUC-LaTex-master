
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{oucthesis}[OUC Thesis Template]


\newif\ifouc@pdf
\DeclareOption{print}{\ouc@pdffalse}
\DeclareOption{pdf}{\ouc@pdftrue}

\newif\ifouc@enmac
\ouc@enmacfalse
\DeclareOption{enmac}{\ouc@enmactrue}

\newif\ifouc@count
\ouc@countfalse
\DeclareOption{count}{\ouc@counttrue}

\PassOptionsToClass{openany}{ctexbook}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\ExecuteOptions{print}
\ProcessOptions\relax

\PassOptionsToClass{scheme=chinese}{ctexbook}
\PassOptionsToPackage{quiet}{xeCJK}
\LoadClass[UTF8,a4paper,zihao=-4]{ctexbook}[2017/04/01]
\PassOptionsToClass{scheme=chinese}{ctexbook}
% ===============================================
% Required Package
\RequirePackage{amsmath}
\RequirePackage{unicode-math}
\RequirePackage[driver=xetex]{geometry}
\RequirePackage{graphicx}
\RequirePackage{fancyhdr}
\RequirePackage{color}
\RequirePackage{titletoc}
\RequirePackage{caption}
\RequirePackage[perpage]{footmisc}
\RequirePackage{url}
\RequirePackage{calc}
\RequirePackage{dashrule}
\RequirePackage{algorithm}
\RequirePackage{algorithmicx}
\RequirePackage[sort&compress]{natbib}
\RequirePackage{bashful}
\ifouc@pdf
\RequirePackage{hyperref}
\else
\fi

% ===============================================
% Changable parameters
\newcommand\ouc@atendpackage{\csname ctex_at_end_package:nn\endcsname}
\ouc@atendpackage{hyperref}{
  \hypersetup{
    bookmarksnumbered  = true,
    bookmarksopen      = true,
    bookmarksopenlevel = 1,
    linktoc            = all,
    unicode            = true,
    psdextra           = true,
  }
  \ifouc@pdf
    \hypersetup{
      colorlinks = true,
      allcolors  = blue,
    }
  \else
    \hypersetup{hidelinks}
  \fi
}

% ===============================================
% Word Count
\newcommand{\wordcount}[0]{%
	\immediate\write18{texcount -1 -sum main.tex > words.count }%
	\input{words.count}%
}

% ===============================================
% Custom Command

\renewenvironment{titlepage}{%
  \clearpage
  \thispagestyle{empty}%
}{\clearpage}

\newcommand\blankpage{%
  \null
  \thispagestyle{empty}%
  \addtocounter{page}{-1}%
  \newpage
}

\newcommand\zhspace[1][1]{\hspace{#1\ccwd}}

% ===============================================
% Fonts Setting

\newdimen\bp@
\bp@=1bp
\renewcommand\normalsize{%
  \@setfontsize\normalsize{12\bp@}{23\bp@}%
  \abovedisplayskip 12\bp@ \@plus3\bp@ \@minus7\bp@
  \abovedisplayshortskip \z@ \@plus3\bp@
  \belowdisplayshortskip 6.5\bp@ \@plus3.5\bp@ \@minus3\bp@
  \belowdisplayskip \abovedisplayskip
  \let\@listi\@listI
}
\normalsize
\renewcommand\small{%
  \@setfontsize\small{10.5\bp@}{19.25\bp@}%
  \abovedisplayskip 10.5\bp@ \@plus3\bp@ \@minus6\bp@
  \abovedisplayshortskip \z@ \@plus3\bp@
  \belowdisplayshortskip 6.5\bp@ \@plus3.5\bp@ \@minus3\bp@
  \belowdisplayskip \abovedisplayskip
}
\renewcommand\footnotesize{%
  \@setfontsize\footnotesize{9\bp@}{16.5\bp@}%
  \abovedisplayskip 9\bp@ \@plus2\bp@ \@minus5\bp@
  \abovedisplayshortskip \z@ \@plus3\bp@
  \belowdisplayshortskip 6\bp@ \@plus3\bp@ \@minus3\bp@
  \belowdisplayskip \abovedisplayskip
}
\renewcommand\scriptsize{\@setfontsize\scriptsize{7.5\bp@}{13.75\bp@}}
\renewcommand\tiny{\@setfontsize\tiny{6.5\bp@}{11.92\bp@}}
\renewcommand\large{\@setfontsize\large{15\bp@}{27.5\bp@}}
\renewcommand\Large{\@setfontsize\Large{18\bp@}{33\bp@}}
\renewcommand\LARGE{\@setfontsize\LARGE{22\bp@}{40.33\bp@}}
\renewcommand\huge{\@setfontsize\huge{24\bp@}{44\bp@}}
\renewcommand\Huge{\@setfontsize\Huge{26\bp@}{47.67\bp@}}

\linespread{1}\selectfont
\newcommand\ouc@setchinese{%
  \xeCJKResetPunctClass
}
\newcommand\ouc@setenglish{%
  \xeCJKDeclareCharClass{HalfLeft}{"2018, "201C}%
  \xeCJKDeclareCharClass{HalfRight}{%
    "00B7, "2019, "201D, "2013, "2014, "2025, "2026, "2E3A%
  }%
}
\ouc@setchinese

% ===============================================
% Page Format 

\geometry{
  paper      = a4paper,
  vmargin    = 2.54cm,
  hmargin    = 3.17cm,
  headheight = 0.75cm,
  headsep    = 0.29cm,
  footskip   = 0.79cm,
}
\pagestyle{fancy}
\let\sectionmark\@gobble
\renewcommand\headrulewidth{0.5\p@}

% ===============================================
% Header Format
\newcommand\ouc@wordcount{\wordcount}

\newcommand\ouc@hf@font{\fontsize{9\bp@}{12\bp@}\selectfont}
\newcommand\ouc@header{\@title}
\fancypagestyle{title}{%
  \fancyhf{}%
  \fancyhead[C]{\ouc@hf@font\ouc@header}%
  \fancyfoot[C]{\ouc@hf@font\thepage}%
  \ifouc@count
    \fancyfoot[R]{\color{gray}\ouc@hf@font \ouc@wordcount}%
  \fi
}
\fancypagestyle{plain}{%
  \fancyhf{}%
  \renewcommand{\headrulewidth}{0pt}
  \fancyhead[C]{}
  \fancyfoot[C]{\ouc@hf@font\thepage}%
}
\pagestyle{title}

% ===============================================
% Pre Content Format 
\ctexset{
  chapter = {
    name        = {,},
    format      = \centering\sffamily\fontsize{16\bp@}{26.67\bp@}\selectfont,
    nameformat  = {},
    number      = \thechapter,
    aftername   = \hspace{\ccwd},
    beforeskip  = 24\bp@,
    afterskip   = 18\bp@,
    fixskip     = true,
  },
}

% ===============================================
% Define Information

\newcommand*{\entitle}[1]{
  \def\ouc@entitle{#1}
}
\newcommand*{\advisor}[1]{
  \def\ouc@advisor{#1}
}
\newcommand*{\mythanks}[1]{
  \def\ouc@mythanks{#1}
}

\newcommand*{\keywords}[1]{
  \def\ouc@keywords{#1}
}

\newcommand*{\enkeywords}[1]{
  \def\ouc@enkeywords{#1}
}
% ===============================================
% Define Page Style


% Abstract

\NewDocumentCommand\ouc@chapter{o m}{%
  \IfValueTF{#1}{%
    \chaptermark{#1}%
  }{%
    \chaptermark{#2}%
  }%
  {
  \makeatletter\c@secnumdepth=-1\makeatother
  \chapter{#2}
  }
  }
\newcommand\pagenumberingnoreset[1]{\gdef\thepage{\csname @#1\endcsname\c@page}}


% Abstract
\let\standardclearpage\clearpage
\newenvironment{abstract}{%
  \clearpage
  \pagestyle{plain}%
  \pagenumberingnoreset{Roman}
  \ouc@setchinese
  \begin{center}
    \fontsize{16\bp@}{26.67\bp@}\sffamily\@title
  \end{center}
  \let\clearpage\relax
  \ouc@chapter{摘\zhspace[1]要}
  \let\clearpage\standardclearpage
  \vspace{1em}
}{
  \par\null\par\noindent\hangindent=4\ccwd\relax
  \sffamily{关键词：\ouc@keywords}
  \clearpage
  \pagestyle{title}
  \pagenumberingnoreset{arabic}
}

\newenvironment{enabstract}{%
  \clearpage
  \pagestyle{plain}
  \pagenumberingnoreset{Roman}
  \ouc@setenglish
  \begin{center}
    \fontsize{16\bp@}{26.67\bp@}\sffamily\ouc@entitle
  \end{center}
  \let\clearpage\relax
  \ouc@chapter[Abstract]{Abstract}%
  \let\clearpage\standardclearpage
  \vspace{1em}
}{
  \par\null\par\noindent\hangindent=5.3em\relax
  \textbf{Keywords: \ouc@enkeywords}
  \clearpage
  \pagestyle{title}
  \pagenumberingnoreset{arabic}
}

% Toc
\renewcommand{\contentsname}{目\zhspace[1]录}
\renewcommand\tableofcontents{%
  \pagestyle{empty}
  \chapter*{\contentsname}%
  \@starttoc{toc}%
  \clearpage
  \pagestyle{title}
}

\newcommand\ouc@leaders{\titlerule*[4\bp@]{\textperiodcentered}}
\titlecontents{chapter}
[\z@]{\fontsize{14\bp@}{25.67\bp@}\selectfont}
{\contentspush{\thecontentslabel\unskip\hspace{\ccwd}}}{}
{ \ouc@leaders\contentspage}
\titlecontents{section}
[\ccwd]{\normalsize}
{\contentspush{\thecontentslabel\hspace{\ccwd}}}{}
{ \ouc@leaders\contentspage}
\titlecontents{subsection}
[2\ccwd]{\normalsize}
{\contentspush{\thecontentslabel\hspace{\ccwd}}}{}
{ \ouc@leaders\contentspage}


% ===============================================
% Main Content Format 

\renewcommand\chapter{%
  \if@openright\cleardoublepage\else\clearpage\fi
  \global\@topnum\z@
  \@afterindenttrue
  \secdef\@chapter\@schapter
}
\renewcommand\mainmatter{
  \clearpage
  \pagestyle{title}
  \setcounter{page}{1}
  \ctexset{
    chapter = {
      format      = \sffamily\fontsize{16\bp@}{26.67\bp@}\selectfont,
      aftername   = \zhspace[0.5],
      beforeskip  = 1em,
      afterskip   = 1.8em,
      fixskip     = true,
    },
    section = {
      format = \sffamily\fontsize{14\bp@}{25.67\bp@}\selectfont,
      aftername   = \zhspace[0.5],
      afterskip   = 1.2em,
      fixskip     = false,
    },
    subsection = {
      format    = \fontsize{12\bp@}{22\bp@}\selectfont,
      aftername   = \zhspace[0.5],
      afterskip   = 1.2em,
      fixskip     = false,
      indent    = \z@,
    },
    subsubsection = {
      format    = \rmfamily\fontsize{12\bp@}{22\bp@}\selectfont,
      aftername   = \zhspace[0.5],
      fixskip     = false,
      indent    = \ccwd,
    },
    paragraph = {
      format    = \rmfamily\fontsize{12\bp@}{22\bp@}\selectfont,
      aftername = {},
      indent    = \ccwd,
    },
  }
}

% Caption Stype
\renewcommand{\thetable}{\thechapter-\arabic{table}~}
\renewcommand{\thefigure}{\thechapter-\arabic{figure}~}
\counterwithin{algorithm}{chapter}
\renewcommand{\thealgorithm}{\thechapter-\arabic{algorithm}}
\floatname{algorithm}{算法}
\DeclareCaptionLabelSeparator{space}{ }
\captionsetup{
   labelsep=space
}

\renewcommand{\theequation}{\arabic{chapter}-\arabic{equation}}
\RequirePackage{mathtools}
\newtagform{test}[]{式（}{）}
\usetagform{test}

% ===============================================
% Tail Content Format 
\newcommand\makeafter{
  \clearpage
  \ctexset{
    chapter = {
      name        = {,},
      format      = \centering\sffamily\fontsize{14\bp@}{25.67\bp@}\selectfont,
      nameformat  = {},
      number      = \thechapter,
      aftername   = \hspace{\ccwd},
      beforeskip  = 24\bp@,
      afterskip   = 18\bp@,
      fixskip     = true,
    },
    section = {
      name        = {,},
      format      = \centering\sffamily\bfseries\normalsize\selectfont,
      nameformat  = {},
      number      = \thechapter,
      aftername   = \hspace{\ccwd},
      beforeskip  = 24\bp@,
      afterskip   = 18\bp@,
      fixskip     = true,
    },
  }
}

\newcommand\bibstyle@super{\bibpunct{[}{]}{,}{s}{,}{\textsuperscript{,}}}
\citestyle{super}
\renewcommand\bibfont{\fontsize{10.5\bp@}{20\bp@}\selectfont}
\setlength{\bibsep}{0\p@ \@plus.2\p@}
\setlength{\bibhang}{2\ccwd}
\renewcommand\@biblabel[1]{[#1]\hfill}

\renewcommand\bibsection{%
  \makeafter
  \ouc@chapter{\bibname}%
}

\newenvironment{ackonwlegmentback}{%
  \clearpage
  \makeafter
  \ouc@setchinese
  \ouc@chapter{致\zhspace[1]谢}
}{
  \clearpage
}

\newenvironment{profile}{%
  \clearpage
  \makeafter
  \ouc@setchinese
  \ouc@chapter{个人简历、在学期间发表的学术论文与研究成果}
}{
  \clearpage
}
