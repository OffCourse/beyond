let state = Stdlib.Random.State.make_self_init ()

let () =
  let offcourse_json = Yojson.Basic.from_file "sample_course.json" in
  let offcourse = Offcourse.of_yojson offcourse_json in
  let offcourse_json = Offcourse.to_yojson offcourse in
  let offcourse_string = Yojson.Basic.to_string offcourse_json in
  print_endline offcourse_string
;;
