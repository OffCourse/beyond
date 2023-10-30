let state = Stdlib.Random.State.make_self_init ()

let sample_course =
  let open Offcourse in
  let goal = "Achieve That" in
  let description = "WOOOWWIEEE" in
  let checkpoints = [] in
  create ~goal ~description ~checkpoints
;;

let sample_checkpoint =
  let open Offcourse in
  let offcourse = sample_course in
  let open Checkpoint in
  let task = "Do This" in
  let description = "HHOOO" in
  let course_id = Some (get_id offcourse) in
  create ~course_id ~task ~description
;;

let sample_course2 =
  let open Offcourse in
  let goal = "Achieve This" in
  let description = "WOOOWWIEEE" in
  let checkpoint = sample_checkpoint in
  let checkpoints = [ checkpoint ] in
  create ~goal ~description ~checkpoints
;;

let () =
  let offcourse = sample_course2 in
  let json = Offcourse.to_yojson offcourse in
  let pretty = Yojson.Basic.to_string json in
  print_endline pretty
;;
