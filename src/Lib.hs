{-# LANGUAGE TemplateHaskell #-}

module Lib
    ( loadWords,
      sampleWords,
      defaultDict
    ) where

import System.Random
import Control.Monad(liftM)
import GenDict

-- Static list of words for a basic dictionary.
defaultDict :: [String]
defaultDict = $(genDict)

-- Read in a list of words separated by newlines and/or spaces.
loadWords :: FilePath -> IO [String]
loadWords fpath = liftM words $ readFile fpath

-- Sample, with replacement, `n` items from list `ws`.
sampleWords :: StdGen -> Int -> [String] -> [String]
sampleWords g n ws = map (ws !!) indices
  where len = length ws
        indices = take n $ randomRs (0, len) g
