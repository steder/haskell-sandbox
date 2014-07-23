import qualified Data.Map as Map

import Text.JSON

main = do
  let myMap = Map.insert "hello" "world" Map.empty
  print myMap
  let js = encode myMap
  print js
  let roundTrip = decode js :: Result (Map.Map String String)
  print roundTrip
