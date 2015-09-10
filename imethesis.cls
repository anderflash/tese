\def\ltd@rcsid$#1: #2 #3 #4 #5${#4 v#3}
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{imethesis}
[\ltd@rcsid $Id: imethesis.cls,v 0.1d 2015/09/10 12:33:14 Anderson Tavares stable $
 IME Thesis Class]
\LoadClass{book}

\RequirePackage{kvoptions}
\RequirePackage{graphicx}
\RequirePackage{glossaries}
\RequirePackage{etoolbox}
\RequirePackage[utf8]{inputenc}
\RequirePackage[brazil, english]{babel}
\RequirePackage{amsthm, amsmath, amssymb}
\RequirePackage{helvet}
\RequirePackage{charter}                    % usa o Charter BT no lugar de Computer Modern Typewriter
\RequirePackage{makeidx}
\RequirePackage{setspace}                   % espaçamento flexível
\RequirePackage[usenames,svgnames,dvipsnames]{xcolor}
\RequirePackage[font=small,format=plain,labelfont=bf,up,textfont=it,up]{caption}
\RequirePackage[a4paper,top=2.54cm,bottom=2.0cm,left=2.0cm,right=2.54cm]{geometry} % margens
\RequirePackage[pdftex,plainpages=false,pdfpagelabels,pagebackref,colorlinks=true,citecolor=DarkGreen,linkcolor=NavyBlue,urlcolor=DarkRed,filecolor=green,bookmarksopen=true]{hyperref} % links coloridos
\RequirePackage[all]{hypcap}                    % soluciona o problema com o hyperref e capitulos
\RequirePackage[linesnumbered, ruled, portuguese]{algorithm2e}
\RequirePackage{fancyhdr}

\newbool{br} % Em português
\newbool{en} % Em inglês
\newbool{antes} % Antes da defesa
\newcommand{\en}[1]{\ifen#1\fi}
\newcommand{\br}[1]{\ifbr#1\fi}
\newcommand{\antes}[2]{\ifantes#1\else#2\fi}
\newcommand{\idioma}[1]{\setbool{#1}{true}}

\DeclareOption{antes}{\setbool{antes}{true}}
\DeclareOption{depois}{\setbool{antes}{false}}
\DeclareStringOption[br]{lang}[br]
\ProcessKeyvalOptions*
\ProcessOptions\relax

\setbool{\imethesis@lang}{true}

% ---------------------------------------------------------------------------- %
% Cabeçalhos similares ao TAOCP de Donald E. Knuth
\pagestyle{fancy}
\fancyhf{}
\renewcommand{\chaptermark}[1]{\markboth{\MakeUppercase{#1}}{}}
\renewcommand{\sectionmark}[1]{\markright{\MakeUppercase{#1}}{}}
\renewcommand{\headrulewidth}{0pt}
%------------------------------------------------------------------------------------

\SetKwInOut{Parametro}{Parâmetro}

\SetKwInput{Entrada}{Entrada}%
\SetKwInput{Saida}{Sa\'{i}da}%
\SetKwInput{Dados}{Dados}%
\SetKwInput{Auxiliar}{Auxiliar}%
\SetKwInput{Resultado}{Resultado}%
\SetKw{Ate}{at\'{e}}
\SetKw{KwRetorna}{retorna}%
\SetKw{Retorna}{retorna}%
\SetKwBlock{Inicio}{in\'{i}cio}{fim}%
\SetKwRepeat{Repita}{repita}{at\'{e}}%
%
\SetKwIF{Se}{SenaoSe}{Senao}{se}{ent\~{a}o}{sen\~{a}o se}{sen\~{a}o}{}%
\SetKwSwitch{Selec}{Caso}{Outro}{selecione}{fa\c{c}a}{caso}{sen\~{a}o}{fim caso}{fim selec}%
\SetKwFor{Para}{para}{fa\c{c}a}{}%
\SetKwFor{ParaPar}{para}{fa\c{c}a em paralelo}{}
\SetKwFor{ParaCada}{para cada}{fa\c{c}a}{}%
\SetKwFor{ParaTodo}{para todo}{fa\c{c}a}{}%
\SetKwFor{Enqto}{enquanto}{fa\c{c}a}{}%
\DontPrintSemicolon