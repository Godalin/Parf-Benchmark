open Mlpost
open Num
open Command
open Box

let t =
  let padding = cm 0.2 in
  let _0 = tex "0 (1)" in
  let _1 = place ~padding `Northwest _0 (tex "1 (20)") in
  let _2 = place ~padding `Northeast _0 (tex "2 (21)") in
  let _3 = place ~padding `North _1 (tex "3 (48)") in
  let _4 = place ~padding `North _2 (tex "4 (45)") in
  let b = group [_0;_1;_2;_3;_4] in
  Box.draw b ++
  iterl (fun (a,b) -> Arrow.box_to_box a b)
    [_1,_0;_2,_0;_3,_1;_4,_2]

let () = Metapost.emit "genealogie" t
