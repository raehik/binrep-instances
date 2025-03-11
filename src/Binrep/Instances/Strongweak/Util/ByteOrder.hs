{-# OPTIONS_GHC -fno-warn-orphans #-}

-- | Weaken @'ByteOrdered' end a@ to @a@.
--
-- These are in raehik's custom @primitive@ modules, and strongweak wouldn't
-- touch them anyway unless they were in base or close (simply too specific).

module Binrep.Instances.Strongweak.Util.ByteOrder where

import Binrep.Util.ByteOrder
import Strongweak

-- note that we don't need UndecidableInstances here!
-- happens when defining an orphan instance on a non-package type
deriving via SWCoercibly a instance     Weaken (ByteOrdered end a)
deriving via SWCoercibly a instance Strengthen (ByteOrdered end a)
