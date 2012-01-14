%% oucethesis v1.0
%% Version 1.0 released 09/02/2006
%% By Mintae Choi <mintae.choi@ouce.ox.ac.uk>
%%
\def\fileversion{1.0}
\def\filedate{09/02/2006}
\def\docdate{09/02/2006}

\NeedsTeXFormat{LaTeX2e}

\ProvidesClass{oucethesis}
   [\filedate\space v\fileversion\space
    OUCE thesis class]

\RequirePackage{setspace}
\newif\ifsinglesp@

\DeclareOption{singlespace}{\singlesp@true}
\DeclareOption{doublespace}{\doublesp@true}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}

\ProcessOptions
\LoadClass{book}

\newcommand{\submittedtext}{{A thesis submitted for the degree of}}

%% Disallow page breaks at hyphens (this will give some underfull vbox's,
%% so an alternative is to use \brokenpenalty=100 and manually search
%% for and fix such page breaks)
\brokenpenalty=10000

%% Set up line spacing
\AtBeginDocument{%
\ifsinglesp@%
  \singlespacing%
\else%
  \doublespacing% to meet 8 mm linespace requirement
%  \onehalfspacing%
\fi
}

% line space redefined for bibliography
\let\oldthebibliography=\thebibliography
\let\endoldthebibliography=\endthebibliography
\renewenvironment{thebibliography}[1]{%
	\begin{oldthebibliography}{#1}%
		\setlength{\parskip}{1ex}%
		\setlength{\itemsep}{1ex}%
		\singlespacing%
%		\onehalfspacing%
}%
{%
	\end{oldthebibliography}%
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% DECLARATIONS
%
% These macros are used to declare arguments needed for the
% construction of the title page and other preamble.

% The year and term the degree will be officially conferred
\def\degreedate#1{\gdef\@degreedate{#1}}
% The full (unabbreviated) name of the degree
\def\degreetitle#1{\gdef\@degreetitle{#1}}
% The name of your Oxford college (e.g. Christ Church, Pembroke)
\def\college#1{\gdef\@college{#1}}

%\font\beltcrestfont=oxbeltcrest
%\def\beltcrest{{\beltcrestfont \char0}}

\newenvironment{alwayssingle}{%
       \@restonecolfalse
       \if@twocolumn\@restonecoltrue\onecolumn
       \else\if@openright\cleardoublepage\else\clearpage\fi
       \fi}%
       {\if@restonecol\twocolumn
       \else\newpage\thispagestyle{empty}\fi}

%define title page layout
\renewcommand{\maketitle}{%
    \begin{onehalfspace}
    \begin{alwayssingle}
        \thispagestyle{empty}
        \null \vfill
        \begin{center}
            {\Large \textbf{\@title} \par}
            \vspace*{25ex}
            {\large \textbf{\@author} \\}
            {
             { \@college \par}
             \vspace*{20ex}
%             \vspace*{14ex} {\beltcrest \par}\vspace*{14ex}
%             {\includegraphics[width=0.25\textwidth]{oucrest.eps} \par}
             \vspace*{20ex}
             { \submittedtext \\}
             {\@degreetitle \\}
             {in the University of Oxford \\}
             \vspace*{1ex}
             {\@degreedate}
            }
        \end{center}
        \null \vfill
    \end{alwayssingle}
    \end{onehalfspace}
}

% DEDICATION
%
% The dedication environment makes sure the dedication gets its
% own page and is set out in verse format.
\newenvironment{dedication}
{\begin{alwayssingle}
  \thispagestyle{plain}
  \begin{center}
  \vspace*{1.5cm}
  {\LARGE }
  \end{center}
  \vspace{0.5cm}
  \begin{verse}\begin{center}}
{\end{center}\end{verse}\end{alwayssingle}}


% ACKNOWLEDGEMENTS
%
% The acknowledgements environment puts a large, bold, centered
% "Acknowledgements" label at the top of the page. The acknowledgements
% themselves appear in a quote environment, i.e. tabbed in at both sides, and
% on its own page.
\newenvironment{acknowledgements}
{\begin{alwayssingle} \thispagestyle{plain}
\begin{center}
\vspace*{1.5cm}
{\LARGE \bfseries ACKNOWLEDGEMENTS}
\end{center}
\vspace{0.5cm}}
{\end{alwayssingle}}

%ABSTRACT
%
%The abstract environment puts a large, bold, centered "Abstract" label at
%the top of the page. The abstract itself appears in a quote environment,
%i.e. tabbed in at both sides, and on its own page.
\newenvironment{abstract} {\begin{alwayssingle} \thispagestyle{plain}
  \begin{center}
  \vspace*{1.5cm}
  {\LARGE \bfseries  ABSTRACT}
  \end{center}
  \vspace{0.5cm}
   \begin{quotation}}
{\end{quotation}\end{alwayssingle}}

%The abstractseparate environment is for running of a page with the abstract
%on including title and author etc as required to be handed in separately
\newenvironment{abstractseparate} {\begin{alwayssingle} \thispagestyle{plain}
 \begin{center}
    {\Large {\bfseries {\@title}} \\}
    {{\normalsize \vspace*{1ex} \textbf{\@author}} \\}
{\footnotesize
    {\@college \\}
\vspace{1ex}
    { \submittedtext \\}
    { \@degreetitle \\}
    {in the University of Oxford \\}
\vspace{1ex}
    {\@degreedate} \\}
\vspace{2ex}
    {\Large \bfseries EXTENDED ABSTRACT}
  \end{center}}
{\end{alwayssingle}}

%ROMANPAGES
%
% The romanpages environment set the page numbering to lowercase roman one
% for the contents and figures lists. It also resets
% page-numbering for the remainder of the dissertation (arabic, starting at 1).
\newenvironment{romanpages}
{\cleardoublepage\setcounter{page}{1}\renewcommand{\thepage}{\roman{page}}}
{\cleardoublepage\renewcommand{\thepage}{\arabic{page}}\setcounter{page}{1}}

%The last line of the file:

\endinput
