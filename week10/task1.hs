import Data.Char

main :: IO()
main = do
    print $ numberBTree
    print $ charBTree

    print $ size numberBTree == 9
    print $ size charBTree == 7

    print $ sumTree numberBTree == 146
    -- print $ sumTree charBTree -- should not work

    print $ traverseDFS numberBTree == [96, 1, 12, 0, 5, 2, 4, 5, 21]
    print $ traverseDFS charBTree == "haskell"

    print $ getLevel numberBTree 2 == [1, 0, 2, 5]
    print $ getLevel charBTree 1 == "al"
    print $ getLevel charBTree 3 == []

    print $ traverseBFS numberBTree == [5,12,4,1,0,2,5,96,21]
    print $ traverseBFS charBTree == "kalhsel"

    print $ mapTree (*2) numberBTree == Node 10 (Node 24 (Node 2 (Node 192 Nil Nil) Nil) (Node 0 Nil Nil)) (Node 8 (Node 4 Nil Nil) (Node 10 Nil (Node 42 Nil Nil)))
    print $ mapTree (show) numberBTree == Node "5" (Node "12" (Node "1" (Node "96" Nil Nil) Nil) (Node "0" Nil Nil)) (Node "4" (Node "2" Nil Nil) (Node "5" Nil (Node "21" Nil Nil)))
    print $ mapTree (toUpper) charBTree == Node 'K' (Node 'A' (Node 'H' Nil Nil) (Node 'S' Nil Nil)) (Node 'L' (Node 'E' Nil Nil) (Node 'L' Nil Nil))

data BTree a = Nil | Node a (BTree a) (BTree a)
  deriving (Show, Eq, Functor)

instance Foldable BTree where
  foldr _ b Nil = b
  foldr f b (Node x left right) = foldr f (f x (foldr f b left)) right

numberBTree :: BTree Int
numberBTree = Node 5 (Node 12 (Node 1 (Node 96 Nil Nil) Nil) (Node 0 Nil Nil)) (Node 4 (Node 2 Nil Nil) (Node 5 Nil (Node 21 Nil Nil)))

charBTree :: BTree Char
charBTree = Node 'k' (Node 'a' (Node 'h' Nil Nil) (Node 's' Nil Nil)) (Node 'l' (Node 'e' Nil Nil) (Node 'l' Nil Nil))

mapTreeComplex :: (a -> b) -> BTree a -> BTree b
mapTreeComplex = fmap

mapTree :: (a -> b) -> BTree a -> BTree b
mapTree f Nil = Nil
mapTree f (Node x left right) = Node (f x) (mapTree f left) (mapTree f right)

size :: BTree a -> Int
size = length

-- size :: BTree a -> Int
-- size Nil = 0
-- size (Node _ left right) = 1 + (size left) + (size right)

sumTree :: BTree Int -> Int
sumTree = sum

-- sumTree :: BTree Int -> Int
-- sumTree Nil = 0
-- sumTree (Node x left right) = x + (sumTree left) + (sumTree right)

traverseDFS :: BTree a -> [a]
traverseDFS = foldl (flip (:)) []

-- traverseDFS :: BTree a -> [a]
-- traverseDFS Nil = []
-- traverseDFS (Node x left right) = traverseDFS left ++ [x] ++ (traverseDFS right)

getLevel :: BTree a -> Int -> [a]
getLevel Nil _ = []
getLevel (Node x _ _) 0 = [x]
getLevel (Node x left right) level = getLevel left (level-1) ++ (getLevel right (level-1))

traverseBFS :: BTree a -> [a]
traverseBFS tree = concat $ takeWhile (not . null) $ map (getLevel tree) [0..]