{-# LANGUAGE TemplateHaskell #-}

module Lib
    ( loadWords,
      sampleWords,
      defaultDict
    ) where

import System.Random
import Control.Monad(liftM)
import GenDict

defaultDict :: [String]
defaultDict = $(genDict)

loadWords :: FilePath -> IO [String]
loadWords fpath = liftM words $ readFile fpath

sampleWords :: StdGen -> Int -> [String] -> [String]
sampleWords g n words = map (words !!) indices
  where len = length words
        indices = take n $ randomRs (0, len) g
