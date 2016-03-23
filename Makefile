.SUFFIXES: .html .xml .xhtml .opf .dot .png .map

PREFIX	= /var/www/vhosts/manpages.bsd.lv/htdocs
VERSION	= 0.1.4
DATE	= 07 April 2014

HISTORY = history/CC-205.pdf \
	  history/RUNOFF_fap_archive.txt \
	  history/RUNOFF_fap_support.txt \
	  history/RUNOFF_mad_archive.txt \
	  history/canaday_24_10_2011.txt \
	  history/canaday_27_10_2011.txt \
	  history/clarke_28_10_2011.txt \
	  history/compose.s.gz \
	  history/kernighan_23_10_2011.txt \
	  history/kernighan_26_10_2011.txt \
	  history/mcilroy_21_10_2011.txt \
	  history/mcilroy_22_10_2011.txt \
	  history/mcilroy_23_10_2011.txt \
	  history/mcilroy_28_10_2011.txt \
	  history/nelson_24_10_2011.txt \
	  history/nelson_30_10_2011.txt \
	  history/roff69.high.pdf.gz \
	  history/roff69.low.pdf \
	  history/roff71.high.pdf.gz \
	  history/roff71.low.pdf \
	  history/runoff.s.gz \
	  history/runoff69.high.pdf.gz \
	  history/runoff69.low.pdf \
	  history/saltzer_06_11_2011.txt \
	  history/saltzer_22_10_2011.txt \
	  history/saltzer_23_10_2011.txt \
	  history/spencer_22_10_2011.txt \
	  history/spencer_24_10_2011.txt \
	  history/thompson_01_11_2011.txt \
	  history/thompson_23_10_2011.txt \
	  history/vleck_01_11_2011.txt \
	  history/vleck_22_10_2011.txt

SOURCE	= book.css \
	  book.ncx \
	  book.xml \
	  container.xml \
	  css/book.css \
	  css/imageMapResizer.min.js \
	  css/index.css \
	  external.png \
	  full-head.xml \
	  full-tail.xml \
	  glossary.xml \
	  license.png \
	  Makefile \
	  toc.xml \
	  $(XMLS)

XMLS	= preface.xml \
	  part1.xml \
	  part1-1.xml \
	  part1-1-1.xml \
	  part1-1-2.xml \
	  part1-1-3.xml \
	  part1-2.xml \
	  part1-2-1.xml \
	  part1-2-2.xml \
	  part1-2-3.xml \
	  part1-3.xml \
	  part1-3-1.xml \
	  part1-4.xml \
	  part1-4-1.xml \
	  part2.xml \
	  part2-1.xml \
	  part2-1-1.xml \
	  part2-1-2.xml \
	  part2-1-3.xml \
	  part2-1-4.xml \
	  part2-1-5.xml \
	  part2-1-6.xml \
	  part2-2.xml \
	  part2-2-1.xml \
	  part2-2-2.xml \
	  part2-3.xml \
	  part2-3-1.xml \
	  part2-3-2.xml \
	  part3.xml \
	  part3-1.xml \
	  part3-1-1.xml \
	  part3-1-2.xml \
	  part3-2.xml \
	  part3-2-1.xml \
	  part3-2-2.xml \
	  part3-3.xml \
	  part3-3-1.xml \
	  part3-3-2.xml \
	  part3-3-3.xml \
	  part4.xml \
	  glossary.xml \
	  macros.xml \
	  commands.xml

HTMLS	= preface.html \
	  part1.html \
	  part1-1.html \
	  part1-1-1.html \
	  part1-1-2.html \
	  part1-1-3.html \
	  part1-2.html \
	  part1-2-1.html \
	  part1-2-2.html \
	  part1-2-3.html \
	  part1-3.html \
	  part1-3-1.html \
	  part1-4.html \
	  part1-4-1.html \
	  part2.html \
	  part2-1.html \
	  part2-1-1.html \
	  part2-1-2.html \
	  part2-1-3.html \
	  part2-1-4.html \
	  part2-1-5.html \
	  part2-1-6.html \
	  part2-2.html \
	  part2-2-1.html \
	  part2-2-2.html \
	  part2-3.html \
	  part2-3-1.html \
	  part2-3-2.html \
	  part3.html \
	  part3-1.html \
	  part3-1-1.html \
	  part3-1-2.html \
	  part3-2.html \
	  part3-2-1.html \
	  part3-2-2.html \
	  part3-3.html \
	  part3-3-1.html \
	  part3-3-2.html \
	  part3-3-3.html \
	  part4.html \
	  glossary.html \
	  macros.html \
	  commands.html

XHTMLS	= preface.xhtml \
	  part1.xhtml \
	  part1-1.xhtml \
	  part1-1-1.xhtml \
	  part1-1-2.xhtml \
	  part1-1-3.xhtml \
	  part1-2.xhtml \
	  part1-2-1.xhtml \
	  part1-2-2.xhtml \
	  part1-2-3.xhtml \
	  part1-3.xhtml \
	  part1-3-1.xhtml \
	  part1-4.xhtml \
	  part1-4-1.xhtml \
	  part2.xhtml \
	  part2-1.xhtml \
	  part2-1-1.xhtml \
	  part2-1-2.xhtml \
	  part2-1-3.xhtml \
	  part2-1-4.xhtml \
	  part2-1-5.xhtml \
	  part2-1-6.xhtml \
	  part2-2.xhtml \
	  part2-2-1.xhtml \
	  part2-2-2.xhtml \
	  part2-3.xhtml \
	  part2-3-1.xhtml \
	  part2-3-2.xhtml \
	  part3.xhtml \
	  part3-1.xhtml \
	  part3-1-1.xhtml \
	  part3-1-2.xhtml \
	  part3-2.xhtml \
	  part3-2-1.xhtml \
	  part3-2-2.xhtml \
	  part3-3.xhtml \
	  part3-3-1.xhtml \
	  part3-3-2.xhtml \
	  part3-3-3.xhtml \
	  part4.xhtml \
	  glossary.xhtml \
	  macros.xhtml \
	  commands.xhtml

all: index.html history.html

index.html: \
	mdoc.single-html.tgz \
	mdoc.multi-html.tgz \
	mdoc.html \
	mdoc.epub \
	toc.html \
	$(HTMLS) \
	$(XHTMLS)

install: all
	mkdir -p $(PREFIX)
	mkdir -p $(PREFIX)/css
	mkdir -p $(PREFIX)/history
	install -m 0644 license.png external.png $(PREFIX)
	install -m 0644 index.html history.html $(PREFIX)
	install -m 0644 history.png history.map $(PREFIX)
	install -m 0644 toc.html $(PREFIX)
	install -m 0644 $(XHTMLS) $(HTMLS) $(PREFIX)
	install -m 0644 css/book.css css/history.css css/index.css $(PREFIX)/css
	install -m 0644 css/imageMapResizer.min.js $(PREFIX)/css
	install -m 0644 mdoc.epub mdoc.html $(PREFIX)
	install -m 0644 mdoc.single-html.tgz mdoc.multi-html.tgz $(PREFIX)
	install -m 0644 $(HISTORY) $(PREFIX)/history

clean:
	rm -f index.html history.html
	rm -f toc.html 
	rm -f $(XHTMLS) $(HTMLS)
	rm -f mdoc.epub mdoc.html mdoc.xml book.opf
	rm -f mdoc.single-html.tgz mdoc.multi-html.tgz
	rm -f history.png history.map history-long.png history-long.map history-long.dot
	rm -rf .html-multi .html-single .book

mdoc.multi-html.tgz: toc.html $(HTMLS) css/book.css external.png
	mkdir .html-multi
	mkdir .html-multi/mdoc
	mkdir .html-multi/mdoc/css
	install -m 0644 toc.html .html-multi/mdoc
	install -m 0644 $(HTMLS) .html-multi/mdoc
	install -m 0644 external.png .html-multi/mdoc
	install -m 0644 css/book.css .html-multi/mdoc/css
	( cd .html-multi && tar zcf ../$@ mdoc )
	rm -rf .html-multi

mdoc.single-html.tgz: mdoc.html css/book.css external.png
	mkdir .html-single
	mkdir .html-single/mdoc
	mkdir .html-single/mdoc/css
	install -m 0644 mdoc.html .html-single/mdoc
	install -m 0644 external.png .html-single/mdoc
	install -m 0644 css/book.css .html-single/mdoc/css
	(cd .html-single && tar zcf ../$@ mdoc)
	rm -rf .html-single

mdoc.xml: full-head.xml full-tail.xml $(XMLS)
	( cat full-head.xml ; \
	  for f in $(XMLS); do \
		sed -n '/<body>/,/<\/body>/p' $$f | \
		sed -e 's!<body>!<div class="page">!' \
  		    -e 's!<\/body>!</div>!' \
		    -e 's!href=\"[^#]*#!href=\"#!g' ; \
	  done ; \
	  cat full-tail.xml ) >$@

mdoc.epub: $(XHTMLS) book.css book.ncx book.opf external.png
	mkdir .book
	mkdir .book/META-INF
	mkdir .book/OPS
	mkdir .book/OPS/css
	echo "application/epub+zip" > .book/mimetype
	install -m 0644 container.xml .book/META-INF
	install -m 0644 $(XHTMLS) .book/OPS
	install -m 0644 external.png .book/OPS
	install -m 0644 book.opf book.ncx .book/OPS
	install -m 0644 book.css .book/OPS/css
	(cd .book && zip -q -X ../$@ \
		mimetype \
		META-INF/container.xml \
		OPS/external.png \
		OPS/preface.xhtml \
		OPS/part1.xhtml \
		OPS/part1-1.xhtml \
		OPS/part1-1-1.xhtml \
		OPS/part1-1-2.xhtml \
		OPS/part1-1-3.xhtml \
		OPS/part1-2.xhtml \
		OPS/part1-2-1.xhtml \
		OPS/part1-2-2.xhtml \
		OPS/part1-2-3.xhtml \
		OPS/part1-3.xhtml \
		OPS/part1-3-1.xhtml \
		OPS/part1-4.xhtml \
		OPS/part1-4-1.xhtml \
		OPS/part2.xhtml \
		OPS/part2-1.xhtml \
		OPS/part2-1-1.xhtml \
		OPS/part2-1-2.xhtml \
		OPS/part2-1-3.xhtml \
		OPS/part2-1-4.xhtml \
		OPS/part2-1-5.xhtml \
		OPS/part2-1-6.xhtml \
		OPS/part2-2.xhtml \
		OPS/part2-2-1.xhtml \
		OPS/part2-2-2.xhtml \
		OPS/part2-3.xhtml \
		OPS/part2-3-1.xhtml \
		OPS/part2-3-2.xhtml \
		OPS/part3.xhtml \
		OPS/part3-1.xhtml \
		OPS/part3-1-1.xhtml \
		OPS/part3-1-2.xhtml \
		OPS/part3-2.xhtml \
		OPS/part3-2-1.xhtml \
		OPS/part3-2-2.xhtml \
		OPS/part3-3.xhtml \
		OPS/part3-3-1.xhtml \
		OPS/part3-3-2.xhtml \
		OPS/part3-3-3.xhtml \
		OPS/part4.xhtml \
		OPS/glossary.xhtml \
		OPS/macros.xhtml \
		OPS/commands.xhtml \
		OPS/book.opf \
		OPS/book.ncx \
		OPS/css/book.css )
	rm -rf .book

history.html: history.xml history.map history.png history-long.map history-long.png
	( sed -n '/<map id="manpages">/!p;//q' history.xml ; \
	  cat history.map ; \
	  cat history-long.map | sed -e 's!id="!id="long-!' -e 's!name="!name="long-!' ; \
	  sed -e '1,/<map id="manpages">/d' history.xml ; ) >$@

history.map history.png: history.dot

history-long.map history-long.png: history-long.dot

history-long.dot: history.dot
	sed -e 's/rankdir=LR/rankdir=TB/' history.dot >$@

index.html: index.xml
	#validate --warn $<
	sed -e "s!@VERSION@!$(VERSION)!g" -e "s!@DATE@!$(DATE)!g" $< >$@

.xml.opf:
	sed -e "s!@VERSION@!$(VERSION)!g" $< >$@

.xml.xhtml:
	( echo "<?xml version=\"1.0\" encoding=\"UTF-8\"?>" ; \
	  echo "<!DOCTYPE html PUBLIC \
		\"-//W3C//DTD XHTML 1.1//EN\" \
		\"http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd\">" ; \
	  echo "<html xmlns=\"http://www.w3.org/1999/xhtml\" \
	  	xml:lang=\"en\">" ; \
	  tail -n+3 $< ) | \
	sed -e "s!@VERSION@!$(VERSION)!g" \
	    -e "s!@DATE@!$(DATE)!g" \
	    -e "/manpages.bsd.lv\/cgi-bin\/cvsweb/!s/\.xml/\.xhtml/g" \
	    -e "s!text\/xml!application/xhtml+xml!" >$@
	#validate --xml --warn $@ || rm -f $@

.xml.html:
	( echo "<!DOCTYPE html>" ; \
	  tail -n+2 $< ) | \
	sed -e "s!@VERSION@!$(VERSION)!g" \
	    -e "s!@DATE@!$(DATE)!g" \
	    -e "/manpages.bsd.lv\/cgi-bin\/cvsweb/!s/\.xml/\.html/g" \
	    -e "s!text\/xml!text/html!" >$@
	#validate --warn $@ || rm -f $@

.dot.map:
	dot -Tcmapx -o $@ $<

.dot.png:
	dot -Tpng -o $@ $<
