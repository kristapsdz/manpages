.SUFFIXES:	.html .sgml

PREFIX		 = /usr/local
INSTALL		 = install
INSTALL_PROGRAM	 = $(INSTALL) -m 0755
INSTALL_DATA	 = $(INSTALL) -m 0444
INSTALL_LIB	 = $(INSTALL) -m 0644
INSTALL_MAN	 = $(INSTALL_DATA)
SGMLS	   	 = index.sgml
HTMLS	   	 = index.html
STATICS		 = index.css

all:	$(HTMLS)

installwww: www
	$(INSTALL_DATA) $(HTMLS) $(STATICS) $(DESTDIR)$(PREFIX)/

clean:
	rm -f $(HTMLS)

.sgml.html:
	validate --warn $<
	cp -f $< $@
