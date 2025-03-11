{-# OPTIONS_GHC -fno-warn-orphans #-}

-- | Weaken @'Magic'@ to '()', to separate weak forms from binrep-land.

module Binrep.Instances.Strongweak.Type.Magic where

import Binrep.Type.Magic
import Strongweak

-- | Weaken a @'Magic' a@ to the unit '()'.
instance Weaken   (Magic a) where
    type Weakened (Magic a) = ()
    weaken Magic = ()

-- | Strengthen the unit '()' to some @'Magic' a@.
instance Strengthen (Magic a) where strengthen () = Right Magic
