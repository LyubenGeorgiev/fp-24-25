main :: IO()
main = do
  print $ Node 1 [(Node 3 []), (Node 5 []), (Node 7 []), (Node 9 [])]
  print $ Node 7 [(Node 9 [(Node 5 []), (Node 2 [])])]

data Tree a = Nil | Node a [Tree a]
  deriving (Show)