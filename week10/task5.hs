import Data.List

main :: IO()
main = do
  print $ isBinarySearchTree t3 == True
  print $ isBinarySearchTree t4 == False
  print $ isBinarySearchTree t5 == False
  print $ isBinarySearchTree t6 == False

data BTree a = Nil | Node a (BTree a) (BTree a)
  deriving (Show, Eq, Functor)

instance Foldable BTree where
  foldr _ b Nil = b
  foldr f b (Node x left right) = foldr f (f x (foldr f b left)) right

isBinarySearchTree :: (Ord a) => BTree a -> Bool
isBinarySearchTree tree = xs == (sort xs)
  where
    inorder = foldl (flip (:)) []
    xs = inorder tree

t3 :: BTree Int
t3 = Node 8 (Node 3 (Node 1 Nil Nil) (Node 6 (Node 4 Nil Nil) (Node 7 Nil Nil))) (Node 10 Nil (Node 14 (Node 13 Nil Nil) Nil))

t4 :: BTree Int
t4 = Node 8 (Node 3 (Node 5 Nil Nil) (Node 6 Nil Nil)) (Node 10 Nil (Node 14 Nil Nil))

t5 :: BTree Int
t5 = Node 8 (Node 3 (Node 2 Nil Nil) (Node 6 Nil Nil)) (Node 10 Nil (Node 1 Nil Nil))

t6 :: BTree Int
t6 = Node 8 (Node 3 (Node 1 Nil Nil) (Node 4 Nil Nil)) (Node 10 (Node 5 Nil Nil) Nil)