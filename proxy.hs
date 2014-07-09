import Network (accept, connectTo, listenOn, PortID(..))
import Network.Socket (HostName)
import GHC.IO.Handle (hGetContents, hPutStr)

getPage :: Network.Socket.HostName -> PortID -> IO String
getPage host port = do
  h <- connectTo host port
  hPutStr h $ "GET /" ++ "\r\n\r\n"
  s <- hGetContents h
  print s
  return s

main :: IO ()
main = do
  sock <- listenOn $ PortNumber 8080
  handleConnections sock where
    handleConnections sock = do
      (handle, _, _) <- accept sock
      contents <- getPage "www.google.com" $ PortNumber 80
      hPutStr handle contents
