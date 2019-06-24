module Bio.BioSeq
where

import Data.ByteString.Char8
import Data.Word

class BioSeq a where
  empty :: a

  fromIupacString :: String -> a

  toIupacString :: a -> String

  fromIupacByteString :: ByteString -> a
  fromIupacByteString = fromIupacString . unpack

  toIupacByteString :: a -> ByteString
  toIupacByteString = pack . toIupacString

  fromList :: [Word8] -> a

  toList :: a -> [Word8]
