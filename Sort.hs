module Sort where

import Data.Char (toLower)

--Code form: Ian Lynagh <igloo@earth.li>
mergesort :: (a -> a -> Ordering) -> [a] -> [a]
mergesort cmp = mergesort' cmp . map wrap

mergesort' :: (a -> a -> Ordering) -> [[a]] -> [a]
mergesort' _   [] = []
mergesort' _   [xs] = xs
mergesort' cmp xss = mergesort' cmp (merge_pairs cmp xss)

merge_pairs :: (a -> a -> Ordering) -> [[a]] -> [[a]]
merge_pairs _   [] = []
merge_pairs _   [xs] = [xs]
merge_pairs cmp (xs:ys:xss) = merge cmp xs ys : merge_pairs cmp xss

merge :: (a -> a -> Ordering) -> [a] -> [a] -> [a]
merge _   [] ys = ys
merge _   xs [] = xs
merge cmp (x:xs) (y:ys)
 = case x `cmp` y of
        GT -> y : merge cmp (x:xs)   ys
        _  -> x : merge cmp    xs (y:ys)

wrap :: a -> [a]
wrap x = [x]
--end of fode from: Ian Lynagh <igloo@earth.li>

countUnique :: Ord a => [a] -> [(a,Int)]
countUnique = group . map (\x -> (x,1)) . mergesort compare where
	group :: Eq a => [(a,Int)] -> [(a,Int)] 
	group [] = []
	group [x] = [x]
	group (p1@(x1,c1):p2@(x2,c2):xs)
		| x1 == x2  = group ((x1,c1+c2):xs)
		| otherwise = p1:group (p2:xs)
	
dropList :: (Eq a) => [a] -> [a] -> [a]
dropList xs = foldr (.) id dropXs where
	dropXs = map (\x -> (filter (/=x))) xs


countWords = countUnique . words . filter (isInList (' ':['a'..'z'])) . map toLower 

isInList :: Eq a => [a] -> a -> Bool
isInList xs x = or $ map (== x) xs

tabShowPairs :: (Show a, Show b) => [(a,b)] -> String
tabShowPairs = foldr (++) "" . map (\(x,y) -> show x ++ "\t" ++ show y ++ "\n")
