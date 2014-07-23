{-# LANGUAGE DeriveDataTypeable #-}

import Data.Data
import Data.Typeable

import Text.JSON.Generic


data Person = Person {
  name :: String,
  age :: Integer,
  cats :: Integer
  } deriving (Show, Data, Typeable)


main = do
  let me = Person "Mike" 73 42
  print me
  let json = encodeJSON me
  print json
  let roundtrip = decodeJSON json :: Person
  print roundtrip
