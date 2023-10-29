type t =
  { goal : string
  ; description : string
  ; id : Uuid.t
  ; forked_from : string option
  ; checkpoints : Checkpoint.t list
  }
[@@deriving yojson]

let create ~goal ~description ~checkpoints =
  let id = Uuid.generate () in
  { goal; description; id; forked_from = None; checkpoints }
;;

let to_string t =
  let t = to_yojson t in
  Yojson.Safe.to_string t
;;
