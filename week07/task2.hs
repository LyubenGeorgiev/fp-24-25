main :: IO()
main = do
    print $ minIf 15 60 == 15
    print $ minIf 60 15 == 15

    print $ minGuard 15 60 == 15
    print $ minGuard 60 15 == 15

    print $ minBuiltIn 60 15 == 15

    print $ lastDigit 154 == 4

    print $ quotientWhole 64 2 == 32

    print $ divWhole 154 17 == 9.058823529411764

    print $ removeLastDigit 154 == 15    

    print $ divReal 154.451 10.01 == 15.42967032967033

    print $ quotientReal 154.21 17.17 == 8

    print $ avgWhole 5 1542 == 773.5

    print $ roundTwoDig 3.1413465345321 == 3.14

    print $ roundTwoDigButWithMagic 3.1413465345321 == 3.14 -- partial function application and composition (defining a function on a functional level)

minIf x y = if x < y then x else y

minGuard x y
 | x < y = x
 | y < x = y
 | otherwise = x

minBuiltIn = min

lastDigit x = x `mod` 10

quotientWhole x y = div x y

divWhole x y = x / y

removeLastDigit = (`div`10)

divReal = (/)

quotientReal x y = floor $ x / y

avgWhole x y = (x + y) / 2

roundTwoDig :: Double -> Double
roundTwoDig n = (fromIntegral $ round $ n * 100) / 100

roundTwoDigButWithMagic  :: Double -> Double
roundTwoDigButWithMagic = (/100) . fromIntegral . round . (*100)