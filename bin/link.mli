type t =
  | Url of string
  | Course_id of Uuid.t

val to_yojson : t -> [> `String of string ]
val of_yojson : string -> t
