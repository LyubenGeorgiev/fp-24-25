main :: IO()
main = do
  print $ sort [5,4,3,2]

  let tree = (Node 5 (Node 3 Empty Empty) (Node 7 Empty Empty))::(BTree Integer)
  print $ treeSum tree  -- Output: 15

  let tree2 = Node 10 (Node 4 Empty (Node 6 Empty Empty)) Empty
  print $ treeSum tree2 -- Output: 20

  let tree3 = Node "root" (Node "left" Empty Empty) (Node "right" Empty Empty)
  print $ treeConcat tree3 -- Output: 20

  print $ fmap (+1) tree

sort :: Ord a => [a] -> [a]
sort [] = []
sort [x] = [x]
sort xs = merge (sort $ take n xs) (sort $ drop n xs)
  where
    n = div (length xs) 2
    merge [] ys = ys
    merge xs [] = xs
    merge (x:xs) (y:ys)
      | x <= y = x:(merge xs (y:ys))
      | otherwise = y:(merge (x:xs) ys)

data BTree a = Empty | Node a (BTree a) (BTree a) deriving (Eq, Show, Functor)

instance Foldable BTree where
  foldMap _ Empty = mempty
  foldMap f (Node x left right) = f x <> foldMap f left <> foldMap f right

treeSum :: Num a => BTree a -> a
treeSum = sum

treeConcat :: BTree String -> String
treeConcat = foldr (++) ""