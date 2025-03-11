{-# OPTIONS_GHC -fno-warn-orphans #-}

{- | binrep instances for 'SWChain' where @Cls a => Cls ('SWChain' n a)@.

'SW' and 'SWChain' can help define binreppable data types plus an "easy to work
with" representation in one fell swoop. 'SWChain' is a meaningless newtype only
there to help strongweak do its work (without having to write instances
manually). So here, we define a bunch of recursive instances that use the inner
type.
-}

module Binrep.Instances.Strongweak.SWChain where

import Binrep
import Strongweak
import Data.Kind ( type Type )

deriving via (a :: Type) instance IsCBLen  a => IsCBLen  (SWChain n a)
deriving via (a :: Type) instance    BLen  a =>    BLen  (SWChain n a)
deriving via (a :: Type) instance     Put  a =>     Put  (SWChain n a)
deriving via (a :: Type) instance     PutC a =>     PutC (SWChain n a)
deriving via (a :: Type) instance     Get  a =>     Get  (SWChain n a)
deriving via (a :: Type) instance     GetC a =>     GetC (SWChain n a)
