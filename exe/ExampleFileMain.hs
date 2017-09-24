{-# LANGUAGE OverloadedStrings #-}

import Control.Applicative
import Control.Arrow ((***))
import Control.Monad (unless)
import Control.Monad.IO.Class
import Data.Aeson
import Data.ByteString (ByteString)
import Data.HashMap.Strict (HashMap)
import Data.Maybe
import Data.Text (Text)
import Data.Time.LocalTime.TimeZone.Series
import Data.String
import Prelude
import System.Directory
import qualified Data.ByteString.Lazy as LBS
import qualified Data.HashMap.Strict as HashMap
import qualified Data.Text as Text
import qualified Data.Text.Encoding as Text

import Duckling.Core
import Duckling.Data.TimeZone

import Control.Exception
import System.IO.Error (isDoesNotExistError)
import Control.Monad (forM_)
import System.Environment (getArgs)

main :: IO ()
main = do parseFile `catch` handler  

parseFile :: IO ()  
parseFile = do (fileName:_) <- getArgs   
               contents <- readFile fileName
               tzs <- loadTimeZoneSeries "/usr/share/zoneinfo/"
               refTime <- currentReftime tzs "America/Los_Angeles"
               let context = Context {referenceTime = refTime, lang = EN}
               mapM_ (\x -> 
                     putStrLn(Text.unpack(body x) ++ "|" ++ Text.unpack(dim x)))
                     (parse (Text.pack(contents)) context [This Email, This Url, This Ip]
                     )

handler :: IOError -> IO ()  
handler e = return ()
