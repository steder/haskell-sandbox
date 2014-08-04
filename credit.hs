import Data.ByteString.Char8 (pack)
import Data.Digest.OpenSSL.MD5 (md5sum) -- cabal install nano-md5

import Text.Printf (printf)

check_cc_number first4 last4 cc_hash middle8 = let candidate = (first4 ++ middle8 ++ last4) in
      if md5sum(pack(candidate)) == cc_hash then
        "Found it:" ++ candidate
        else
        ""

pad_it :: Int -> String
pad_it x = printf "%08d" x


middle_numbers = map pad_it [0,1..100000000]


not_empty :: String -> Bool
not_empty "" = False
not_empty _  = True


find_cc_number first4 last4 cc_hash = let check_it = check_cc_number first4 last4 cc_hash in
  filter not_empty (map check_it $ middle_numbers)


main = do
  putStrLn "Searching for CC number based on "
  let first4 = "4111"
      last4  = "1111"
      cc_hash = "d41d8cd98f00b204e9800998ecf8427e"
  -- putStrLn $ check_cc_number first4 last4 cc_hash middle8
  putStrLn $ find_cc_number first4 last4 cc_hash !! 0
