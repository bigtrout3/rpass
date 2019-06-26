module Main where

import Lib

import System.Random
import System.Console.GetOpt
import System.Environment
import Data.List (intercalate)
import Data.Maybe (fromMaybe)

data Flag = Count Int | Dict String | Sep String
  deriving Show

opts :: [OptDescr Flag]
opts =
 [ Option ['c'] ["count"] (OptArg count "NUM") "Produce NUM words in password."
 , Option ['d'] ["dictionary"] (OptArg dict "DICT") "Load words from DICTIONARY."
 , Option ['s'] ["separator"] (OptArg sep "SEP") "Join words with SEPARATOR."
 ]

count :: Maybe String -> Flag
count = Count . read . fromMaybe "3"

dict, sep :: Maybe String -> Flag
dict = Dict . fromMaybe "dictionary.txt"
sep = Sep . fromMaybe "-"

parseArgs :: [String] -> IO ([Flag], [String])
parseArgs argv =
  case getOpt Permute opts argv of
    (o,n,[]) -> return (o,n)
    (_,_,errs) -> ioError $ userError $ concat errs ++ usageInfo header opts
    where header = "Usage: rpass [OPTIONS]"

-- Used with foldl to use last specified option
-- e.g. `rpass -n 4 -n 6` would yield (6, defaultDict, "-")
collectArgs :: (Int, String, String) -> Flag -> (Int, String, String)
collectArgs (_, s1, s2) (Count n) = (n, s1, s2)
collectArgs (n, _, s2)  (Dict d)  = (n, d, s2)
collectArgs (n, s1, _)  (Sep s)   = (n, s1, s)

main :: IO ()
main = do
  g <- getStdGen
  (options,_) <- getArgs >>= parseArgs
  let (n, dict, sep) = foldl collectArgs (3, "", "-") options
  -- Load the default dictionary if one was not provided.
  ws <- if not . null $ dict
    then loadWords dict
    else return defaultDict
  putStrLn . intercalate sep $ sampleWords g n ws
