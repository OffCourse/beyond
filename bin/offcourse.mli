type t

val create : goal:string -> description:string -> checkpoints:Checkpoint.t list -> t
val to_yojson : t -> Yojson.Basic.t
val get_id : t -> Uuid.t
