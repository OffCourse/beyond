let state = Stdlib.Random.State.make_self_init ()

let sample_checkpoint =
  let open Checkpoint in
  let task = "Do This" in
  let description = "HHOOO" in
  create ~task ~description
;;

let sample_course =
  let open Offcourse in
  let goal = "Achieve That" in
  let description = "WOOOWWIEEE" in
  let checkpoint = sample_checkpoint in
  let checkpoints = [ checkpoint ] in
  create ~goal ~description ~checkpoints
;;

let () =
  let offcourse = sample_course in
  let pretty = Offcourse.to_string offcourse in
  print_endline pretty
;;
