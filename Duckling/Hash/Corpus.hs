
{-# LANGUAGE OverloadedStrings #-}

module Duckling.Hash.Corpus
  ( corpus
  , negativeCorpus
  ) where

import Prelude
import Data.String

import Duckling.Hash.Types
import Duckling.Testing.Types

corpus :: Corpus
corpus = (testContext, allExamples)

negativeCorpus :: NegativeCorpus
negativeCorpus = (testContext, examples)
  where
    examples =
      [ "afjadsklfjaklsdfjaklsfd"
      ]

allExamples :: [Example]
allExamples = concat
  [ examples (HashData "f426df9a2180715de1c479a7ffc9bb6a")
                ["f426df9a2180715de1c479a7ffc9bb6a"
                ]
  , examples (HashData "57f8a2c3804043a17fb5f2168faa105b")
                ["57f8a2c3804043a17fb5f2168faa105b"
                ]
  , examples (HashData "77cbc01a6f8a92ed094528cd2c4d8cb8")
                ["77cbc01a6f8a92ed094528cd2c4d8cb8"
                ]
  , examples (HashData "73a6118a6fb9e2113ef2c08586614898")
                ["73a6118a6fb9e2113ef2c08586614898"
                ]
  , examples (HashData "51e3dea0dc797ee214db55fe160fbfa8")
                ["51e3dea0dc797ee214db55fe160fbfa8"
                ]
  , examples (HashData "7e5587fa80a92c946997400a8c3273aa")
                ["7e5587fa80a92c946997400a8c3273aa"
                ]
  , examples (HashData "bdf6c48ba07860182ce5c3a0a4ea6c56")
                ["bdf6c48ba07860182ce5c3a0a4ea6c56"
                ]
  , examples (HashData "4e8292ee66b99ba91f681bac89975c84")
                ["4e8292ee66b99ba91f681bac89975c84"
                ]
  , examples (HashData "21b41ffc88dad7b0ef875486a0269c30")
                ["21b41ffc88dad7b0ef875486a0269c30"
                ]
  , examples (HashData "a138da128d2e000962d1e12600f89c72")
                ["a138da128d2e000962d1e12600f89c72"
                ]
  ]
