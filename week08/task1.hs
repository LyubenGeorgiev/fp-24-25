main :: IO()
main = do
    print $ revOneLineMagic 123 == 321

    print $ sumDivsOneLine 6 == 12

    print $ primeOneLine 6 == False
    print $ primeOneLine 17 == True


revOneLineMagic = read . reverse . show

sumDivsOneLine n = sum $ filter (\ x -> mod n x == 0) [1..n]
-- sumDivsOneLine n = sum $ filter ((==0) . (mod n)) [1..n]
-- sumDivsOneLine n = sum [x | x <- [1..n], mod n x == 0]

primeOneLine n = sumDivsOneLine n == n+1