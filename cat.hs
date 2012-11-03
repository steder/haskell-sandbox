import System.Environment
import System.IO
import qualified Data.Map as Map

catFile path = withFile path ReadMode (\handle -> do
                                          contents <- hGetContents handle
                                          putStr contents
                                          putStr "\n")

printArg arg = do
  print arg


main = do
  -- map catFile getArgs
  args <- getArgs
  mapM printArg args
  mapM catFile args