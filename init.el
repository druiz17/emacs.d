(package-initialize)

(setq load-prefer-newer t)
(defvar elpa-https nil)
(defvar emacs-insecure t)
(load-file (concat (file-name-directory load-file-name) "my-layers.el"))
(load-file (concat (file-name-directory load-file-name)
                   "lisp/libraries/load-paths.el"))

(require 'benchmark-init-loaddefs)
(require 'utils)
(require 'configure)
(benchmark-init/activate)
(configure/initialize)
(configure/archive-packages)
(configure/load-layers my-layers)
(when (system-is-windows)
  (require 'fakecygpty)
  (fakecygpty-activate)
  (setq default-directory "C:Users/Dante/")
  (load-file "~/.emacs.d/themes/solarized-definitions.el"))
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file 'noerror)
(load-theme 'solarized t)
