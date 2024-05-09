# EXA Mode for Emacs

EXA Mode is an Emacs mode for syntax highlighting of EXA instructions, a fictional programming language from the videogame EXAPUNKS by Zachtronics.

## Installation

1. Download the `exa-mode.el` file and save it in a directory of your choice.
2. Add the following lines to your Emacs configuration file (e.g., `~/.emacs` or `~/.emacs.d/init.el`):

```lisp
(add-to-list 'load-path "/path/to/directory/containing/exa-mode/")
(require 'exa-mode)
```

Replace `/path/to/directory/containing/exa-mode/` with the actual path to the directory where you saved the `exa-mode.el` file.

3. Restart Emacs or evaluate the new configuration (e.g., `M-x eval-buffer` in the configuration file buffer).

## Usage

EXA Mode is automatically enabled for files with the `.exa` or `.exapunks` extension. You can also manually enable it by running `M-x exa-mode` in any buffer.
