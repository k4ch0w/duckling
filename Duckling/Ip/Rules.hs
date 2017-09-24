-- Copyright (c) 2016-present, Facebook, Inc.
-- All rights reserved.
--
-- This source code is licensed under the BSD-style license found in the
-- LICENSE file in the root directory of this source tree. An additional grant
-- of patent rights can be found in the PATENTS file in the same directory.


{-# LANGUAGE GADTs #-}
{-# LANGUAGE OverloadedStrings #-}

module Duckling.Ip.Rules
  ( rules ) where

import Prelude
import Data.String

import Duckling.Dimensions.Types
import Duckling.Ip.Types (IpData (..))
import qualified Duckling.Ip.Types as TIp
import Duckling.Regex.Types
import Duckling.Types

ruleIp :: Rule
ruleIp = Rule
  { name = "ipv4"
  , pattern =
    [ regex "^([0-9]{1,3}\\.){3}[0-9]{1,3}(\\/([0-9]|[1-2][0-9]|3[0-2]))?$"
    ]
  , prod = \xs -> case xs of
      (Token RegexMatch (GroupMatch (x:_)):_) ->
        Just $ Token Ip IpData {TIp.value = x}
      _ -> Nothing
  }

rules :: [Rule]
rules =
  [ ruleIp
  ]
