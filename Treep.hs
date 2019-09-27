module Treep where

import Data.Tree

type Treep x y = Tree (x,y)

split :: (Ord x, Ord y) => Treep x y -> Treep x y -> Treep x y
split l@(Node lv@(lx,ly) ll:lr:_) r@(Node r@(rx,ry) rl:rr:_)  
	| ly >= ry = Node lv [ll,(split lr r)]
	| otherwise = Node rv [lr,(split ll l)]

merge :: (Ord x, Ord y) => Treep x y -> (Treep x y, Treep x y)
merge = undefined
