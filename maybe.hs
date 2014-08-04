{- just playing with how maybe works -}

sometimesAnInt :: Int -> Maybe Int
sometimesAnInt x
  | x < 10 = Nothing
  | x >= 10 = Just x


main = do
  let
    -- maybe <default> <default function> <Maybe value>
    x = maybe 0 id (sometimesAnInt 3)
    y = maybe 0 id (sometimesAnInt 17)
  putStrLn $ show x
  putStrLn $ show y
