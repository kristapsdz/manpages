.SUFFIXES: .html .sgml .xml .xhtml

HTMLS	= index.html
XHTMLS	= preface.xhtml part1.xhtml part1-1.xhtml part1-1-1.xhtml

all: $(HTMLS) $(XHTMLS)

clean:
	rm -f $(HTMLS) $(XHTMLS) book.epub

book.epub: $(XHTMLS) book.css book.ncx book.opf
	mkdir .book
	mkdir -p .book/META-INF
	mkdir -p .book/OPS
	mkdir -p .book/OPS/css
	echo "application/epub+zip" > .book/mimetype
	install -m 0444 container.xml .book/META-INF
	install -m 0444 $(XHTMLS) .book/OPS
	install -m 0444 book.opf book.ncx .book/OPS
	install -m 0444 book.css .book/OPS/css
	(cd .book && zip -X ../$@ \
		mimetype \
		META-INF/container.xml \
		OPS/preface.xhtml \
		OPS/part1.xhtml \
		OPS/part1-1.xhtml \
		OPS/part1-1-1.xhtml \
		OPS/book.opf \
		OPS/book.ncx \
		OPS/css/book.css )
	rm -rf .book

.sgml.html:
	validate --warn $<
	cp -f $< $@

.xml.xhtml:
	cp -f $< $@
