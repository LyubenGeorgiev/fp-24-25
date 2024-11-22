main :: IO()
main = do
    print $ fibRec 11 == 89

    print $ fibIter 11 == 89
    print $ fibIter 110 == 43566776258854844738105

fibRec 0 = 0
fibRec 1 = 1
fibRec n = (fibRec (n-1)) + (fibRec $ n-2)

fibIter n = helper n 0 1
 where
    helper 0 a b = a
    helper n a b = helper (n-1) b (a+b)