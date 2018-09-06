module Bio.BioSeq.DNASeq
where

import Prelude hiding (any)
import Bio.BioSeq
import qualified Data.ByteString as B
import qualified Data.ByteString.Char8 as B8
import Data.Word

type Base = Word8

gap      :: Base
gap      = 0
adenine  :: Base
adenine  = 1
cytosine :: Base
cytosine = 2
guanine  :: Base
guanine  = 3
thymine  :: Base
thymine  = 4
any      :: Base
any      = 5

fromIupacChar :: Char -> Base
fromIupacChar '-' = gap
fromIupacChar 'A' = adenine
fromIupacChar 'C' = cytosine
fromIupacChar 'G' = guanine
fromIupacChar 'T' = thymine
fromIupacChar 'N' = any
fromIupacChar b   = error $ "invalid base char: " ++ [b]

toIupacChar :: Base -> Char
toIupacChar b
  | b == gap      = '-'
  | b == adenine  = 'A'
  | b == cytosine = 'C'
  | b == guanine  = 'G'
  | b == thymine  = 'T'
  | b == any      = 'N'
  | otherwise     = error $ "invalid base: " ++ show b

complement :: Base -> Base
complement b
  | b == gap      = gap
  | b == adenine  = thymine
  | b == cytosine = guanine
  | b == guanine  = cytosine
  | b == thymine  = adenine
  | b == any      = any
  | otherwise     = error $ "invalid base: " ++ show b

newtype DNASeq = DNASeq B.ByteString

instance BioSeq DNASeq where
  fromIupacString = DNASeq . B.pack . map fromIupacChar
  toIupacString (DNASeq bs) = map toIupacChar $ B.unpack bs
  fromList = DNASeq . B.pack
  toList (DNASeq bs) = B.unpack bs

instance Show DNASeq where
  show = toIupacString

reverseComplement :: DNASeq -> DNASeq
reverseComplement (DNASeq seq) = DNASeq $ B.map complement $ B.reverse seq
