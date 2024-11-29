main :: IO()
main = do
    print $ filterPM even [1,2,3,4,5] == [2,4]
    print $ filterPM odd [1,2,3,4,5] == [1,3,5]
    print $ filterLC even [1,2,3,4,5] == [2,4]
    print $ filterLC odd [1,2,3,4,5] == [1,3,5]
    print $ filterBuiltIn even [1,2,3,4,5] == [2,4]
    print $ filterBuiltIn odd [1,2,3,4,5] == [1,3,5]

filterPM :: (a -> Bool) -> [a] -> [a]
filterPM _ [] = []
filterPM f (x:xs) = if f x then x:rest else rest
  where
    rest = filterPM f xs

filterLC :: (a -> Bool) -> [a] -> [a]
filterLC f xs = [x | x <- xs, f x]

filterBuiltIn :: (a -> Bool) -> [a] -> [a]
filterBuiltIn = filter