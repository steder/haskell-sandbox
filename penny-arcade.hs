{-

Penny Arcade Comics live under URLs like this:

    http://penny-arcade.com/comic/2014/07/23/

The comic HTML is:

    <div id="comicFrame">
      <a href="http://penny-arcade.com/comic/1998/11/25/john-romero-artiste" title="Next">
        <img src="http://art.penny-arcade.com/photos/214584757_tSa5c-L-2.jpg" alt="The SIN Of Long Load Times">
      </a>
    </div>

The first PA comic is:

    http://penny-arcade.com/comic/1998/11/25/john-romero-artiste

-}


import qualified Data.ByteString as B
import qualified Data.ByteString.Char8 as P
import Data.List
-- import Data.Maybe -- necessary for isJust
import Network.HTTP
import Text.Printf
-- import Text.Regex
import Text.HTML.TagSoup


makePennyArcadeURL :: Int -> Int -> Int -> String
makePennyArcadeURL year month day = printf "http://penny-arcade.com/comic/%s/%s/%s" (show year) (show month) (show day)


myFilter tag = isPrefixOf "http://art.penny-arcade" $ fromAttrib "src" tag


getComicJpeg url = do
  putStrLn url
  resp <- simpleHTTP (getRequest url)
  code <- getResponseCode resp
  body <- getResponseBody resp
  putStrLn (show code)
  -- TODO: combine into a single filter
  let tags = (filter myFilter (filter (isTagOpenName "img") $ (parseTags body)))
  putStrLn (show tags)
  let comicURL = (fromAttrib "src" (tags !! 0))
  putStrLn comicURL
  comicResp <- simpleHTTP (getRequest comicURL)
  code <- getResponseCode comicResp
  putStrLn (show code)
  getResponseBody comicResp


main = do
  let url = makePennyArcadeURL 1998 11 18
  putStrLn $ "PA URL:"++ url
  jpg <- getComicJpeg url
  B.writeFile "pa_1998_11_18.jpg" (P.pack jpg)
