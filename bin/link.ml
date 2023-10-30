type t =
  | Url of string
  | Course_id of Uuid.t

let to_yojson t =
  match t with
  | Url s -> `String s
  | Course_id id -> Uuid.to_yojson id
;;
