{-

web.hs:

This is a simple http server written using spock.

Install `Spock` with:

    cabal install Spock

-}
{-# LANGUAGE OverloadedStrings #-}
import Web.Spock

import qualified Data.Text as T

main :: IO ()
main =
    spockT 3000 id $
    do get "/echo/:something" $
        do Just something <- param "something"
           text $ T.concat ["Echo: ", something]
