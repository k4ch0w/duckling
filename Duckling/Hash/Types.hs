
{-# LANGUAGE DeriveAnyClass #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE NamedFieldPuns #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TypeFamilies #-}

module Duckling.Hash.Types where
import Control.DeepSeq
import Data.Aeson
import Data.Hashable
import Data.Text (Text)
import GHC.Generics
import Prelude

import Duckling.Resolve (Resolve(..))

newtype HashData = HashData { value :: Text }
  deriving (Eq, Generic, Hashable, Ord, Show, NFData)

instance Resolve HashData where
  type ResolvedValue HashData = HashData
  resolve _ x = Just x

instance ToJSON HashData where
  toJSON HashData {value} = object [ "value" .= value ]
