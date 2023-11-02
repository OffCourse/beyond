type t

val create : course_id:Uuid.t option -> task:string -> description:string -> t
val to_yojson : t -> Yojson.Basic.t
val of_yojson : Yojson.Basic.t -> t
