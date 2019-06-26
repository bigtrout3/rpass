module GenDict where

import Language.Haskell.TH
import Control.Monad(liftM)

genDict :: Q Exp
genDict = do
  ws <- runIO $ readFile "dictionary.txt"
  return $ ListE $ map (LitE . stringL) $ words ws
