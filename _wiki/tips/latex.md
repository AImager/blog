\documentclass{article}

% 设置包
\usepackage{xeCJK}	% 中文核心支持
\usepackage{listings}	% 代码插入支持
\usepackage{xcolor}	% 代码高亮支持

% 设置字体
\setCJKmainfont[BoldFont={STHeiti},ItalicFont=STKaiti]{STSong}
\setCJKsansfont{STHeiti}
\setCJKmonofont{STFangsong}


% 设置全局缩进大小
% \setlength{\parindent}{0pt}


% 设置插入代码
\lstset{
numbers=left,
numberstyle=\tiny,
keywordstyle=\color{blue!70},
commentstyle=\color{red!50!green!50!blue!50},
frame=shadowbox,
rulesepcolor=\color{red!20!green!20!blue!20},
escapeinside=[]	% listings宏包默认不支持中文
}


\begin{document}


\noindent
\textbf{\large{基础排版}}

\indent
换行：\verb=\\=

居中：\verb=\begin{center}...\end{center}=


\noindent
\textbf{\large{字体设置}}



\noindent
\textbf{\large{特殊符号}}

反斜杠（\verb|\|）： \verb=\verb|\|=

双反斜杠（\verb|\\|）：\verb=\verb|\\|=




% 代码正文段
\begin{lstlisting}[language={[ANSI]C}]
int main(int argc, char ** argv)
{
    printf("[中文是世界上最美的文字]\n");
    return 0;
}
\end{lstlisting}


LaTeX3出来之前，最好的LaTeX解决方案是LaTeX2e，二LaTeX2e最好的搭配是xeLaTeX和xeCJK


\end{document}
