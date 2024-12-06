import Data.List

main :: IO()
main = do
    print $ isPath [(1, [2, 3]), (2, [3, 4]), (3, []), (4, [])] [1, 2, 4] == True
    print $ isPath [(1, [2, 3]), (2, [3, 4]), (3, []), (4, [])] [1, 3, 4] == False
    print $ isPath [(1, [2, 3]), (2, [3, 4]), (3, []), (4, [])] [2, 3] == True
    print $ isPath [(1, [2, 3]), (2, [3, 4]), (3, []), (4, [])] [3, 1] == False

type Graph a = [(Node a, [Node a])]
type Node a = a
type Path a = [Node a]

isPath :: (Eq a) => Graph a -> Path a -> Bool
isPath adjls path = all id $ zipWith (\ from to -> any (\ (f, tos) -> from == f && (elem to tos)) adjls) path $ tail path