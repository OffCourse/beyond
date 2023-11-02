exception ParseError of string

type t =
  { task : string
  ; description : string
  ; id : Uuid.t
  ; link : Link.t
  }

let create ~course_id ~task ~description =
  let id = Uuid.generate () in
  let link =
    match course_id with
    | None -> Link.Url "IIII"
    | Some id -> Link.Course_id id
  in
  { task; description; link; id }
;;

let to_yojson t =
  `Assoc
    [ "task", `String t.task
    ; "description", `String t.description
    ; "id", Uuid.to_yojson t.id
    ; "link", Link.to_yojson t.link
    ]
;;

let of_yojson json =
  let open Yojson.Basic.Util in
  let task = json |> member "task" |> to_string in
  let description = json |> member "description" |> to_string in
  let id = json |> member "id" |> to_string in
  let id =
    match Uuid.of_yojson id with
    | Some id -> id
    | None -> raise (ParseError "Checkpoint ID must be set")
  in
  let link = json |> member "link" |> to_string |> Link.of_yojson in
  { task; description; id; link }
;;
