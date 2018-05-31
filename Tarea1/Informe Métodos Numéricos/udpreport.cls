% udpreport.cls
% Reports for the UDP documents
% Adin Ramirez adin.ramirez (at) mail.udp.cl
\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{udpreport} [2014/12/19 v0.01 Report of the UDP]


% --- Class structure: declaration of options part
% ---
% This class extends the article class
% Read all the documentclass options; pass them to article,
% unless the file "<currentoption>.udp" exists, then it is loaded
\DeclareOption*{\InputIfFileExists{\CurrentOption.udp}{}{
%
\PassOptionsToClass{\CurrentOption}{report}}}
% --- Class structure: execution of options part
% ---
\ProcessOptions \relax
% --- Class structure: declaration of options part
% ---
\LoadClass{report}

% Page layout
\RequirePackage[left=2.5cm,right=2.5cm,top=3cm,bottom=2cm]{geometry}

% For using the empty verification
\RequirePackage{etoolbox}

% Headers and footers
\RequirePackage{fancyhdr}

\fancypagestyle{followingpage}{
  %
  \fancyhf{}
  % clear all six fields
  \fancyhead[RO]{\rightmark}%
  \fancyhead[LE]{\leftmark}%
  \fancyfoot[LE,RO]{\thepage}%
  %
  \renewcommand{\headrulewidth}{0.7pt}
  \renewcommand{\footrulewidth}{0pt}
}

\fancypagestyle{plain}{%
  \fancyhead{}%
  \renewcommand{\headrulewidth}{0pt}
  \renewcommand{\footrulewidth}{0pt}
  \fancyfoot[LE,RO]{\thepage}%
}

\pagestyle{followingpage}

% Contains all the udp logos and other stuff
\RequirePackage{udp}

%% Definitions and commands
% Strings to typeset the logo
\newcommand{\udp@school}{Escuela de Informática y Telecomunicaciones}
\newcommand{\udp@faculty}{Facultad de Ingeniería}
\newcommand{\udp@university}{Universidad Diego Portales}
% Default logo to UDP (see logo definition at the bottom)
\setlogo{UDP}

\newcommand{\udpschool}[1]{\gdef\udp@school{#1}}
\newcommand{\udpfaculty}[1]{\gdef\udp@faculty{#1}}
\newcommand{\udpuniversity}[1]{\gdef\udp@university{#1}}

% string for email
\newcommand{\udp@mail}{}
\newcommand{\email}[1]{\gdef\udp@mail{#1}}


% Re-define the title
\def\maketitle{%
  \udp@titlepage%
  \setcounter{page}{1}% page 1 (frontmatter)
  \thispagestyle{followingpage}
}

% Re-define chapter
\RequirePackage{titlesec}
\titleformat{\chapter}{}{\bf\LARGE\thechapter.~}{0em}{\bf\LARGE}

% Cover page
% Logo structure
\setlogosz{66.5mm}% tweaked by hand
\newcommand{\udp@titlepage}{%
  \thispagestyle{empty}%
  % logo here
  \begin{center}%
    \bfseries%
    \ifdefempty{\@logo}{}{%ifnotempty
    \begin{minipage}{\@logosz}
    \@logo\\%
    \end{minipage}%
    }%ifnotmtarg
    \par\vspace{20pt}%
    \udp@faculty\par%
    \udp@school\par%
    \rule[1pt]{\textwidth}{1pt}%
  \end{center}%
  % form the cover page
  \vskip 1em%
  {\bfseries%
    \vspace{40pt}%
    \begin{center}%
      {\LARGE\@title\par}%
      \vskip 40pt%
      {\large\@author}\\%
      {\texttt{\udp@mail}}\\%
      \vfill%
      \@date%
    \end{center}%
  }%
  \newpage%
}

% Set the spanish system (ironically, the comments are in english, but.. who cares)
\RequirePackage{udpspanish}