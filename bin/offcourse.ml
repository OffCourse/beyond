type t =
  { goal : string
  ; description : string
  ; id : Uuid.t
  ; forked_from : Uuid.t option
  ; checkpoints : Checkpoint.t list
  }

let create ~goal ~description ~checkpoints =
  let id = Uuid.generate () in
  { goal; description; id; forked_from = None; checkpoints }
;;

let get_id t = t.id

let to_yojson t =
  let forked_from =
    match t.forked_from with
    | Some s -> Uuid.to_yojson s
    | None -> `Null
  in
  let checkpoints = List.map Checkpoint.to_yojson t.checkpoints in
  `Assoc
    [ "goal", `String t.goal
    ; "description", `String t.description
    ; "id", Uuid.to_yojson t.id
    ; "forked_from", forked_from
    ; "checkpoints", `List checkpoints
    ]
;;
