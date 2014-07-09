import System.Environment (getArgs)

main :: IO ()
main = do
  [from_name, to_name] <- getArgs
  s     <- readFile from_name
  writeFile to_name s
