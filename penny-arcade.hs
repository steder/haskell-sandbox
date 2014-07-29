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
import Data.Time
import Data.Time.Format
-- import Data.Maybe -- necessary for isJust
import Network.HTTP
import System.Locale
import Text.Printf
-- import Text.Regex
import Text.HTML.TagSoup


-- let initial_date = fromGregorian 1998 11 18
-- addDays 10 (fromGregorian 1998 11 18)
getDays :: Day -> [Day]
getDays initial_date =
  map (\x -> addDays x initial_date) [0,1..]


makePennyArcadeURL :: Integer -> Int -> Int -> String
makePennyArcadeURL year month day = printf "http://penny-arcade.com/comic/%s/%s/%s" (show year) (show month) (show day)


myFilter tag = isPrefixOf "http://art.penny-arcade" $ fromAttrib "src" tag


giveUp url = do
  return $ "I couldn't find a valid PA image on:" ++ url


downloadTag :: Tag [Char] -> IO ( String )
downloadTag tag = do
  putStrLn (show tag)
  let comicURL = (fromAttrib "src" tag)
  putStrLn comicURL
  comicResp <- simpleHTTP (getRequest comicURL)
  code <- getResponseCode comicResp
  putStrLn (show code)
  getResponseBody comicResp


-- getComicJpeg :: String -> IO (Maybe (IO String))
-- getComicJpeg :: String -> IO (Maybe String)
-- getComicJpeg :: String -> IO (String, Bool)
getComicJpeg url = do
  putStrLn url
  resp <- simpleHTTP (getRequest url)
  code <- getResponseCode resp
  body <- getResponseBody resp
  putStrLn (show code)
  let tags = (filter myFilter (filter (isTagOpenName "img") $ (parseTags body)))
  downloadTag (tags !! 0)


paFileName year month day =
  "pa_" ++ (show year) ++ "_" ++ (show month) ++ "_" ++ (show day) ++ ".jpg"


main = do
-- --   -- let url = makePennyArcadeURL 1998 11 18
-- --   -- putStrLn $ "PA URL:"++ url
-- --   -- jpg <- getComicJpeg url
-- --   -- B.writeFile "pa_1998_11_18.jpg" (P.pack jpg)
  let days = take 10 $ getDays (fromGregorian 1998 11 18)
  let (year, month, day) = (toGregorian (days !! 0))
  let url = makePennyArcadeURL year month day
  jpg <- getComicJpeg url
  B.writeFile (paFileName year month day) (P.pack jpg)
