.SUFFIXES: .html .sgml .xml .xhtml

SOURCE	= book.css \
	  book.ncx \
	  book.opf \
	  container.xml \
	  css/book.css \
	  external.png \
	  index.sgml \
	  index.css \
	  license.png \
	  Makefile \
	  preface.xml \
	  part1.xml \
	  part1-1.xml \
	  part1-1-1.xml \
	  part1-1-2.xml \
	  part1-2.xml \
	  part1-2-1.xml \
	  part1-2-2.xml \
	  part1-3.xml \
	  part1-4.xml

XHTMLS	= preface.xhtml \
	  part1.xhtml \
	  part1-1.xhtml \
	  part1-1-1.xhtml \
	  part1-1-2.xhtml \
	  part1-2.xhtml \
	  part1-2-1.xhtml \
	  part1-2-2.xhtml \
	  part1-3.xhtml \
	  part1-4.xhtml

VERSION	= 1.1.3
DATE	= 16 August 2011

all: $(XHTMLS) mdoc.epub index.html mdoc.source.tgz

install: all
	mkdir -p $(PREFIX)
	mkdir -p $(PREFIX)/css
	install -m 0644 license.png external.png $(PREFIX)
	install -m 0644 index.html index.css $(PREFIX)
	install -m 0644 $(XHTMLS) $(PREFIX)
	install -m 0644 css/book.css $(PREFIX)/css
	install -m 0644 mdoc.epub $(PREFIX)

clean:
	rm -f index.html $(XHTMLS) mdoc.epub mdoc.source.tgz

mdoc.source.tgz:
	mkdir .dist
	mkdir .dist/mdoc
	tar cf - $(SOURCE) | tar -xf - -C .dist/mdoc
	(cd .dist && tar zvcf ../$@ mdoc)
	rm -rf .dist

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
	(cd .book && zip -X ../$@ \
		mimetype \
		META-INF/container.xml \
		OPS/preface.xhtml \
		OPS/part1.xhtml \
		OPS/part1-1.xhtml \
		OPS/part1-1-1.xhtml \
		OPS/part1-1-2.xhtml \
		OPS/part1-2.xhtml \
		OPS/part1-2-1.xhtml \
		OPS/part1-2-2.xhtml \
		OPS/part1-3.xhtml \
		OPS/part1-4.xhtml \
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
