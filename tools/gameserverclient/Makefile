C2T = c2t

all:	gameserverclient.text

gameserverclient.text:	Makefile
	( \
	figlet -c -w 40 -f slant "Apple ][ Game Server Online!" | \
	perl -p -e 's/^ +\n$$//' | \
	sed '1,6s/^/ /'; \
	echo; \
	text="THE APPLE ][ AE WARESHOLE IS BACK!"; printf "%*s\n" $$((($${#text}+40)/2)) "$$text"; \
	text="CASSETTE PORT FTW! ---- ASCIIEXPRESS.NET"; printf "%*s\n" $$((($${#text}+40)/2)) "$$text"; \
	) | tail -24 >$@



gameserverclient.mon:	gameserverclient
	$(C2T) gameserverclient,800 gameserverclient.mon

clean:
	rm -f 	gameserverclient.text
