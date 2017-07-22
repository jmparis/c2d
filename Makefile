
c2d.h: c2d.h.0 asm/loader.s asm/bar.s makeheader
	./makeheader


clean:
	rm -f bin/* *.dsk c2d.h c2d.h.1
	(cd asm; make clean)

barloader.text: Makefile
	( \
	echo; \
	figlet -c -w 40 -f poison "c2d"; \
	echo; \
	text="C2D (CODE TO DISK) BUILT-IN LOADER"; printf "%*s\n" $$((($${#text}+40)/2)) "$$text"; \
	echo; \
	text="LOADING GAME SERVER CLIENT ..."; printf "%*s\n" $$((($${#text}+40)/2)) "$$text"; \
	echo; \
	text="________________________________________"; printf "%*s\n" $$((($${#text}+40)/2)) "$$text"; \
	text="________________________________________"; printf "%*s\n" $$((($${#text}+40)/2)) "$$text"; \
	echo; \
	echo; \
	text="HTTP://GITHUB.COM/DATAJERK/C2D"; printf "%*s\n" $$((($${#text}+40)/2)) "$$text"; \
	) | tail -24 >$@

barloader.textpage: barloader.text bin/text2page
	bin/text2page <$< >$@

bargrloader.textpage: bin/mandelbrotgr
	bin/mandelbrotgr >$@


gameserverclientbar.dsk: barloader.textpage gameserverclient bin/c2d Makefile
	bin/c2d -b -t $< gameserverclient,800 $@

gameserverclientbargr.dsk: bargrloader.textpage gameserverclient bin/c2d Makefile
	bin/c2d -b -g -r 23 -t $< gameserverclient,800 $@

gameserverclient.dsk: gameserverclient bin/c2d Makefile
	bin/c2d gameserverclient,800 $@

dsk: gameserverclient.dsk gameserverclientbar.dsk gameserverclientbargr.dsk


fulltest: gameserverclient gameserverclient.mon gameserverclient.text gameserverclient.tiff gameserverclientsplash.tiff test.sh test.scrp dist
	EMU=1 WIN=1 ./test.sh

disttest: gameserverclient gameserverclient.mon gameserverclient.text test.sh dist
	EMU=0 WIN=1 ./test.sh

test: gameserverclient gameserverclient.mon gameserverclient.text test.sh all
	EMU=0 WIN=0 ./test.sh

