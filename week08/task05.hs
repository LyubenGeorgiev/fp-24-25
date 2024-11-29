main :: IO()
main = do
    print $ perms [1,2,3]

perms :: [a] -> [[a]]
perms [] = [[]]
perms (x:xs) = concatMap (\ xs -> [take i xs ++ [x] ++ (drop i xs) | i <- [0..length xs]]) $ perms xs