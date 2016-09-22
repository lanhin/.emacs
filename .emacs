;(scroll-bar-mode nil);隐藏滚动条，但无效
(set-cursor-color "white");

(customize-set-variable 'scroll-bar-mode 'right);滚动条到右侧去
(menu-bar-mode -1);隐藏菜单栏
(tool-bar-mode -1);隐藏工具栏
(mouse-avoidance-mode 'animate);光标靠近鼠标指针时，让鼠标指针自动走开
;;ibuffer
(require 'ibuffer)
(global-set-key [(f4)] 'ibuffer);将切换buffer绑定到F4上

(add-to-list 'load-path "~/.emacs.d/color-theme-6.6.0")
(require 'color-theme);color theme 设置
(color-theme-initialize);color theme 初始化
(color-theme-calm-forest);选择默认theme（calm forest)

;; EMMS
;(add-to-list 'load-path "/usr/share/emacs/site-lisp/emms/")
;(require 'emms-setup)
;(emms-standard)
;(emms-default-players)
;(setq emms-repeat-playlist t
;      emms-source-file-default-directory "/media/New/Meizu数据备份/Music/"
;      emms-lyrics-coding-system nil     ;; let emacs to identify the encode of lyrics
;      emms-lyrics-dir "/media/New/Meizu数据备份/Music")
;; show info at mode-line
;(require 'emms-mode-line)
;(emms-mode-line 1)
;; show time of music
;(require 'emms-playing-time)
;(emms-playing-time 1)
;; show lyrics
;(require 'emms-lyrics)
;(emms-lyrics 1)
;; auto identify encode
;(require 'emms-i18n)
;; auto save and import playlist
;(require 'emms-history)
;(emms-history-load)
;;emms 快捷键
;(global-set-key (kbd "<f6>") 'emms-play-directory)
;(global-set-key (kbd "<f7>") 'emms-playlist-mode-go)

;需要安装emacs-goodies-el，或直接下载htmlize.el
(add-to-list 'load-path "~/.emacs.d/plugins")
(require 'htmlize)
;**muse
(add-to-list 'load-path "~/.emacs.d/muse-3.20/lisp")
(require 'muse-mode)
(require 'muse-html)
(require 'muse-latex)
;(require 'muse-texinfo)
;(require 'muse-docbook)
;(require 'muse-latex2png)
;(require 'muse-project)
(require 'muse-colors)
;(setq muse-project-alist
;     '(("website" ("~/pages" :default "index")
;	 (:base "html" :path "~/public_html")
;	 (:base "pdf"  :path "~/public_html/pdf")
;	 )))

(setq muse-html-footer "~/.emacs.d/plugins/muse-footer.html")
(setq muse-html-header "~/.emacs.d/plugins/muse-header.html")

;(setq muse-latex-pdf-program "pdflatex")

;pdflatex发布pdf文档：pdfcjk
(setq muse-latexcjk-header
      "\\documentclass{article}

\\usepackage{CJK}
\\usepackage{indentfirst}
\\usepackage[pdftex]{graphicx}
\\usepackage{fancyhdr}
\\usepackage[CJKbookmarks=true]{hyperref}
\\usepackage[top=1.0in,bottom=1.0in,left=1.1in,right=1.1in]{geometry}

\\linespread{1.5}

%% Define a museincludegraphics command, which is
%%   able to handle escaped special characters in image filenames.
\\def\\museincludegraphics{%
  \\begingroup
  \\catcode`\\\|=0
  \\catcode`\\\\=12
  \\catcode`\\\#=12
  \\includegraphics[width=0.75\\textwidth]
}

\\begin{document}
\\begin{CJK*}{UTF8}{gbsn}

\\pagestyle{fancy}
\\title{<lisp>(muse-publish-escape-specials-in-string
  (muse-publishing-directive \"title\") 'document)</lisp>}
\\author{<lisp>(muse-publishing-directive \"author\")</lisp>}
\\date{<lisp>(muse-publishing-directive \"date\")</lisp>}

\\maketitle
\\thispagestyle{empty}
\\newpage
<lisp>(and muse-publish-generate-contents
           (not muse-latex-permit-contents-tag)
           \"\\\\tableofcontents\n\\\\newpage\")</lisp>\n\n")

(setq muse-latex-pdf-program "xelatex")
;xelatex环境下发布pdf：pdf
(setq muse-latex-header
  "\\documentclass{article}

\\usepackage{hyperref}
\\usepackage{xeCJK}
\\usepackage[top=1.1in,bottom=1.1in,left=1.3in,right=1.3in]{geometry}
\\setCJKmainfont[BoldFont={文泉驿正黑},ItalicFont={AR PL KaitiM GB}]{AR PL SungtiL GB}
\\usepackage{graphicx}
\\linespread{1.5}

\\def\\museincludegraphics{%
  \\begingroup
  \\catcode`\\|=0
  \\catcode`\\\\=12
  \\catcode`\\#=12
  \\includegraphics[width=0.7\\textwidth]
}

\\usepackage{fancyhdr}
\\pagestyle{fancy}

\\renewcommand{\\contentsname}{目~录}
\\renewcommand{\\figurename}{图}

\\begin{document}

\\title{<lisp>(muse-publish-escape-specials-in-string
  (muse-publishing-directive \"title\") 'document)</lisp>}
\\author{<lisp>(muse-publishing-directive \"author\")</lisp>}
\\date{<lisp>(muse-publishing-directive \"date\")</lisp>}

\\maketitle
\\thispagestyle{empty}
\\newpage
<lisp>(and muse-publish-generate-contents
           (not muse-latex-permit-contents-tag)
           \"\\\\tableofcontents\n\\\\setcounter{page}{1}\n\\\\newpage\")</lisp>\n\n")

;设置muse-latex-slides-header，以支持中文幻灯片
;(setq muse-latex-pdf-program "pdflatex")
(setq muse-latex-slides-header
  "\\documentclass[CJK,notheorems,mathserif,table]{beamer}
\\useoutertheme[height=0.1\\textwidth,width=0.15\\textwidth,hideothersubsections]{sidebar}
\\usecolortheme{whale}
\\usecolortheme{orchid}
\\useinnertheme[shadow]{rounded}
\\setbeamercolor{sidebar}{bg=blue!50}
%\\setbeamercolor{background canvas}{bg=blue!9}
\\setbeamertemplate{background canvas}[vertical shading][bottom=white,top=structure.fg!25]
\\usefonttheme{serif}
\\setbeamertemplate{navigation symbols}{}
\\usepackage{CJK}
\\usepackage{subfigure}
\\usepackage{xmpmulti}
\\usepackage{colortbl,dcolumn}
\\graphicspath{{figures/}}
\\DeclareGraphicsRule{*}{mps}{*}{}
\\linespread{1.3}

\\def\\museincludegraphics{%
  \\begingroup
  \\catcode`\\|=0
  \\catcode`\\\\=12
  \\catcode`\\#=12
  \\includegraphics[width=0.50\\textwidth]
}

\\begin{document}
\\begin{CJK*}{UTF8}{gbsn}

\\title{<lisp>(muse-publish-escape-specials-in-string
  (muse-publishing-directive \"title\") 'document)</lisp>}
\\author{<lisp>(muse-publishing-directive \"author\")</lisp>}
\\date{<lisp>(muse-publishing-directive \"date\")</lisp>}

\\frame{\\titlepage}

<lisp>(and muse-publish-generate-contents
           \"\\\\frame{\\\\frametitle{目录}\\\\tableofcontents}\")</lisp>\n\n")


;Muse 扩展风格
;发布幻灯片tex：slidescjk
(muse-derive-style "slidescjk" "latexcjk"
:header 'muse-latex-slides-header
:tags 'muse-latex-slides-markup-tags)
;发布幻灯片pdf：slides-pdfcjk，pdflatex时可用
(muse-derive-style "slides-pdfcjk" "pdfcjk"
:header 'muse-latex-slides-header
:tags 'muse-latex-slides-markup-tags)


;CEDET setup
(add-to-list 'load-path "~/.emacs.d/plugins/cedet-1.1/common")
(require 'cedet)
(require 'semantic-ia)
;(semantic-load-enable-minimum-features)
(semantic-load-enable-code-helpers)
;(semantic-load-enable-guady-code-helpers)
;(semantic-load-enable-excessive-code-helpers)
;(semantic-load-enable-semantic-debugging-helpers)

(global-semantic-stickyfunc-mode 1);display func name on the top
(global-semantic-highlight-func-mode 1);highlight func name
;(global-semantic-idle-tag-highlight-mode 1)
(global-semantic-decoration-mode 1);a line above func name
(global-semantic-highlight-edits-mode 1);highlight recent changes

(setq semantic-idle-scheduler-idle-time 432000);use too much CPU?
;(semantic-idle-scheduler-mode 1);
 
(eval-after-load "semantic-c"
'(dolist (d (list
"/usr/local/include"
"/usr/include"
"/usr/include/mpi"))
(semantic-add-system-include d)))

(eval-after-load "semantic-complete"
'(setq semantic-complete-inline-analyzer-displayor-class
semantic-displayor-ghost))

;dot
(load "graphviz-dot-mode.el" nil t t)
(put 'upcase-region 'disabled nil)

;linum-mode
(global-linum-mode 1);always show line numbers
(line-number-mode -1);turn off line# in status bar
(which-func-mode 1);display func name in status bar

;keyset
(global-set-key "\r" 'newline-and-indent)
(global-set-key [(f9)] 'compile)
(global-set-key [(f5)] 'speedbar)
(global-set-key [(C-tab)] 'semantic-ia-complete-symbol-menu)

(global-set-key (kbd "C-c -") 'senator-fold-tag)
(global-set-key (kbd "C-c =") 'senator-unfold-tag)


;设置字体字号
(defun qiang-font-existsp (font)
  (if (null (x-list-fonts font))
      nil t))

(defun qiang-make-font-string (font-name font-size)
  (if (and (stringp font-size) 
           (equal ":" (string (elt font-size 0))))
      (format "%s%s" font-name font-size)
    (format "%s %s" font-name font-size)))

(defun qiang-set-font (english-fonts
                       english-font-size
                       chinese-fonts
                       &optional chinese-font-size)
  "english-font-size could be set to \":pixelsize=18\" or a integer.
If set/leave chinese-font-size to nil, it will follow english-font-size"
  (require 'cl)                         ; for find if
  (let ((en-font (qiang-make-font-string
                  (find-if #'qiang-font-existsp english-fonts)
                  english-font-size))
        (zh-font (font-spec :family (find-if #'qiang-font-existsp chinese-fonts)
                            :size chinese-font-size)))
 
    ;; Set the default English font
    ;; 
    ;; The following 2 method cannot make the font settig work in new frames.
    ;; (set-default-font "Consolas:pixelsize=18")
    ;; (add-to-list 'default-frame-alist '(font . "Consolas:pixelsize=18"))
    ;; We have to use set-face-attribute
    (message "Set English Font to %s" en-font)
    (set-face-attribute
     'default nil :font en-font)
 
    ;; Set Chinese font 
    ;; Do not use 'unicode charset, it will cause the english font setting invalid
    (message "Set Chinese Font to %s" zh-font)
    (dolist (charset '(kana han symbol cjk-misc bopomofo))
      (set-fontset-font (frame-parameter nil 'font)
                        charset
                        zh-font)
      )
    )
  )

;; 解决client模式下的字体问题
(add-hook 'after-make-frame-functions
          (lambda (frame)
            (select-frame frame)
            (if (window-system frame)
                    (qiang-set-font
		     '("DejaVu Sans Mono" "Monaco" "Andale Mono" "Menlo" "Consolas" "Courier New" "Monospace") ":pixelsize=18"
		     '("Microsoft Yahei" "文泉驿等宽微米黑" "华文黑体" "黑体" "新宋体" "宋体")
		     )
	      ))
	  )

(if window-system
    (qiang-set-font
     '("DejaVu Sans Mono" "Monaco" "Andale Mono" "Menlo" "Consolas" "Courier New" "Monospace") ":pixelsize=18"
     '("Microsoft Yahei" "文泉驿等宽微米黑" "华文黑体" "黑体" "新宋体" "宋体")
     ))

;;设置字体字号结束
  

;;MELPA, see http://melpa.org
(require 'package) ;; You might already have this line
(add-to-list 'package-archives
	     ;;for melpa-stable
	     ;'("melpa-stable" . "http://stable.melpa.org/packages/") t)
;;for melpa
             '("melpa" . "http://melpa.org/packages/") t)
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize) ;; You might already have this line

;;yasnippet
(add-to-list 'load-path
              "~/.emacs.d/plugins/yasnippet")
(require 'yasnippet)
;(yas/load-directory "~/.emacs.d/plugins/yasnippet/snippets")
(yas/global-mode 1)

;;auto-complete
;(add-to-list 'load-path "~/.emacs.d/plugins")
(require 'auto-complete-config)

;;;###autoload
(defun ac-config-lanhin ()
  (setq ac-sources '(ac-source-yasnippet ac-source-symbols ac-source-abbrev ac-source-dictionary ac-source-words-in-same-mode-buffers))
  (add-hook 'emacs-lisp-mode-hook 'ac-emacs-lisp-mode-setup)
  (add-hook 'c-mode-common-hook 'ac-cc-mode-setup)
  (add-hook 'ruby-mode-hook 'ac-ruby-mode-setup)
  (add-hook 'css-mode-hook 'ac-css-mode-setup)
  (add-hook 'auto-complete-mode-hook 'ac-common-setup)
  (global-auto-complete-mode t))

;(add-to-list 'ac-dictionary-directories "~/.emacs.d/plugins/dict")
;;(ac-config-default)
(ac-config-lanhin)
;;(defadvice ac-common-setup (after give-yasnippet-highest-priority activate)
;;  (setq ac-sources (delq 'ac-source-yasnippet ac-sources))
;;  (add-to-list 'ac-sources 'ac-source-yasnippet))

;;使用增强的popup列表
;(require 'pos-tip)
;(setq ac-quick-help-prefer-pos-tip t)

;;**source complete， 首先需要保证 cscope 已安装并可以正常工作
;;可能需要重启 emacs 才能正常使用绑定的快捷键
(add-to-list 'load-path "~/.emacs.d/plugins/xcscope.el")
(require 'xcscope)
(cscope-setup)
;;(setq cscope-set-initial-directory "~/kernel/linux-3.2.0")

(define-key global-map (kbd "C-c s s") 'cscope-find-this-symbol)
(define-key global-map (kbd "C-c s d") 'cscope-find-global-definition)
(define-key global-map (kbd "C-c s =") 'cscope-find-assignments-to-this-symbol)
(define-key global-map (kbd "C-c s c") 'cscope-find-functions-calling-this-function)
(define-key global-map (kbd "C-c s C") 'cscope-find-called-functions)
(define-key global-map (kbd "C-c s i") 'cscope-find-files-including-file)
(define-key global-map (kbd "C-c s f") 'cscope-find-this-file)

;;append /usr/local/bin in exec-path under OSX
;;so that we can use "cscope"
(setq exec-path (append '("/usr/local/bin") exec-path))

;; org mode
;; The following lines are always needed. Choose your own keys.
;(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
;(add-hook 'org-mode-hook 'turn-on-font-lock) ; not needed when global-font-lock-mode is on
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-cb" 'org-iswitchb)

;; pig-mode
(require 'pig-mode)
