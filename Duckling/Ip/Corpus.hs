-- Copyright (c) 2016-present, Facebook, Inc.
-- All rights reserved.
--
-- This source code is licensed under the BSD-style license found in the
-- LICENSE file in the root directory of this source tree. An additional grant
-- of patent rights can be found in the PATENTS file in the same directory.


{-# LANGUAGE OverloadedStrings #-}

module Duckling.Ip.Corpus
  ( corpus
  , negativeCorpus
  ) where

import Prelude
import Data.String

import Duckling.Ip.Types
import Duckling.Testing.Types

corpus :: Corpus
corpus = (testContext, allExamples)

negativeCorpus :: NegativeCorpus
negativeCorpus = (testContext, examples)
  where
    examples =
      [ "1111.1111.1111.1111",
        "256.256.256.256"
      ]

allExamples :: [Example]
allExamples = concat
  [ examples (IpData "127.0.0.1")
             [ "127.0.0.1"
             ]
  , examples (IpData "192.168.0.1")
             [ "192.168.0.1"
             ]
  , examples (IpData "8.8.8.8")
             [ "8.8.8.8"
             ]
  , examples (IpData "255.255.255.255")
             [ "255.255.255.255"
             ]
  , examples (IpData "2134::1234:4567:2468:1236:2444:2106")
             [ "2134:: 1234:4567:2468:1236:2444:2106"
             ]
  , examples (IpData "1080:0:0:0:8:800:200C")
             [ "1080:0:0:0:8:800:200C"
             ]
  , examples (IpData "0:0:0:0:0:0:A00:1")
             [ "0:0:0:0:0:0:A00:1"
             ]
  ]
