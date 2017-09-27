{-# LANGUAGE GADTs #-}
{-# LANGUAGE OverloadedStrings #-}

module Duckling.Hash.Rules
  ( rules ) where

import Prelude
import Data.String

import Duckling.Dimensions.Types
import Duckling.Hash.Types (HashData (..))
import qualified Duckling.Hash.Types as THash
import Duckling.Regex.Types
import Duckling.Types

ruleMd5:: Rule
ruleMd5 = Rule
  { name = "md5"
  , pattern =
    [ regex "[a-f0-9]{32}(:.+)?"
    ]
  , prod = \xs -> case xs of
      (Token RegexMatch (GroupMatch (x:_)):_) ->
        Just $ Token Hash HashData {THash.value = x}
      _ -> Nothing
  }


rules :: [Rule]
rules =
  [ ruleMd5
  ]
