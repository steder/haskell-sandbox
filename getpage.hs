import Network (connectTo, PortID(..))
import GHC.IO.Handle (hGetContents, hPutStr)

main :: IO ()
main = do
  let port = PortNumber 80
  h <- connectTo "www.google.com" port
  hPutStr h $ "GET /" ++ "\r\n\r\n"
  s <- hGetContents h
  print s
