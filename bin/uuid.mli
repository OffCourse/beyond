type t

val generate : unit -> t
val to_string : t -> string
val to_yojson : t -> [> `String of string ]
val of_yojson : [> `String of string ] -> (t, string) result
