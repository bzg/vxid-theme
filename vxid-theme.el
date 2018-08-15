;;; vxid-theme.el --- Another theme for GNU Emacs

;; Copyright (C) 2018 Bastien Guerry

;; Author: Maxime Treca <root@vxid.pw>, Bastien Guerry <bzg@gnu.org>
;; Keywords: emacs, theme

;; This file is not part of GNU Emacs.

;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; Thanks to Maxime for the idea to use .Xresources to define Emacs
;; colors and for initial code.

;;; Code:

(deftheme vxid "An emacs theme based on xresource color definitions.")

(defun xresources-theme-color (name)
  "Read the color NAME from the X resources."
  (x-get-resource name ""))

(setq xresources-no-mode-line-background
      (xresources-theme-color "background"))

(setq xresources-no-window-divider
      (xresources-theme-color "background"))

(let ((class '((class color) (min-colors 89)))
      (foreground (xresources-theme-color "foreground"))
      (background (xresources-theme-color "background"))
      (color0 (xresources-theme-color "color0"))
      (color1 (xresources-theme-color "color1"))
      (color2 (xresources-theme-color "color2"))
      (color3 (xresources-theme-color "color3"))
      (color4 (xresources-theme-color "color4"))
      (color5 (xresources-theme-color "color5"))
      (color6 (xresources-theme-color "color6"))
      (color7 (xresources-theme-color "color7"))
      (color8 (xresources-theme-color "color8"))
      ;; Conditional Faces
      (modeln (xresources-theme-color "color8"))
      (dividr (xresources-theme-color "color8")))

  (custom-theme-set-faces
   'vxid
   ;; Standard Faces
   `(default             ((,class (:foreground ,foreground :background ,background))))
   `(highlight           ((,class (:foreground ,color1 :background ,background))))
   `(cursor              ((,class (:foreground ,background :background ,foreground))))
   `(text-cursor         ((,class (:foreground ,background :background ,foreground))))
   `(mc/cursor-face      ((,class (:foreground ,background :background ,foreground))))
   `(region              ((,class (:foreground ,background :background ,color5))))
   `(secondary-selection ((,class (:foreground ,background :background ,color1))))
   `(escape-glyph        ((,class (:foreground ,foreground :background ,background))))
   
   ;; Buttons, Links and Decorations
   `(link         ((,class (:foreground ,color1 :underline t))))
   `(link-visited ((,class (:foreground ,color8 :underline t))))
   `(button       ((,class (:foreground ,color1 :underline t))))
   `(shadow       ((,class (:foreground ,color8))))

   ;; Type faces
   `(font-lock-builtin-face              ((,class (:foreground ,foreground))))
   `(font-lock-comment-face              ((,class (:foreground ,color5 :slant italic))))
   `(font-lock-comment-delimiter-face    ((,class (:foreground ,color5 :slant italic))))
   `(font-lock-constant-face             ((,class (:foreground ,foreground))))
   `(font-lock-doc-face                  ((,class (:foreground ,color5))))
   `(font-lock-function-name-face        ((,class (:foreground "white" :weight bold))))
   `(font-lock-keyword-face              ((,class (:foreground ,foreground))))
   `(font-lock-negation-char-face        ((,class (:foreground ,foreground))))
   `(font-lock-preprocessor-face         ((,class (:foreground ,foreground))))
   `(font-lock-reference-face            ((,class (:foreground ,foreground))))
   `(font-lock-string-face               ((,class (:foreground ,color3))))
   `(font-lock-type-face                 ((,class (:foreground ,foreground))))
   `(font-lock-variable-name-face        ((,class (:foreground "white"))))
   `(font-lock-regexp-grouping-backslash ((,class (:foreground ,foreground))))
   `(font-lock-regexp-grouping-construct ((,class (:foreground ,foreground))))
   `(font-lock-warning-face              ((,class (:foreground ,foreground))))

   `(sh-heredoc                  ((,class (:foreground ,color5))))
   `(sh-quoted-exec              ((,class (:foreground ,foreground))))

   ;; Windows and fringes
   `(border                     ((,class (:foreground ,dividr :background ,background))))
   `(vertical-border            ((,class (:foreground ,dividr :background ,background))))
   `(window-divider             ((,class (:foreground ,dividr :background ,background))))
   `(window-divider-first-pixel ((,class (:foreground ,background :background ,background))))
   `(window-divider-last-pixel  ((,class (:foreground ,background :background ,background))))
   `(fringe                     ((,class (:foreground ,foreground :background ,background))))
   `(tool-bar                   ((,class (:foreground ,foreground :background ,color4))))
   `(scroll-bar                 ((,class (:foreground ,background :background ,background))))

   ;; hl-line
   `(hl-line ((,class (:foreground ,background :background ,color2))))

   ;; Errors - Colors defined here are used by hl-todo
   `(error   ((,class (:foreground ,color1 :weight bold))))
   `(warning ((,class (:foreground ,color6 :weight bold))))
   `(success ((,class (:foreground ,color5 :weight bold))))

   ;; Term, multi-term
   `(term-color-yellow      ((,class (:foreground "white"))))
   `(term-color-blue        ((,class (:foreground ,color1))))
   `(term-color-magenta     ((,class (:foreground ,color1))))
   `(term-color-cyan        ((,class (:foreground ,color1))))
   `(term-color-green       ((,class (:foreground ,color1))))
   `(term-color-red         ((,class (:foreground ,color1))))
   `(term-color-black       ((,class (:foreground ,background))))

   ;; Popups and Helpers
   `(minibuffer-prompt ((,class (:foreground ,foreground))))
   `(header-line       ((,class (:foreground ,foreground :background ,background :weight bold))))
   `(menu              ((,class (:foreground ,foreground :background ,background))))
   `(tooltip           ((,class (:foreground ,background :background ,foreground))))

   ;; Search, Highlighting, Matching
   `(isearch             ((,class (:foreground ,color7 :inverse-video t))))
   `(isearch-fail        ((,class (:foreground ,color7))))
   `(lazy-highlight      ((,class (:foreground ,color2 :inverse-video t))))
   `(match               ((,class (:foreground ,foreground))))
   `(show-paren-match    ((,class (:foreground "white" :background ,background :weight bold))))
   `(show-paren-mismatch ((,class (:foreground ,color7 :background ,background :weight bold :underline t))))

   ;; Mode line
   `(mode-line           ((,class (:foreground ,foreground  :background ,background))))
   `(mode-line-inactive  ((,class (:foreground ,foreground  :background ,background))))

   ;; Line numbering
   `(linum ((,class (:foreground ,color4 :background ,background))))

   ;; Helm
   `(helm-match ((,class (:foreground "white" :weight bold))))
   `(helm-grep-match ((,class (:foreground ,background :background ,color1))))
   `(helm-resume-need-update ((,class (:foreground ,foreground :inverse-video t))))
   `(helm-source-header ((,class (:foreground ,foreground))))
   `(helm-grep-file ((,class (:foreground ,foreground))))
   `(helm-grep-finish ((,class (:foreground ,foreground :weight bold))))
   `(helm-grep-lineno ((,class (:foreground "white"))))
   `(helm-prefarg ((,class (:foreground "white"))))
   `(helm-separator ((,class (:foreground "white"))))
   `(helm-moccur-buffer ((,class (:foreground ,color4))))
   `(helm-header-line-left-margin ((,class (:foreground ,foreground :weight bold))))
   `(helm-selection ((,class (:foreground "white" :background ,color8))))
   `(helm-visible-mark ((,class (:foreground "white" :weight bold))))
   `(helm-candidate-number ((,class (:foreground "white" :weight bold :inverse-video t))))
   `(helm-candidate-number-suspended ((,class (:foreground "white" :inverse-video t))))
   
   ;; Modes

   ;; Diff Mode
   `(diff-added             ((,class (:foreground ,foreground))))
   `(diff-changed           ((,class (:foreground ,foreground))))
   `(diff-context           ((,class (:foreground ,foreground))))
   `(diff-file-header       ((,class (:foreground ,foreground))))
   `(diff-function          ((,class (:foreground ,foreground))))
   `(diff-header            ((,class (:foreground ,foreground :background ,color8))))
   `(diff-hunk-header       ((,class (:foreground ,foreground :background ,color8))))
   `(diff-indicator-added   ((,class (:foreground ,color4))))
   `(diff-indicator-changed ((,class (:foreground ,color4))))
   `(diff-indicator-removed ((,class (:foreground ,color4))))
   `(diff-nonexistent       ((,class (:foreground ,foreground))))
   `(diff-refine-added      ((,class (:foreground ,foreground))))
   `(diff-refine-changed    ((,class (:foreground ,foreground))))
   `(diff-refine-removed    ((,class (:foreground ,foreground))))
   `(diff-removed           ((,class (:foreground ,foreground))))

   ;; Whitespace Mode
   `(trailing-whitespace         ((,class (:foreground ,color4 :background ,color4))))
   `(whitespace-line             ((,class (:foreground ,color4 :background ,background))))
   `(whitespace-big-indent       ((,class (:foreground ,color4 :background ,background))))
   `(whitespace-empty            ((,class (:foreground ,color4 :background ,background))))
   `(whitespace-hspace           ((,class (:foreground ,color4 :background ,background))))
   `(whitespace-indentation      ((,class (:foreground ,color4 :background ,background))))
   `(whitespace-newline          ((,class (:foreground ,color4 :background ,background))))
   `(whitespace-space            ((,class (:foreground ,color4 :background ,background))))
   `(whitespace-space-after-tab  ((,class (:foreground ,color4 :background ,background))))
   `(whitespace-space-before-tab ((,class (:foreground ,color4 :background ,background))))
   `(whitespace-tab              ((,class (:foreground ,color4 :background ,background))))
   `(whitespace-trailing         ((,class (:foreground ,color4 :background ,color4))))

   ;; Outline Mode
   `(outline-1 ((,class (:foreground ,foreground :weight bold))))
   `(outline-2 ((,class (:foreground ,foreground :weight bold))))
   `(outline-3 ((,class (:foreground ,foreground :weight bold))))
   `(outline-4 ((,class (:foreground ,foreground :weight bold))))
   `(outline-5 ((,class (:foreground ,foreground :weight bold))))
   `(outline-6 ((,class (:foreground ,foreground :weight bold))))
   `(outline-7 ((,class (:foreground ,foreground :weight bold))))
   `(outline-8 ((,class (:foreground ,foreground :weight bold))))

   ;; Calendar 
   `(calendar-today          ((,class (:foreground ,color1))))
   `(calendar-month-header   ((,class (:foreground ,color4))))
   `(calendar-weekday-header ((,class (:foreground ,color4))))

   ;; Dired
   `(dired-cursor ((,class (:foreground "white" :background ,color1))))
   `(dired-header ((,class (:foreground ,color4 :background ,color8))))
   `(dired-directory ((,class (:foreground ,color4))))

   ;; Packages

   ;; Rainbow Delimiters
   `(rainbow-delimiters-depth-1-face   ((,class (:foreground ,color7))))
   `(rainbow-delimiters-depth-2-face   ((,class (:foreground ,color5))))
   `(rainbow-delimiters-depth-3-face   ((,class (:foreground ,color7))))
   `(rainbow-delimiters-depth-4-face   ((,class (:foreground ,color5))))
   `(rainbow-delimiters-depth-5-face   ((,class (:foreground ,color7))))
   `(rainbow-delimiters-depth-6-face   ((,class (:foreground ,color5))))
   `(rainbow-delimiters-depth-7-face   ((,class (:foreground ,color7))))
   `(rainbow-delimiters-depth-8-face   ((,class (:foreground ,color5))))
   `(rainbow-delimiters-unmatched-face ((,class (:foreground ,color1 :weight bold))))

   ;; Ivy
   `(ivy-current-match           ((,class (:foreground ,background :background ,foreground))))
   `(ivy-highlight-face          ((,class (:foreground ,foreground :background ,background))))
   `(ivy-minibuffer-match-face-1 ((,class (:foreground ,foreground :background ,background))))
   `(ivy-minibuffer-match-face-2 ((,class (:foreground ,foreground :background ,background))))
   `(ivy-minibuffer-match-face-3 ((,class (:foreground ,foreground :background ,background))))
   `(ivy-minibuffer-match-face-4 ((,class (:foreground ,foreground :background ,background))))
   `(ivy-confirm-face            ((,class (:foreground ,foreground :background ,background))))
   `(ivy-match-required-face     ((,class (:foreground ,foreground :background ,background))))
   `(ivy-remote                  ((,class (:foreground ,foreground :background ,background))))
   `(ivy-virtual                 ((,class (:foreground ,foreground :background ,background))))
   ;; (ivy-cursor :foreground base7 :background base3)
   ;; (ivy-match-required :foreground red)
   ;; (ivy-modified-buffer :foreground yellow)
   ;; (ivy-subdir :foreground base5)

   ;; Magit 

   ;; Magit - Bisecting
   `(magit-bisect-bad  ((,class (:foreground ,color7 :background ,background :weight bold))))
   `(magit-bisect-good ((,class (:foreground ,color1 :background ,background :weight bold))))
   `(magit-bisect-skip ((,class (:foreground ,color4 :background ,background :weight bold))))

   ;; Magit - Blaming
   `(magit-blame-heading ((,class (:foreground ,foreground :background ,color8))))
   `(magit-blame-date    ((,class (:foreground ,foreground :background ,color8))))
   `(magit-blame-name    ((,class (:foreground ,foreground :background ,color8))))
   `(magit-blame-hash    ((,class (:foreground ,foreground :background ,color8))))
   `(magit-blame-summary ((,class (:foreground ,foreground :background ,color8))))

   ;; Magit - Branches
   `(magit-branch-local       ((,class (:foreground ,color1))))
   `(magit-branch-current     ((,class (:foreground ,color1))))
   `(magit-branch-remote      ((,class (:foreground ,color1))))
   `(magit-branch-remote-head ((,class (:foreground ,color1))))

   ;; Magit - Cherry-Picking
   `(magit-cherry-equivalent ((,class (:foreground ,foreground))))
   `(magit-cherry-unmatched  ((,class (:foreground ,color1))))

   ;; Magit - Diffs
   `(magit-diff-added                  ((,class (:foreground ,color1 :background ,background))))
   `(magit-diff-added-highlight        ((,class (:foreground ,color7 :background ,color8))))
   `(magit-diff-base                   ((,class (:foreground ,color4 :background ,background))))
   `(magit-diff-base-highlight         ((,class (:foreground ,foreground :background ,color8))))
   `(magit-diff-conflict-heading       ((,class (:foreground ,color1 :background ,color8))))
   `(magit-diff-context                ((,class (:foreground ,color4 :background ,background))))
   `(magit-diff-context-highlight      ((,class (:foreground ,color4 :background ,color8))))
   `(magit-diff-file-heading           ((,class (:foreground ,foreground :background ,background))))
   `(magit-diff-file-heading-highlight ((,class (:foreground ,foreground :background ,color8))))
   `(magit-diff-file-heading-selection ((,class (:foreground ,foreground :background ,color8))))
   `(magit-diff-hunk-heading           ((,class (:foreground ,color4 :background ,background))))
   `(magit-diff-hunk-heading-highlight ((,class (:foreground ,foreground :background ,color8))))
   `(magit-diff-hunk-heading-selection ((,class (:foreground ,foreground :background ,color8))))
   `(magit-diff-lines-heading          ((,class (:foreground ,foreground :background ,color8))))
   `(magit-diff-lines-boundary         ((,class (:foreground ,foreground :background ,background))))
   `(magit-diff-our                    ((,class (:foreground ,color4 :background ,background))))
   `(magit-diff-our-highlight          ((,class (:foreground ,color4 :background ,background))))
   `(magit-diff-removed                ((,class (:foreground ,color7 :background ,background))))
   `(magit-diff-removed-highlight      ((,class (:foreground ,color1 :background ,color8))))
   `(magit-diffstat-added              ((,class (:foreground ,color1))))
   `(magit-diffstat-removed            ((,class (:foreground ,color7))))

   ;; Magit - Logs
   `(magit-log-author ((,class (:foreground ,color1))))
   `(magit-log-date   ((,class (:foreground ,color7))))
   `(magit-log-graph  ((,class (:foreground ,foreground))))

   ;; Magit - Popups
   `(magit-popup-argument          ((,class (:foreground ,color1))))
   `(magit-popup-key               ((,class (:foreground ,color4))))
   `(magit-popup-heading           ((,class (:foreground ,foreground))))
   `(magit-popup-option-value      ((,class (:foreground ,color4))))
   `(magit-popup-disabled-argument ((,class (:foreground ,color4))))

   ;; Magit - Processes
   `(magit-process-ng ((,class (:foreground ,color7))))
   `(magit-process-ok ((,class (:foreground ,color1))))

   ;; Magit - Reflogs
   `(magit-reflog-amend       ((,class (:foreground ,foreground))))
   `(magit-reflog-checkout    ((,class (:foreground ,foreground))))
   `(magit-reflog-cherry-pick ((,class (:foreground ,color1))))
   `(magit-reflog-commit      ((,class (:foreground ,foreground))))
   `(magit-reflog-merge       ((,class (:foreground ,color1))))
   `(magit-reflog-other       ((,class (:foreground ,foreground))))
   `(magit-reflog-rebase      ((,class (:foreground ,color7))))
   `(magit-reflog-remote      ((,class (:foreground ,color7))))
   `(magit-reflog-reset       ((,class (:foreground ,color1))))
   `(magit-refname            ((,class (:foreground ,foreground))))

   ;; Magit - Sections
   `(magit-section-heading           ((,class (:foreground ,foreground :background ,background))))
   `(magit-section-highlight         ((,class (:foreground ,foreground :background ,color8 :weight bold))))
   `(magit-section-heading-selection ((,class (:foreground ,foreground :background ,background :weight bold))))

   ;; Magit - Sequences
   `(magit-sequence-drop ((,class (:foreground ,color7))))
   `(magit-sequence-head ((,class (:foreground ,color4))))
   `(magit-sequence-part ((,class (:foreground ,color4))))
   `(magit-sequence-stop ((,class (:foreground ,color1))))

   ;; Magit - Signatures
   `(magit-signature-bad       ((,class (:foreground ,color7))))
   `(magit-signature-good      ((,class (:foreground ,color1))))
   `(magit-signature-untrusted ((,class (:foreground ,color4))))

   ;; Magit - Other faces
   `(magit-dimmed  ((,class (:foreground ,color4))))
   `(magit-keyword ((,class (:foreground ,color4))))
   `(magit-hash    ((,class (:foreground ,color4))))
   `(magit-tag     ((,class (:foreground ,color1))))

   ;; Evil Mode
   `(evil-ex-info                   ((,class (:foreground ,foreground))))
   `(evil-ex-search                 ((,class (:foreground ,color1))))
   `(evil-ex-commands               ((,class (:foreground ,foreground))))
   `(evil-ex-substitute-matches     ((,class (:foreground ,color4))))
   `(evil-ex-substitute-replacement ((,class (:foreground ,color1))))
   `(evil-ex-lazy-highlight         ((,class (:foreground ,color1))))

   ;; Neotree
   `(neo-dir-link-face ((,class (:foreground ,foreground))))
   `(neo-file-link-face ((,class (:foreground ,color7))))
   `(neo-banner-face ((,class (:foreground ,color1))))
   `(neo-header-face ((,class (:foreground ,color1))))
   `(neo-root-dir-face ((,class (:foreground ,color1))))

   ;; Company
   `(company-echo                         ((,class (:foreground ,background :background ,foreground))))
   `(company-echo-common                  ((,class (:foreground ,background :background ,color4))))
   `(company-preview                      ((,class (:foreground ,color2 :background ,background))))
   `(company-preview-common               ((,class (:foreground ,color2 :background ,background))))
   `(company-preview-search               ((,class (:foreground ,color2 :background ,background))))
   `(company-scrollbar-bg                 ((,class (:foreground ,color8 :background ,background))))
   `(company-scrollbar-fg                 ((,class (:foreground ,color8 :background ,background))))
   `(company-template-field               ((,class (:foreground ,background :background ,foreground))))
   `(company-tooltip                      ((,class (:foreground ,foreground :background ,color8))))
   `(company-tooltip-selection            ((,class (:foreground ,color8 :background ,color1))))
   `(company-tooltip-annotation           ((,class (:foreground ,foreground :background ,color8))))
   `(company-tooltip-annotation-selection ((,class (:foreground ,color8 :background ,color1))))
   `(company-tooltip-common               ((,class (:underline nil))))
   `(company-tooltip-common-selection     ((,class (:underline nil) )))
   `(company-tooltip-mouse                ((,class (:inherit highlight))))

   ;; Company-quickhelp
   `(tooltip ((,class (:foreground ,foreground :background ,color8))))

   ;; Yasnippet
   `(yas-field-highlight-face ((,class (:foreground ,foreground :background ,background))))

   ;; Dashboard
   `(page-break-lines       ((,class (:foreground ,color8 :background ,background))))
   `(dashboard-heading-face ((,class (:foreground ,foreground :background ,background))))
   `(widget-button          ((,class (:foreground ,color7 :background ,background :bold t))))
   `(widget-inactive        ((,class (:foreground ,color1 :background ,background :bold nil))))
   `(widget-documentation   ((,class (:foreground ,foreground :background ,background :bold nil))))

   ;; Spaceline
   `(spaceline-modified       ((,class (:foreground ,foreground :background ,modeln))))
   `(spaceline-unmodified     ((,class (:foreground ,foreground :background ,modeln))))
   `(spaceline-highlight-face ((,class (:foreground ,foreground :background ,modeln))))
   `(spaceline-highlight      ((,class (:foreground ,foreground :background ,modeln))))
   `(powerline-active1        ((,class (:foreground ,foreground :background ,modeln))))
   `(powerline-active2        ((,class (:foreground ,foreground :background ,modeln))))
   `(powerline-inactive1      ((,class (:foreground ,foreground :background ,modeln))))
   `(powerline-inactive2      ((,class (:foreground ,foreground :background ,modeln))))

   ;; Which-key
   `(which-key-key-face                   ((,class (:foreground ,foreground :background ,background))))
   `(which-key-separator-face             ((,class (:foreground ,color4 :background ,background))))
   `(which-key-note-face                  ((,class (:foreground ,color4 :background ,background))))
   `(which-key-special-key-face           ((,class (:foreground ,foreground :background ,background :weight bold))))
   `(which-key-group-description-face     ((,class (:foreground ,foreground :background ,background))))
   `(which-key-command-description-face   ((,class (:foreground ,foreground :background ,background))))
   `(which-key-local-map-description-face ((,class (:foreground ,foreground :background ,background))))

   ;; Origami
   `(origami-fold-header-face      ((,class (:foreground ,color1 :background ,background :slant italic))))
   `(origami-fold-fringe-face      ((,class (:foreground ,foreground :background ,background))))
   `(origami-fold-replacement-face ((,class (:foreground ,color1 :background ,background :slant italic))))

   ;; Cider
   `(cider-fringe-good-face ((,class (:foreground ,color1 :background ,background))))

   ;; Gnus
   `(gnus-group-news-1 ((,class (:foreground "white" :weight bold))))
   `(gnus-group-news-2 ((,class (:foreground "white" :weight bold))))
   `(gnus-group-news-3 ((,class (:foreground ,foreground :weight bold))))
   `(gnus-group-news-4 ((,class (:foreground ,foreground :weight bold))))
   `(gnus-group-news-5 ((,class (:foreground ,color4 :weight bold))))
   `(gnus-group-news-6 ((,class (:foreground ,color4 :weight bold))))
   `(gnus-group-news-1-empty ((,class (:foreground ,color4))))
   `(gnus-group-news-2-empty ((,class (:foreground ,color4))))
   `(gnus-group-news-3-empty ((,class (:foreground ,color1))))
   `(gnus-group-news-4-empty ((,class (:foreground ,color1))))
   `(gnus-group-news-5-empty ((,class (:foreground ,color8))))
   `(gnus-group-news-6-empty ((,class (:foreground ,color8))))
   `(gnus-group-news-low-empty ((,class (:foreground "#333"))))

   `(gnus-group-mail-1 ((,class (:foreground "white" :weight bold))))
   `(gnus-group-mail-2 ((,class (:foreground "white" :weight bold))))
   `(gnus-group-mail-3 ((,class (:foreground ,foreground :weight bold))))
   `(gnus-group-mail-4 ((,class (:foreground ,foreground :weight bold))))
   `(gnus-group-mail-5 ((,class (:foreground ,color4 :weight bold))))
   `(gnus-group-mail-6 ((,class (:foreground ,color4 :weight bold))))
   `(gnus-group-mail-1-empty ((,class (:foreground ,color4))))
   `(gnus-group-mail-2-empty ((,class (:foreground ,color4))))
   `(gnus-group-mail-3-empty ((,class (:foreground ,color1))))
   `(gnus-group-mail-4-empty ((,class (:foreground ,color1))))
   `(gnus-group-mail-5-empty ((,class (:foreground ,color8))))
   `(gnus-group-mail-6-empty ((,class (:foreground ,color8))))
   `(gnus-group-mail-low-empty ((,class (:foreground "#333"))))

   `(gnus-summary-high-ticked ((,class (:foreground ,color2))))
   `(gnus-summary-normal-ticked ((,class (:foreground ,color2))))
   `(gnus-summary-low-ticked ((,class (:foreground ,color2 :slant italic))))
   `(gnus-summary-high-read ((,class (:foreground ,color6))))
   `(gnus-summary-normal-read ((,class (:foreground ,color6))))
   `(gnus-summary-low-read ((,class (:foreground ,color6 :slant italic))))
   `(gnus-summary-high-ancient ((,class (:foreground ,color8))))
   `(gnus-summary-normal-ancient ((,class (:foreground ,color8))))
   `(gnus-summary-low-ancient ((,class (:foreground ,color8 :slant italic))))
   `(gnus-summary-high-unread ((,class (:foreground "white" :weight bold))))
   `(gnus-summary-normal-unread ((,class (:foreground "white"))))
   `(gnus-summary-low-unread ((,class (:foreground "white" :slant italic))))
   `(gnus-summary-selected ((,class (:foreground ,foreground :background ,color8))))
   `(gnus-summary-cancelled ((,class (:foreground ,foreground :strike-through t))))
   
   `(gnus-button ((,class (:foreground ,color6))))
   `(gnus-server-opened ((,class (:foreground "white" :weight bold))))
   `(gnus-server-closed ((,class (:foreground "white" :weight bold))))
   `(gnus-server-offline ((,class (:foreground "white" :weight bold))))
   
   `(gnus-header-name ((,class (:foreground ,color1))))
   `(gnus-header-from ((,class (:foreground ,color6))))
   `(gnus-header-subject ((,class (:foreground ,foreground :weight bold))))
   `(gnus-header-content ((,class (:foreground ,color6))))
   `(gnus-header-newsgroups ((,class (:foreground "white" :weight bold))))
   `(message-header-to ((,class (:foreground ,foreground))))
   `(message-header-subject ((,class (:foreground ,foreground :weight bold))))
   `(message-header-newsgroups ((,class (:foreground ,foreground :weight bold))))
   `(message-header-xheader ((,class (:foreground ,color1))))
   `(message-header-name ((,class (:foreground ,color1))))
   `(message-header-other ((,class (:foreground ,foreground :weight bold))))
   `(message-header-cc ((,class (:foreground ,color1))))
   `(message-separator ((,class (:foreground ,color4))))

   `(gnus-cite-1 ((,class (:foreground ,color4))))
   `(message-cited-text ((,class (:foreground ,color4))))
   `(gnus-cite-2 ((,class (:foreground ,color5))))
   `(gnus-cite-3 ((,class (:foreground ,color6))))
   `(gnus-cite-4 ((,class (:foreground ,color1))))
   `(gnus-cite-5 ((,class (:foreground ,color2))))

   `(gnus-emphasis-highlight-words ((,class (:foreground "white" :weight bold))))

   `(mm-uu-extract ((,class (:foreground ,foreground :background ,color8))))
   `(message-mml ((,class (:foreground ,foreground :background ,color8))))

   ;; Notmuch
   `(notmuch-search-flagged-face ((,class (:foreground ,foreground :weight bold))))
   `(notmuch-search-unread-face ((,class (:foreground "white"))))
   `(notmuch-tag-face ((,class (:foreground "white" :weight bold))))
   `(notmuch-crypto-signature-unknown ((,class (:foreground ,foreground :inverse-video t))))
   `(notmuch-crypto- ((,class (:foreground ,foreground :inverse-video t))))

   ;; Custom face
   `(custom-face-tag ((,class (:foreground ,foreground))))
   `(custom-state ((,class (:foreground "white"))))

   ;; Org Mode

   ;; Org - Basic Faces
   `(org-code            ((,class (:foreground ,color4))))
   `(org-done            ((,class (:foreground ,color4))))
   `(org-drawer          ((,class (:foreground ,color4))))
   `(org-ellipsis        ((,class (:foreground ,color4))))
   `(org-footnote        ((,class (:foreground ,color4))))
   `(org-formula         ((,class (:foreground ,color4))))
   `(org-hide            ((,class (:foreground ,background :background ,background))))
   `(org-link            ((,class (:foreground ,foreground :underline t))))
   `(org-quote           ((,class (:foreground ,color4 :slant italic))))
   `(org-special-keyword ((,class (:foreground ,color4))))
   `(org-table           ((,class (:foreground ,color4))))
   `(org-time-grid       ((,class (:foreground ,color4))))
   `(org-todo            ((,class (:foreground "white"))))
   `(org-verbatim        ((,class (:foreground ,color4))))
   `(org-verse           ((,class (:foreground ,color4 :slant italic))))
   `(org-warning         ((,class (:foreground ,color1 :weight bold))))

   ;; Org - Headers
   `(org-level-1 ((,class (:foreground "white" :height 1.4))))
   `(org-level-2 ((,class (:foreground ,foreground :height 1.2))))
   `(org-level-3 ((,class (:foreground ,foreground))))
   `(org-level-4 ((,class (:foreground ,foreground))))
   `(org-level-5 ((,class (:foreground ,foreground))))
   `(org-level-6 ((,class (:foreground ,foreground))))
   `(org-level-7 ((,class (:foreground ,foreground))))
   `(org-level-8 ((,class (:foreground ,foreground))))

   ;; Org - Agenda
   `(org-agenda-structure        ((,class (:foreground ,foreground))))
   `(org-agenda-calendar-event   ((,class (:foreground ,foreground))))
   `(org-agenda-calendar-sexp    ((,class (:foreground ,foreground))))
   `(org-agenda-clocking         ((,class (:foreground ,foreground :inverse-video t))))
   `(org-agenda-date             ((,class (:foreground ,color4))))
   `(org-agenda-date-weekend     ((,class (:foreground ,color4))))
   `(org-agenda-date-today       ((,class (:foreground "white"))))
   `(org-agenda-done             ((,class (:foreground ,color4 :strike-through t))))
   `(org-agenda-dimmed-todo-face ((,class (:foreground ,color4))))
   `(org-agenda-restriction-lock ((,class (:foreground ,foreground :background ,color8))))
   
   ;; Org - Blocks, Columns and Checkboxes
   `(org-block                    ((,class (:foreground ,foreground :background ,background))))
   `(org-block-background         ((,class (:foreground ,foreground :background ,background))))
   `(org-block-begin-line         ((,class (:foreground ,color4 :background ,background))))
   `(org-block-end-line           ((,class (:foreground ,color4 :background ,background))))
   `(org-column                   ((,class (:foreground ,foreground :background ,color4))))
   `(org-column-title             ((,class (:foreground ,foreground :background ,color4))))
   `(org-checkbox                 ((,class (:foreground ,color4 :box (:line-width 1 :color ,color4 :style released-button :inverse-video t)))))
   `(org-checkbox-statistics-done ((,class (:foreground ,foreground))))
   `(org-checkbox-statistics-todo ((,class (:foreground ,foreground))))

   ;; Org Clock
   `(org-clock-overlay ((,class (:foreground ,background :background ,color4))))

   ;; Org-calendar views
   `(org-date          ((,class (:foreground ,color4))))
   `(org-sexp-date     ((,class (:foreground ,foreground :background ,background))))
   `(org-date-selected ((,class (:foreground ,background :background ,foreground))))

   ;; Org - Document Faces
   `(org-document-title        ((,class (:foreground "white" :weight bold))))
   `(org-document-info         ((,class (:foreground "white"))))
   `(org-document-info-keyword ((,class (:foreground ,color4 :weight bold))))
   `(org-meta-line             ((,class (:foreground ,color4 :slant italic))))
   

   ;; Org - Deadlines and Schedules
   `(org-upcoming-deadline    ((,class (:foreground ,foreground))))
   `(org-scheduled            ((,class (:foreground ,foreground))))
   `(org-headline-done        ((,class (:foreground ,color4 :strike-through t))))
   `(org-scheduled-previously ((,class (:foreground ,color4 :weight bold))))
   `(org-scheduled-today      ((,class (:foreground ,foreground :weight bold))))

   ;; Diary and calendar
   `(diary ((,class (:foreground "white"))))
   `(google-translate-suggestion-label-face ((,class (:foreground "white"))))
   `(anzu-mode-line ((,class (:foreground "white" :weight bold))))
   `(holiday       ((,class (:foreground ,color2))))
   
   ;; Languages

   ;; LaTeX
   `(TeX-error-description-help     ((,class (:foreground ,foreground :background ,background))))
   `(TeX-error-description-error    ((,class (:foreground ,foreground :background ,background))))
   `(TeX-error-description-warning  ((,class (:foreground ,foreground :background ,background))))
   `(TeX-error-description-tex-said ((,class (:foreground ,foreground :background ,background))))
   `(tex-math                       ((,class (:foreground ,foreground :background ,background))))
   `(tex-verbatim                   ((,class (:foreground ,foreground :background ,background))))
   `(font-latex-math-face           ((,class (:foreground ,foreground :background ,background))))
   `(font-latex-bold-face           ((,class (:foreground ,foreground :background ,background))))
   `(font-latex-sedate-face         ((,class (:foreground ,foreground :background ,background))))
   `(font-latex-italic-face         ((,class (:foreground ,foreground :background ,background))))
   `(font-latex-string-face         ((,class (:foreground ,foreground :background ,background))))
   `(font-latex-warning-face        ((,class (:foreground ,foreground :background ,background))))
   `(font-latex-verbatim-face       ((,class (:foreground ,foreground :background ,background))))
   `(font-latex-subscript-face      ((,class (:foreground ,foreground :background ,background))))
   `(font-latex-superscript-face    ((,class (:foreground ,foreground :background ,background))))
   `(font-latex-sectioning-0-face   ((,class (:foreground ,foreground :background ,background))))
   `(font-latex-sectioning-1-face   ((,class (:foreground ,foreground :background ,background))))
   `(font-latex-sectioning-2-face   ((,class (:foreground ,foreground :background ,background))))
   `(font-latex-sectioning-3-face   ((,class (:foreground ,foreground :background ,background))))
   `(font-latex-sectioning-4-face   ((,class (:foreground ,foreground :background ,background))))
   `(font-latex-sectioning-5-face   ((,class (:foreground ,foreground :background ,background))))

   `(cider-enlightened-face ((,class (:inherit cider-result-overlay-face :box (:line-width -1 :color ,color7)))))
   `(cider-enlightened-local-face ((,class (:foreground "white" :weight bold))))
   `(cider-error-highlight-face ((,class (:inherit nil :underline (:color ,color1 :style wave)))))
   `(cider-instrumented-face ((,class (:box (:line-width 1 :color ,color1 :style released-button)))))
   `(cider-test-error-face ((,class (:inverse-video nil))))
   `(cider-test-failure-face ((,class (:inverse-video t))))
   `(cider-test-success-face ((,class (:foreground "white" :weight bold))))
   `(cider-traced-face ((,class (:box (:line-width -1 :color "white")))))
   `(cider-warning-highlight-face ((,class (:inherit nil :underline (:color "white" :style wave)))))
   `(compilation-mode-line-exit ((,class (:inherit compilation-info :foreground "white" :weight bold))))
   `(compilation-mode-line-fail ((,class (:inherit compilation-error :foreground ,color7 :weight bold))))
   `(custom-button-pressed-unraised ((,class (:inherit custom-button-unraised :foreground ,color2))))
   `(custom-changed ((,class (:background ,color2 :foreground "white"))))
   `(custom-group-tag ((,class (:inherit variable-pitch :weight bold :height 1.2))))
   `(custom-group-tag-1 ((,class (:inherit variable-pitch :weight bold :height 1.2))))
   `(custom-invalid ((,class (:inverse-video t))))
   `(custom-modified ((,class (:inverse-video t))))
   `(custom-rogue ((,class nil)))
   `(custom-set ((,class (:inverse-video t))))
   `(custom-themed ((,class (:inverse-video t))))
   `(custom-variable-obsolete ((,class (:foreground "white"))))
   `(custom-variable-tag ((,class (:foreground "white" :weight bold))))
   `(info-menu-star ((,class (:foreground "white")))))

  ;; Company quickhelp is annoying and define faces through variables

  (setq company-quickhelp-color-background (xresources-theme-color "color8")))
(setq company-quickhelp-color-foreground (xresources-theme-color "foreground"))

;;;### autoload

(when (and (boundp 'custom-theme-load-path) load-file-name)
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))

(provide-theme 'vxid)

;;; vxid-theme.el ends here
