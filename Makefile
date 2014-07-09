default: all

.PHONY: clean

all: cat copy getpage proxy testfoo

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

deps_testfoo:
	cabal install hspec

clean:
	rm cat copy getpage proxy testfoo *.hi *.o
