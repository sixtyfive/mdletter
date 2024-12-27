all:
	@for md in *.md; do \
		if [[ $$md == 'README.md' ]]; then break; fi; \
		name=`echo $$md | cut -d '.' -f 1`; \
		css1="templates/$$name/screen.css"; \
		css2="templates/$$name/mobile.css"; \
		css3="templates/$$name/print.css"; \
		layout="templates/$$name/layout.html"; \
		echo -e "\e[1;34m$$md => $$name.html\e[0m"; \
		pandoc "$$md" -o "$$name.html" --standalone --css "$$css1" --css "$$css2" --css "$$css3" --template "$$layout"; \
		echo "$$md => $$name.pdf"; \
		google-chrome-stable --headless --disable-gpu --no-pdf-header-footer --no-margins --print-to-pdf="$$name.pdf" "$$name.html"; \
	done

clean:
	rm -f *.{pdf,html,log}
