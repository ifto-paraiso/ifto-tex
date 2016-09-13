%%
%% Customizações do abnTeX2 (http://abnTeX2.googlecode.com) para a Universidade XXXX
%%
%% This work may be distributed and/or modified under the
%% conditions of the LaTeX Project Public License, either version 1.3
%% of this license or (at your option) any later version.
%% The latest version of this license is in
%%   http://www.latex-project.org/lppl.txt
%% and version 1.3 or later is part of all distributions of LaTeX
%% version 2005/12/01 or later.
%%
%% This work has the LPPL maintenance status `maintained'.
%% 
%% The Current Maintainer of this work is Matheus Liberato, matheusliberatosbs@gmail.com
%%
%% Further information about abnTeX2 are available on http://abntex2.googlecode.com/
%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{tcc}[2013/04/01 v1.0 Modelo TCC baseado em abnTeX2]

% Repassa os parâmetros ao abntex2
\DeclareOption*{%
\PassOptionsToClass{\CurrentOption}{abntex2}
}

\PassOptionsToClass{
chapter=TITLE,
12pt, % Tamanho da fonte
oneside, % Para impressão em verso e anverso. Oposto a oneside
a4paper, % Tamanho do papel
english, % Idioma adicional para hifenização
brazilian, %
brazil % o último idioma é o principal do documento
}{abntex2}

\ProcessOptions\relax
\LoadClass{abntex2}

% Pacotes
%% Correção ortográfica
%\RequirePackage[brazil,brazilian]{babel}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Pacotes necessários para compilar.    %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{graphicx}
%\RequirePackage[scaled]{uarial}
%\renewcommand*\familydefault{\sfdefault}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Comando para exibir o ano de uma data %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\imprimirano}{\the\year}
%\newcommand{\imprimirano}{2014}

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% %
%   ALTERA O TAMANHO DAS FONTES DOS CAPITULOS, SECOES ETC.      %
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% %

%\renewcommand{\ABNTEXchapterfont}{\sffamily}
\renewcommand{\ABNTEXchapterfont}{}
\renewcommand{\ABNTEXchapterfontsize}{\normalsize\bfseries}

\renewcommand{\ABNTEXpartfont}{\ABNTEXchapterfont}
\renewcommand{\ABNTEXpartfontsize}{\ABNTEXchapterfontsize}

\renewcommand{\ABNTEXsectionfont}{\ABNTEXchapterfont}
\renewcommand{\ABNTEXsectionfontsize}{\normalsize\bfseries}

\renewcommand{\ABNTEXsubsectionfont}{\ABNTEXsectionfont}
\renewcommand{\ABNTEXsubsectionfontsize}{\normalsize\bfseries}

\renewcommand{\ABNTEXsubsubsectionfont}{\ABNTEXsubsectionfont}
\renewcommand{\ABNTEXsubsubsectionfontsize}{\normalsize\bfseries}

\renewcommand{\ABNTEXsubsubsubsectionfont}{\ABNTEXsubsectionfont}
\renewcommand{\ABNTEXsubsubsubsectionfontsize}{\normalsize\bfseries}


% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% %
%   ALTERA O TAMANHO DAS FONTES DOS CAPITULOS, SECOES ETC       %
%   NO SUMARIO
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% %

%% Deixa as fontes do sumário do mesmo tamanho para seções secundarias, ternárias, quaternárias e quinárias.
\renewcommand{\cftsectionfont}{\bfseries}
\renewcommand{\cftsectionpagefont}{\cftsectionfont}
%
\renewcommand{\cftsubsectionfont}{\normalsize}
\renewcommand{\cftsubsectionpagefont}{\cftsectionfont}
%
\renewcommand{\cftsubsubsectionfont}{\normalsize}
\renewcommand{\cftsubsubsectionpagefont}{\cftsectionfont}
%
\renewcommand{\cftparagraphfont}{\normalsize}
\renewcommand{\cftparagraphpagefont}{\cftsectionfont}

% Tira o negrito das seções no sumário.
\renewcommand{\cftsectionfont}{}
\renewcommand{\cftsectionpagefont}{\cftsectionfont}

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% %

%%%
%% Altera o nome de 'Referências Bibliográficas' para apenas 'Referências'
%% 
\AtBeginDocument{
  \addto\captionsbrazil{
    \renewcommand\bibname{REFER\^ENCIAS}
    \renewcommand\listfigurename{Lista de Figuras}
  }
}

% -----
% Declaracoes de cabecalhos 
% -----
% Cabecalho padrao
\makepagestyle{abntheadings}
\makeevenhead{abntheadings}{\ABNTEXfontereduzida\thepage}{}{\ABNTEXfontereduzida}
\makeoddhead{abntheadings}{\ABNTEXfontereduzida\textit\rightmark}{}{\ABNTEXfontereduzida\thepage}
%\makeheadrule{abntheadings}{\textwidth}{\normalrulethickness}

% Cabecalho do inicio do capitulo
\makepagestyle{abntchapfirst}
\makeoddhead{abntchapfirst}{}{}{\ABNTEXfontereduzida\thepage}
% ---

%%%%%
%% Altera cabeçalho da parte textual.
%%%%%
% ---
% Configura layout para elementos textuais
\renewcommand{\textual}{%
  \ifthenelse{\equal{\ABNTEXisarticle}{true}}{%
    \pagestyle{plain}%
  }{%else  
    %\pagestyle{abntheadings}
    \pagestyle{simple}
    \aliaspagestyle{chapter}{abntchapfirst}
  }  
  \nouppercaseheads%
  \bookmarksetup{startatroot}% 
}
\renewcommand{\mainmatter}{\textual}
% ---

% ----
% ESPAÇO ENTRE O CAPITULO E O TEXTO
% ----
\setlength\afterchapskip{1.5cm}

\setlength\beforesecskip{1.5cm} %espaçamento entre seção e texto
\setlength\aftersecskip{1.5cm} %espaçamento entre seção e texto

\setlength\beforesubsecskip{1.5cm} %espaçamento entre seção e texto
\setlength\aftersubsecskip{1.5cm} %espaçamento entre subseção e texto

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% %
% Novo list of (listings) para graficos
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% %

% Novo list of (listings) para graficos

\newcommand{\graficoname}{Gráfico}
\newcommand{\listofgraficosname}{Lista de Gráficos}

\newfloat[chapter]{grafico}{loq}{\graficoname}
\newlistof{listofgraficos}{loq}{\listofgraficosname}
\newlistentry{grafico}{loq}{0}

% configurações para atender às regras da ABNT
\counterwithout{grafico}{chapter}
\renewcommand{\cftgraficoname}{\graficoname\space} 
\renewcommand*{\cftgraficoaftersnum}{\hfill--\hfill}

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% %
% Novo list of (listings) para EQUACOES
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% %

% Novo list of (listings) para EQUACOES

\newcommand{\equacoesname}{Equação}
\newcommand{\listofequacoesname}{Lista de Equações}

\newfloat[chapter]{equacoes}{loe}{\equacoesname}
\newlistof{listofequacoes}{loe}{\listofequacoesname}
\newlistentry{equacoes}{loe}{0}

% configurações para atender às regras da ABNT
\counterwithout{equacoes}{chapter}
\renewcommand{\cftequacoesname}{\equacoesname\space} 
\renewcommand*{\cftequacoesaftersnum}{\hfill--\hfill}

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% %
%   ALTERA A CRIACAO DA CAPA
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% %


\newcommand{\imprimirbrasao}{
	\begin{figure*}[h]
		\centering
		{\includegraphics[width=1cm]{logo}}
	\end{figure*}	
}


\renewcommand{\imprimircapa}{%
  \begin{capa}%
    \center
	\imprimirbrasao
    {\bfseries\normalsize\imprimirinstituicao}
    
    \vspace*{2cm}
    
    %{\ABNTEXchapterfont\normalsize\MakeTextUppercase\imprimirautor}
    {\normalsize\bfseries\imprimirautor}

	\vspace*{\fill}
	
	\begin{center}
		\normalsize\bfseries\imprimirtitulo
	\end{center}
	
	\vspace*{\fill}\vspace*{\fill}\vspace*{\fill}
    
    \normalsize\bfseries\imprimirlocal

    \bfseries\normalsize\imprimirano
    
    \vspace*{1cm}
  \end{capa}
}

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% %
%   ALTERA A CRIACAO DA FOLHA DE ROSTO
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% %

\makeatletter

% Comandos de dados - orientador
\providecommand{\imprimirorientadorRotulo}{}
\providecommand{\imprimirorientador}{}
\providecommand{\imprimirtitulacaoorientador}{}
\renewcommand{\orientador}[3][\orientadorname]%
  {\renewcommand{\imprimirorientadorRotulo}{#1}%
   \renewcommand{\imprimirtitulacaoorientador}{#2}%
   \renewcommand{\imprimirorientador}{#3}}

\renewcommand{\folhaderostocontent}{
	\begin{center}    
		\imprimirbrasao
	{\bfseries\normalsize\imprimirinstituicao}
	
	\vspace*{2cm}
	{\normalsize\bfseries\imprimirautor}
	
	\vspace*{\fill}\vspace*{\fill}
	
	\begin{center}
	\bfseries\imprimirtitulo
	\end{center}
	
	\vspace*{\fill}
	
	\abntex@ifnotempty{\imprimirpreambulo}{%
	  \hspace{.45\textwidth}
	  \begin{minipage}{.5\textwidth}
	  \SingleSpacing
	  \small\imprimirpreambulo
	  \vspace{0.5cm}
	  {\par{\normalsize\bfseries\imprimirorientadorRotulo}~\imprimirtitulacaoorientador~\normalsize\imprimirorientador\par}
	  \end{minipage}%
	  \vspace*{\fill}
	}%
	
	% Caso exista coorientador.
	\abntex@ifnotempty{\imprimircoorientador}{%
	  {\normalsize\imprimircoorientadorRotulo~\imprimircoorientador}%
	}%
	
	\vspace*{\fill}
	
	{\bfseries\normalsize\imprimirlocal}
	
	{\bfseries\normalsize\imprimirano}
	\vspace*{1cm}
	\end{center}
}

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% %
%   ALTERA A CRIACAO DA FOLHA DE APROVACAO
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% %

% Comandos de dados - primeiro membro da banca.
\providecommand{\imprimirtitulacaoprimeiromembrodabanca}{}
\providecommand{\imprimirprimeiromembrodabanca}{}
\providecommand{\imprimirinstituicaoprimeiromembrodabanca}{}
\newcommand{\primeiromembrodabanca}[3]%
  {\renewcommand{\imprimirtitulacaoprimeiromembrodabanca}{#1}%
   \renewcommand{\imprimirprimeiromembrodabanca}{#2}%
   \renewcommand{\imprimirinstituicaoprimeiromembrodabanca}{#3}}


% Comandos de dados - segundo membro da banca.
\providecommand{\imprimirtitulacaosegundomembrodabanca}{}
\providecommand{\imprimirsegundomembrodabanca}{}
\providecommand{\imprimirinstituicaosegundomembrodabanca}{}
\newcommand{\segundomembrodabanca}[3]%
  {\renewcommand{\imprimirtitulacaosegundomembrodabanca}{#1}%
   \renewcommand{\imprimirsegundomembrodabanca}{#2}%
   \renewcommand{\imprimirinstituicaosegundomembrodabanca}{#3}}


% Comandos de dados - terceiro membro da banca.
\providecommand{\imprimirtitulacaoterceiromembrodabanca}{}
\providecommand{\imprimirterceiromembrodabanca}{}
\providecommand{\imprimirinstituicaoterceiromembrodabanca}{}
\newcommand{\terceiromembrodabanca}[3]%
  {\renewcommand{\imprimirtitulacaoterceiromembrodabanca}{#1}%
   \renewcommand{\imprimirterceiromembrodabanca}{#2}%
   \renewcommand{\imprimirinstituicaoterceiromembrodabanca}{#3}}



\newcommand{\folhadeaprovacaoteste}{
\begin{folhadeaprovacao}

  \begin{center}
    {\normalsize\MakeTextUppercase\imprimirautor}

    \vspace*{\fill}

    \begin{center}
      {\bfseries\large\MakeTextUppercase\imprimirtitulo}
    \end{center}
    \vspace*{0.5cm}
    \end{center}

    {\noindent\imprimirpreambulo\par}
    \vspace*{\fill}

    \begin{center}
      {{\normalsize\bfseries\MakeTextUppercase{Banca Examinadora}} \par \imprimirdata}
      \vspace*{0.5cm}
    \end{center}

   \assinatura{{\bfseries\imprimirtitulacaoprimeiromembrodabanca~\imprimirprimeiromembrodabanca} \\ \imprimirinstituicaoprimeiromembrodabanca}

   \assinatura{{\bfseries\imprimirtitulacaosegundomembrodabanca~\imprimirsegundomembrodabanca} \\ \imprimirinstituicaosegundomembrodabanca}

   \assinatura{{\bfseries\imprimirtitulacaoterceiromembrodabanca~\imprimirterceiromembrodabanca} \\ \imprimirinstituicaoterceiromembrodabanca}
   
   \vspace*{\fill}
      
   \begin{center}
    {\normalsize\bfseries\MakeTextUppercase{Local} \par}
    \vspace*{0.3cm}
    {\normalsize\tituicao}
    \par
    {\normalsize\imprimirlocal, SP}
    \par
    %{\large\imprimirdata}
    \vspace*{1cm}
  \end{center}
  
\end{folhadeaprovacao}
}
\makeatother