all:
	@for md in *.md; do \
		if [[ $$md == 'README.md' ]]; then break; fi; \
		echo -n "$$md => "; \
		html=`echo $$md | sed s/\.md/.html/`; \
		css=`echo $$md | sed s/\.md/.css/`; \
		tpl=`echo $$md | sed s/\.md/.template.html/`; \
		pdf=`echo $$md | sed s/\.md/.pdf/`; \
		pandoc $$md -o $$html --css templates/$$css --template templates/$$tpl --standalone; \
		echo -n "$$html "; \
		google-chrome-stable --headless --print-to-pdf-no-header --no-margins --print-to-pdf=$$pdf $$html >/dev/null 2>&1; \
		echo "$$pdf"; \
	done
