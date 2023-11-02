exception ParseError of string

type t =
  { goal : string
  ; curator : string
  ; description : string
  ; id : Uuid.t
  ; forked_from : Uuid.t option
  ; checkpoints : Checkpoint.t list
  }

let create ~goal ~curator ~description ~checkpoints =
  let id = Uuid.generate () in
  { goal; curator; description; id; forked_from = None; checkpoints }
;;

let fork ~curator ~offcourse =
  let id = Uuid.generate () in
  { offcourse with curator; id; forked_from = Some offcourse.id }
;;

let get_id t = t.id

let of_yojson json =
  let open Yojson.Basic.Util in
  let goal = json |> member "goal" |> to_string in
  let curator = json |> member "curator" |> to_string in
  let description = json |> member "description" |> to_string in
  let id =
    match json |> member "id" |> to_string |> Uuid.of_yojson with
    | Some id -> id
    | None -> raise (ParseError "Course ID must be set")
  in
  let forked_from =
    match json |> member "forked_from" |> to_string_option with
    | None -> None
    | Some id -> Uuid.of_yojson id
  in
  let checkpoints =
    json |> member "checkpoints" |> to_list |> List.map Checkpoint.of_yojson
  in
  { goal; curator; description; id; forked_from; checkpoints }
;;

let to_yojson t =
  let forked_from =
    match t.forked_from with
    | Some s -> Uuid.to_yojson s
    | None -> `Null
  in
  let checkpoints = List.map Checkpoint.to_yojson t.checkpoints in
  `Assoc
    [ "goal", `String t.goal
    ; "curator", `String t.curator
    ; "description", `String t.description
    ; "id", Uuid.to_yojson t.id
    ; "forked_from", forked_from
    ; "checkpoints", `List checkpoints
    ]
;;
