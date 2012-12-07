module Foo where

absolute :: Int -> Int
absolute n = if n < 0 then -1 * n else n
