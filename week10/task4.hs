main :: IO()
main = do
    print $ insert (Node 10 (Node 5 (Node 3 Nil Nil) (Node 7 Nil Nil)) (Node 15 Nil (Node 18 Nil Nil))) 13 == (Node 10 (Node 5 (Node 3 Nil Nil) (Node 7 Nil Nil)) (Node 15 (Node 13 Nil Nil) (Node 18 Nil Nil)))

    -- print $ (numberTreeAfter == numberTreeBefore) == True

    -- print $ secondNumberTree == Node 10 (Node 5 (Node 3 (Node 1 Nil Nil) Nil) (Node 7 (Node 6 Nil Nil) Nil)) (Node 15 (Node 13 Nil Nil) (Node 18 Nil Nil))

data BTree a = Nil | Node a (BTree a) (BTree a)
  deriving (Show, Eq, Functor)

insert :: (Ord a) => BTree a -> a -> BTree a
insert Nil x = Node x Nil Nil
insert (Node x left right) y
  | y <= x = Node x (insert left y) right
  | otherwise = Node x left (insert right y)