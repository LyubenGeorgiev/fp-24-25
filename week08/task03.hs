main :: IO()
main = do
    print $ cartesianProduct [2,3,11] [1,5,10]

cartesianProduct :: [a] -> [b] -> [(a,b)]
cartesianProduct xs ys = [(x,y) | x <- xs, y <- ys]