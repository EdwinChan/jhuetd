% identification
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{jhuetd}[2016/05/19 Johns Hopkins University
  electronic theses and dissertations]
% options
\RequirePackage{kvoptions}
\newif\ifetd@phd
\SetupKeyvalOptions{family=etd, prefix=etd@}
\DeclareStringOption{masters}
\DeclareVoidOption{phd}{\etd@phdtrue}
\DeclareVoidOption{debug}{\AtEndOfClass{
  \RequirePackage{eso-pic,tikz}
  \AddToShipoutPictureBG{\tikz[overlay, remember picture]
    \draw[lightgray] (current page.south west) grid[step=.5in]
      (current page.north east);}}}
\DeclareDefaultOption{\PassOptionsToClass\CurrentOption{memoir}}
\ProcessKeyvalOptions*
% option checks
\ifetd@phd\ifx\@empty\etd@masters\@empty\else
  \ClassError{jhuetd}{Must use either option: 'masters' or 'phd'}{}\fi\fi
\ifetd@phd\else\ifx\@empty\etd@masters\@empty
  \ClassError{jhuetd}{Must use either option: 'masters' or 'phd'}{}\fi\fi
% base class and packages
\LoadClass[letterpaper, oneside, 10pt]{memoir}
\@ifclasslater{memoir}{2013/05/22}{}{\ClassError{jhuetd}
  {Requires document class 'memoir' not older than\MessageBreak2013/05/22}{}}
\RequirePackage{etoolbox}
% PDF/A-1b conformance
%\RequirePackage[a-1b]{pdfx}
% margin paragraphs (must precede \checkandfixthelayout)
\marginparmargin{left}
\setmarginnotes\marginparsep{1in}\marginparpush
% geometry
\setlrmarginsandblock{1.5in}{1in}{*}
\setulmarginsandblock{1in}{1in}{*}
\checkandfixthelayout[fixed]
% correction for memoir rounding \textwidth in points down to nearest integer
\textwidth6in\relax
% title page
\RequirePackage{hyperref}
\renewcommand*\date[2]{\protected@xdef\@year{#1}\protected@xdef\@month{#2}}
\protected@edef\etd@statement{\ifetd@phd
  A dissertation submitted to the Johns Hopkins University\par
  in conformity with the requirements for the degree of\par
  Doctor of Philosophy%
\else
  A thesis submitted to the Johns Hopkins University\par
  in conformity with the requirements for the degree of\par
  Master of \etd@masters
\fi}
\newcommand*\etd@address{Baltimore, Maryland}
\newcommand*\etd@copyright{%
  \textcopyright~\@year{} \@author\par All rights reserved}
\renewcommand*\maketitle{%
  \hypersetup{pdftitle=\@title, pdfauthor=\@author}%
  \begin{titlingpage}\begin{center}
    \SingleSpacing\nointerlineskip\vglue-\topskip\vskip1.5in
    \MakeUppercase\@title\vskip1in
    by\par\@author\vskip1.5in\relax
    \etd@statement\vskip.5in\relax
    \etd@address\par\@month,~\@year\vfill
    \etd@copyright\vskip1in
  \end{center}\end{titlingpage}\addtocounter{page}{1}}
% abstract
\apptocmd\abstract{\noindent\ignorespaces}{}{}
% dedication
\newenvironment{dedication}
  {\newpage\begin{center}\nointerlineskip\vglue-\topskip}
  {\end{center}\newpage}
% section numbering
\setsecnumdepth{subsection}
\settocdepth{subsection}
% header and footer
\pagestyle{plain}
% margin paragraphs
\let\etd@marginparfont\relax
\newcommand*\marginparfont[1]{\def\etd@marginparfont{#1}}
\patchcmd\@xmpar{#1}{\etd@marginparfont#1}{}
  {\ClassError{jhuetd}{Cannot patch margin paragraph}{}}
\patchcmd\@xmpar{#2}{\etd@marginparfont#2}{}
  {\ClassError{jhuetd}{Cannot patch margin paragraph}{}}
\patchcmd\@ympar{#1}{\etd@marginparfont#1}{}
  {\ClassError{jhuetd}{Cannot patch margin paragraph}{}}
% floats
\setfloatadjustment{figure}\centering
\setfloatadjustment{table}{\centering\renewcommand*\arraystretch{1.1}\small}
\captionnamefont{\bfseries\footnotesize}
\captiontitlefont\footnotesize
\captiondelim{. }
% references
\AtEndPreamble{
  \RequirePackage{cleveref}
  \let\eqref\@undefined
  \crefname{chapter}{Chapter}{Chapters}
  \crefname{section}{\S\@gobble}{{\S\S}\@gobble}
  \crefname{equation}{Equation}{Equations}
  \crefname{figure}{Figure}{Figures}
  \crefname{table}{Table}{Tables}
  \crefname{appendix}{Appendix}{Appendices}}
% bibliography with bookmark on chapter title
\nobibintoc
\AtEndPreamble{\@ifpackageloaded{biblatex}
  {\expandafter\patchcmd\csname\string\blx@head@bibliography\endcsname{*}{}{}
    {\ClassError{jhuetd}{Cannot patch bibliography}{}}}
  {\patchcmd\@memb@bchap{*}{}{}
    {\ClassError{jhuetd}{Cannot patch bibliography}{}}}}
% double spacing
\DoubleSpacing
% quotes for American English
\RequirePackage{csquotes}
\DeclareAutoPunct{.,}
\renewcommand\mktextquote[6]{#1#2#4#5#3#6}
% text color
\RequirePackage{color,hyperref}
\AtBeginDocument{\color[RGB]{35,31,32}}
\hypersetup{colorlinks, linkcolor=[RGB]{237,28,36}}
% end
\endinput
