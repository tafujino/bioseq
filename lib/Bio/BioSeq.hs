--{-# LANGUAGE InstanceSigs #-}
--{-# LANGUAGE FlexibleInstances #-}
--{-# LANGUAGE UndecidableInstances #-}
--{-# LANGUAGE OverlappingInstances #-}
module Bio.BioSeq
where

import Data.ByteString.Char8

class BioSeq a where
  toIupacString :: a -> String

  fromIupacString :: String -> a

  toIupacByteString :: a -> ByteString
  toIupacByteString = pack . toIupacString

  fromIupacByteString :: ByteString -> a
  fromIupacByteString = fromIupacString . unpack

--instance BioSeq a => Show a where  
--  show :: a -> String
--  show = toIupacString


--instance {-# OVERLAPPABLE #-} BioSeq a => Show a where
--  show :: a -> String
--  show = toIupacString

--instance BioSeq a => Show a where
--  show :: a -> String
--  show = toIupacString

--show :: BioSeq a => a -> String
--show = toIupacString

{-
'to(from)IupacByteString' employes BioSeq a <-> String <-> ByteString conversion

For direct conversion between BioSeq a <-> ByteString, Char <-> Word8 conversion functions
are required. They are provided in Data.Bytestring.Internal, although they are unsafe

http://hackage.haskell.org/package/bytestring-0.9/docs/Data-ByteString-Internal.html#8
-}
