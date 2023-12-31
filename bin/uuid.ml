let state = Stdlib.Random.State.make_self_init ()

type t = Uuidm.t

let generate _ =
  let id = Uuidm.v4_gen state () in
  id
;;

let to_string uuid = Uuidm.to_string uuid
let to_yojson uuid = `String (Uuidm.to_string uuid)
let of_yojson = Uuidm.of_string
