module GenDict where

import Language.Haskell.TH
import Control.Monad(liftM)

-- Turn the dictionary.txt file into a list of strings.
-- Done so the dictionary is provided with the executable itself and
-- doesn't need to be managed with the executable.
genDict :: Q Exp
genDict = do
  ws <- runIO $ readFile "dictionary.txt"
  return . ListE . map (LitE . stringL) $ words ws
