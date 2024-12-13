main :: IO()
main = do
  print $ constructMaxBTree [3, 2, 1, 6, 0, 5] == (Node 6 (Node 3 Nil (Node 2 Nil (Node 1 Nil Nil))) (Node 5 (Node 0 Nil Nil) Nil))

data BTree a = Nil | Node a (BTree a) (BTree a)
  deriving (Show, Eq, Functor)

constructMaxBTree :: (Ord a) => [a] -> BTree a
constructMaxBTree [] = Nil
constructMaxBTree xs = Node maxx (constructMaxBTree $ takeWhile (/=maxx) xs) (constructMaxBTree $ tail $ dropWhile (/=maxx) xs)
  where
    maxx = maximum xs