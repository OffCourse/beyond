exception ParseError of string

type t =
  | Url of string
  | Course_id of Uuid.t

let to_yojson t =
  match t with
  | Url s -> `String s
  | Course_id id -> Uuid.to_yojson id
;;

let of_yojson s =
  match String.starts_with ~prefix:"https" s with
  | true -> Url s
  | false ->
    (match Uuid.of_yojson s with
     | Some s -> Course_id s
     | None -> raise (ParseError "Invalid Uuid for Link"))
;;
