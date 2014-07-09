default: all

.PHONY: clean

all: cat copy getpage proxy testfoo web

cat: cat.hs
	ghc $@

copy: copy.hs
	ghc $@

getpage: getpage.hs
	ghc $@

proxy: proxy.hs
	ghc $@

testfoo: testfoo.hs foo.hs
	ghc testfoo.hs

web: web.hs
	ghc web.hs

deps_testfoo:
	cabal install hspec

deps_web:
	cabal install Spock

clean:
	rm cat copy getpage proxy testfoo *.hi *.o
