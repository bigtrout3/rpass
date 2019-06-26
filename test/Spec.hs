module Main where

import Test.HUnit
import Lib
import System.Random

riggedRandom = mkStdGen 13
dictionary =
  [ "pavane"
  , "drossel"
  , "syboes"
  , "rebob"
  , "ocelots"
  , "tease"
  , "chapped"
  , "wisen"
  , "sillery"
  , "agisms"
  , "lamut"
  , "yager"
  , "dottard"
  , "jammers"
  , "bargees"
  , "aerobus"
  , "mutular"
  , "kleagle"
  , "samoans"
  , "endoubt"
  , "unlace"
  , "tubulet"
  , "chirt"
  , "quelled"
  , "mouly"
  , "kulimit"
  , "pendent"
  , "kepi"
  , "punkish"
  , "display"
  ]

sampleWords_test_length :: Int -> Test
sampleWords_test_length n = TestCase (
  assertEqual "It should generate n words" n (length $ sampleWords riggedRandom n dictionary)
  )

mkTestCase :: Int -> Test
mkTestCase n = TestLabel label assertion
  where label     = "Given "++m++", get "++m++" words"
        m         = show n
        assertion = sampleWords_test_length n

test_sampleWords = TestLabel "sampleWords" $ TestList $ map mkTestCase [1..6]

tests = test_sampleWords

main :: IO ()
main = runTestTT test_sampleWords >> return ()
