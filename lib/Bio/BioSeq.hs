module Bio.BioSeq
where

import Data.ByteString.Char8
import Data.Word

class BioSeq a where
  fromIupacString :: String -> a

  toIupacString :: a -> String

  fromIupacByteString :: ByteString -> a
  fromIupacByteString = fromIupacString . unpack

  toIupacByteString :: a -> ByteString
  toIupacByteString = pack . toIupacString

  fromList :: [Word8] -> a

  toList :: a -> [Word8]

{-
  alternative implementation?

  data DNA
  data BioSeq t = BioSeq t ByteString
  type DNASeq = BioSeq DNA
-}

{-
  'to(from)IupacByteString' employes BioSeq a <-> String <-> ByteString conversion

  For direct conversion between BioSeq a <-> ByteString, Char <-> Word8 conversion functions
  are required. They are provided in Data.Bytestring.Internal, although they are unsafe

  http://hackage.haskell.org/package/bytestring-0.9/docs/Data-ByteString-Internal.html#8
-}
