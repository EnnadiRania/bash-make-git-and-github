.DEFAULT_GOAL := all

.PHONY: all clean

all: README.md

README.md: guessinggame.sh makefile
	{ printf '# Bash, Make, Git, and GitHub\n\n'; printf '%s' '- Date and time when make was run: '; date '+%Y-%m-%d %H:%M:%S'; printf '%s' '- Lines in guessinggame.sh: '; awk 'END { print NR }' guessinggame.sh; } > README.md

clean:
	rm -f README.md
