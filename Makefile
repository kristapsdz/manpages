.SUFFIXES: .html .sgml .xml .xhtml

SOURCE	= book.css \
	  book.ncx \
	  book.opf \
	  container.xml \
	  css/book.css \
	  external.png \
	  full-head.xml \
	  full-tail.xml \
	  glossary.xml \
	  index.sgml \
	  index.css \
	  license.png \
	  Makefile \
	  preface.xml \
	  part1.xml \
	  part1-1.xml \
	  part1-1-1.xml \
	  part1-1-2.xml \
	  part1-1-3.xml \
	  part1-2.xml \
	  part1-2-1.xml \
	  part1-2-2.xml \
	  part1-3.xml \
	  part1-3-1.xml \
	  part1-4.xml \
	  part2.xml \
	  part2-1.xml \
	  part2-1-1.xml \
	  part2-1-2.xml \
	  part2-1-3.xml \
	  part2-1-4.xml \
	  part2-1-5.xml \
	  part2-2.xml \
	  part2-2-1.xml \
	  part2-2-2.xml \
	  part2-3.xml \
	  part2-3-1.xml

XHTMLS	= preface.xhtml \
	  part1.xhtml \
	  part1-1.xhtml \
	  part1-1-1.xhtml \
	  part1-1-2.xhtml \
	  part1-1-3.xhtml \
	  part1-2.xhtml \
	  part1-2-1.xhtml \
	  part1-2-2.xhtml \
	  part1-3.xhtml \
	  part1-3-1.xhtml \
	  part1-4.xhtml \
	  part2.xhtml \
	  part2-1.xhtml \
	  part2-1-1.xhtml \
	  part2-1-2.xhtml \
	  part2-1-3.xhtml \
	  part2-1-4.xhtml \
	  part2-1-5.xhtml \
	  part2-2.xhtml \
	  part2-2-1.xhtml \
	  part2-2-2.xhtml \
	  part2-3.xhtml \
	  part2-3-1.xhtml \
	  glossary.xhtml

VERSION	= 0.0.10
DATE	= 24 August 2011

all: $(XHTMLS) mdoc.epub index.html mdoc.source.tgz mdoc.single-xhtml.tgz mdoc.multi-xhtml.tgz mdoc.xhtml

install: all
	mkdir -p $(PREFIX)
	mkdir -p $(PREFIX)/css
	install -m 0644 license.png external.png $(PREFIX)
	install -m 0644 index.html index.css $(PREFIX)
	install -m 0644 $(XHTMLS) $(PREFIX)
	install -m 0644 css/book.css $(PREFIX)/css
	install -m 0644 mdoc.epub mdoc.xhtml mdoc.source.tgz $(PREFIX)
	install -m 0644 mdoc.single-xhtml.tgz mdoc.multi-xhtml.tgz $(PREFIX)

clean:
	rm -f index.html 
	rm -f $(XHTMLS) 
	rm -f mdoc.epub mdoc.xhtml mdoc.xhtml.part
	rm -f mdoc.source.tgz 
	rm -f mdoc.single-xhtml.tgz mdoc.multi-xhtml.tgz

mdoc.source.tgz: $(SOURCE)
	mkdir .dist
	mkdir .dist/mdoc
	tar cf - $(SOURCE) | tar -xf - -C .dist/mdoc
	(cd .dist && tar zcf ../$@ mdoc)
	rm -rf .dist

mdoc.multi-xhtml.tgz: $(XHTMLS) css/book.css
	mkdir .xhtml-multi
	mkdir .xhtml-multi/mdoc
	mkdir .xhtml-multi/mdoc/css
	install -m 0644 $(XHTMLS) .xhtml-multi/mdoc
	install -m 0644 css/book.css .xhtml-multi/mdoc/css
	(cd .xhtml-multi && tar zcf ../$@ mdoc)
	rm -rf .xhtml-multi

mdoc.single-xhtml.tgz: mdoc.xhtml css/book.css
	mkdir .xhtml-single
	mkdir .xhtml-single/mdoc
	mkdir .xhtml-single/mdoc/css
	install -m 0644 mdoc.xhtml .xhtml-single/mdoc
	install -m 0644 css/book.css .xhtml-single/mdoc/css
	(cd .xhtml-single && tar zcf ../$@ mdoc)
	rm -rf .xhtml-single

mdoc.xhtml: $(XHTMLS) full-head.xml full-tail.xml
	rm -f $@.part
	for f in $(XHTMLS); do \
		sed -n '/<body>/,/<\/body>/p' $$f >>$@.part ; \
	done
	cat full-head.xml >$@
	sed 's!<body>!<div class="page">!' $@.part | \
		sed 's!<\/body>!</div>!' | \
		sed 's!href=\".*\.xhtml#!href="#!g' >>$@
	cat full-tail.xml >>$@
	rm -f $@.part

mdoc.epub: $(XHTMLS) book.css book.ncx book.opf
	mkdir .book
	mkdir .book/META-INF
	mkdir .book/OPS
	mkdir .book/OPS/css
	echo "application/epub+zip" > .book/mimetype
	install -m 0644 container.xml .book/META-INF
	install -m 0644 $(XHTMLS) .book/OPS
	install -m 0644 book.opf book.ncx .book/OPS
	install -m 0644 book.css .book/OPS/css
	(cd .book && zip -q -X ../$@ \
		mimetype \
		META-INF/container.xml \
		OPS/glossary.xhtml \
		OPS/preface.xhtml \
		OPS/part1.xhtml \
		OPS/part1-1.xhtml \
		OPS/part1-1-1.xhtml \
		OPS/part1-1-2.xhtml \
		OPS/part1-1-3.xhtml \
		OPS/part1-2.xhtml \
		OPS/part1-2-1.xhtml \
		OPS/part1-2-2.xhtml \
		OPS/part1-3.xhtml \
		OPS/part1-3-1.xhtml \
		OPS/part1-4.xhtml \
		OPS/part2.xhtml \
		OPS/part2-1.xhtml \
		OPS/part2-1-1.xhtml \
		OPS/part2-1-2.xhtml \
		OPS/part2-1-3.xhtml \
		OPS/part2-1-4.xhtml \
		OPS/part2-1-5.xhtml \
		OPS/part2-2.xhtml \
		OPS/part2-2-1.xhtml \
		OPS/part2-2-2.xhtml \
		OPS/part2-3.xhtml \
		OPS/part2-3-1.xhtml \
		OPS/book.opf \
		OPS/book.ncx \
		OPS/css/book.css )
	rm -rf .book

.sgml.html:
	validate --warn $<
	sed -e "s!@VERSION@!$(VERSION)!g" -e "s!@DATE@!$(DATE)!g" $< >$@

.xml.xhtml:
	validate --xml --warn $<
	sed -e "s!@VERSION@!$(VERSION)!g" -e "s!@DATE@!$(DATE)!g" $< >$@
