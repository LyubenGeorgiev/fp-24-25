main :: IO()
main = do
    print $ factRec 11 == 39916800
    print $ factIter 11 == 39916800
    print $ factXs 11 == 39916800

factRec :: Integer -> Integer
factRec 0 = 1
factRec n = n * factRec (n-1)

factIter :: Integer -> Integer
factIter n = helper n 1
 where
    helper 0 res = res
    helper n res = helper (n-1) (res*n)

-- factXs = foldl (*) 1 . (`take` [1,2..])
-- factXs n = foldl (\ res el -> res * el) 1 [1 .. n]
factXs n = product [1 .. n]