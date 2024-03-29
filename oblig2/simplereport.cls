\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{simplereport}[2019/11/07 LaTeX class for simple reports]

\LoadClass[a4paper]{article}
\def\@course{}
\def\@courseCode{}


\newcommand{\course}[2][]{\def\@course{#2}
	\ifx#1\@empty
	\relax
	\else
	\def\@courseCode{#1}
	\fi}

\newif\if@defaultpackages\@defaultpackagesfalse
\DeclareOption{defaultpackages}{\@defaultpackagestrue}
\newif\if@defaultbibliography\@defaultbibliographyfalse
\DeclareOption{bib}{\@defaultbibliographytrue}
\DeclareOption{inf2200}{%
	\course[INF-2200]{Computer Architecture and Organization}
}
\DeclareOption{inf1101}{%
	\course[INF-1101]{Datastrukturer og Algoritmer}
}
\DeclareOption{inf1400}{%
	\course[INF-1400]{Object Oriented Programming}
}
\DeclareOption{inf1100}{%
	\course[INF-1100]{Introduction to Programming and Computer Behavior}
}
\DeclareOption{inf2201}{%
	\course[INF-2201]{Operating System Fundamentals}
}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

\RequirePackage{etoolbox}

%\ifdef{\course}{}{\ClassError{simplereport}{Course not added}{You need to add a course.
		%This is a class option, add square bracets after documentclass, 
		%and choose between inf1100, inf1101, inf1400 and inf2200}}

\pagenumbering{arabic}

\RequirePackage{sectsty} % This is to get section and title style
\RequirePackage{fancyhdr} % This should be set AFTER setting up the page geometry
% This is for pagestyle

\if@defaultpackages
\ClassInfo{simplereport}{Loading of default packages}
\RequirePackage[utf8]{inputenc}
\RequirePackage[english]{babel}
\RequirePackage{graphicx}
\RequirePackage{amssymb}
\RequirePackage{mathtools}
\RequirePackage{booktabs} % for much better looking tables
\RequirePackage{array} % for better arrays (eg matrices) in maths
\RequirePackage{paralist} % very flexible & customisable lists (eg. enumerate/itemize, etc.)
\RequirePackage{verbatim} % adds environment for commenting out blocks of text & for better verbatim
\RequirePackage{subfig} % make it possible to include more than one captioned figure/table in a single float
\fi

\allsectionsfont{\sffamily\mdseries\upshape}

\setlength{\topmargin}{-3mm}
\setlength{\oddsidemargin}{0mm}
\setlength{\textwidth}{15.7cm}
\setlength{\textheight}{22.0cm}

\pagestyle{fancyplain}

\RequirePackage{lastpage} % to get the correct numbering of the last page

\renewcommand{\normalsize}{\fontsize{10}{12}\selectfont}

\renewcommand{\headrulewidth}{1pt} % customise the layout...
\renewcommand{\footrulewidth}{0pt}
\lhead{\fancyplain{}{
\ifx\@courseCode\@empty
\relax
\else
\@courseCode:
\fi
\@title}}\chead{}\rhead{\fancyplain{}{\@author{}}}
\lfoot{}\cfoot{Page {\thepage} of~\pageref{LastPage}}\rfoot{}

\renewcommand{\maketitle}{%
	\begin{center}
		\ifx\@course\@empty
		\relax
		\else
	\textsc{\Large
		\ifx\@courseCode\@empty
		\relax
		\else
		\@courseCode:
		\fi
		\@course}\\[0.5cm]
	\fi

	\ifx\@title\@empty
	\ClassError{simplereport}{Trying to maketitle without title}{What is wrong with you?}
	\else
	\textsc{\LARGE \@title}\\[1.0cm]
	\fi

	\ifx\@author\@empty
	\relax
	\else
	\LARGE{\@author} \\[0.5cm]
	\fi

	{\large \today}
\end{center}
}

\if@defaultbibliography
\RequirePackage[backend=biber]{biblatex}
\AtEndDocument{%
	\lfoot{}\cfoot{}\rfoot{}
	\printbibliography{}
	\ClassInfo{simplereport}{Remember to add a bibliography with addbibresource}
}
\fi

\endinput
