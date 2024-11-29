main :: IO()
main = do
    print $ sumTupleNoPM (4, 5) == 9
    print $ sumTupleNoPM (-5, 5) == 0

    print $ sumTuplePM (4, 5) == 9
    print $ sumTuplePM (-5, 5) == 0

    print $ (\ (a,b) -> a+b) (4, 5) == 9
    print $ (\ (a,b) -> a+b) (-5, 5) == 0

    print $ (uncurry (+)) (4, 5) == 9
    print $ (uncurry (+)) (-5, 5) == 0


sumTupleNoPM t = fst t + snd t

sumTuplePM (a,b) = a+b