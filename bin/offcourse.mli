type t

val create
  :  goal:string
  -> curator:string
  -> description:string
  -> checkpoints:Checkpoint.t list
  -> t

val fork : curator:string -> offcourse:t -> t
val to_yojson : t -> Yojson.Basic.t
val of_yojson : Yojson.Basic.t -> t
val get_id : t -> Uuid.t
