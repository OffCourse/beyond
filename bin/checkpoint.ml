type t =
  { task : string
  ; description : string
  ; link : Uuid.t
  }
[@@deriving yojson]

let create ~task ~description =
  let link = Uuid.generate () in
  { task; description; link }
;;
