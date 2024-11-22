main :: IO()
main = do
    print $ isInsideNoLists 5 1 4 == True -- start, end, x
    print $ isInsideNoLists 10 50 20 == True
    print $ isInsideNoLists 10 50 1 == False

    print $ isInsideLists 5 1 4 == True
    print $ isInsideLists 10 50 20 == True
    print $ isInsideLists 10 50 1 == False

    print $ (isInsideLambda 5 1) 4 == True
    print $ (isInsideLambda 10 50) 20 == True
    print $ (isInsideLambda 10 50) 1 == False
    
isInsideNoLists s e x = (min s e) <= x && x <= (max s e)

isInsideLists s e x = elem x [(min s e) .. (max s e)]

isInsideLambda s e = (\ x -> isInsideNoLists s e x)