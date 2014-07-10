
{-

Problem 1: Multiples of 3 and 5

If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.

Find the sum of all the multiples of 3 or 5 below 1000.

-}

import Data.List (union)

fibonacci 1 = 1
fibonacci 2 = 2
fibonacci n = fibonacci (n - 1) + fibonacci (n - 2)

problem1 :: Integer
problem1 =
  sum (union [3,6..999] [5,10..999])

problem2 =
  sum $ filter (even) $ takeWhile (\x -> x <= 4000000) $ map fibonacci [1,2..]

main :: IO ()
main = do
  putStrLn $ "answer1: " ++ (show problem1)
  putStrLn $ "answer2: " ++ (show problem2)
