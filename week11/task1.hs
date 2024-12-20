main :: IO()
main = do
  print $ t
  print $ size t == 13
  print $ getLevel t 2 == [5, 8, 9, 11, 13, 6, 4]

data NTree a = Nil | Node a [NTree a]
  deriving (Show)

instance Foldable NTree where
  foldr _ b Nil = b
  foldr f b (Node x ts) = f x (foldr (flip (foldr f)) b ts)

t = Node 10 [Node 3 [Node 5 [Nil], Node 8 [Node 1 [Nil], Node 2 [Nil]], Node 9 [Nil]], Node 7 [Node 11 [Nil], Node 13 [Nil]], Node 12 [Node 6 [Nil], Node 4 [Nil]]]

getLevel :: NTree a -> Int -> [a]
getLevel Nil _ = []
getLevel (Node value _) 0 = [value]
getLevel (Node value children) k = concatMap (`getLevel` (k - 1)) children

-- size :: NTree a -> Int
-- size Nil = 0
-- size (Node _ children) = 1 + (sum $ map size children)

size :: NTree a -> Int
size = length