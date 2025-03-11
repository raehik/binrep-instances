{-# OPTIONS_GHC -fno-warn-orphans #-}
{-# LANGUAGE UndecidableInstances #-} -- required for SWCoercibly

module Binrep.Instances.Strongweak.Type.Thin where

import Binrep.Type.Thin
import Strongweak

deriving via SWCoercibly a instance     Weaken (Thin a)
deriving via SWCoercibly a instance Strengthen (Thin a)
