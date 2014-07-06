default: all

.PHONY: clean

all: cat testfoo

cat: cat.hs
	ghc $@

testfoo: testfoo.hs foo.hs
	ghc testfoo.hs

deps_testfoo:
	cabal install hspec

clean:
	rm testfoo cat *.hi *.o
