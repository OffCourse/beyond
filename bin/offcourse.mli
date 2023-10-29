type t

val create : goal:string -> description:string -> checkpoints:Checkpoint.t list -> t
val to_string : t -> string
