import System.Environment
import System.IO
import qualified Data.Map as Map

catFile path = withFile path ReadMode (\handle -> do
                                          putStrLn $ "::" ++ path
                                          contents <- hGetContents handle
                                          putStr contents
                                          putStr "\n")

main = do
  args <- getArgs
  mapM catFile args
  putStrLn ""
