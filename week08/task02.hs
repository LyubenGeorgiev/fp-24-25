main :: IO()
main = do
    print $ pack [1, 2, 3, 5, 7, 8 ,9] == [[1,2,3],[5],[7,8,9]]
    print $ pack [1, 7, 8 ,9] == [[1],[7,8,9]]
    print $ pack [1, 9] == [[1],[9]]

pack :: [Int] -> [[Int]]
pack [] = []
pack [x] = [[x]]
pack (x:y:xs)
 | x + 1 == y = (x:r):rs
 | otherwise = [x]:(r:rs)
    where
        (r:rs) = pack (y:xs)