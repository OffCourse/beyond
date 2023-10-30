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
