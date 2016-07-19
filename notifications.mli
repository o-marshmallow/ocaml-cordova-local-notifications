type event =
  | Click     [@js "click"]
  | Trigger   [@js "trigger"]
  | Schedule  [@js "schedule"]
  | Update    [@js "update"]
  | Clear     [@js "clear"]
  | ClearAll  [@js "clearall"]
  | Cancel    [@js "cancel"]
  | CancelAll [@js "cancelall"]
[@@js.enum]

module ScheduleOptions : sig
  type t

  val create :
    ?id:int ->
    ?title:string ->
    ?text:string ->
    ?every:string ->
    ?at:int ->
    ?badge:int ->
    ?sound:string ->
    ?data:string ->
    (** For android **)
    ?icon:string ->
    ?smallicon:string ->
    ?every:string ->
    ?ongoing:bool ->
    ?led:string ->
    unit ->
    t
    [@@js.builder]

  val id : t -> int
  val title : t -> string
  val text : t -> string
  val every : t -> string
  val at : t -> int
  val badge : t -> int
  val sound : t -> string
  val data : t -> string
  val icon : t -> string
  val smallicon : t -> string
  val every : t -> string
  val ongoing : t -> bool
  val led : t -> string
  val set_id : t -> int -> unit
  val set_title : t -> string -> unit
  val set_text : t -> string -> unit
  val set_every : t -> string -> unit
  val set_at : t -> int -> unit
  val set_badge : t -> int -> unit
  val set_sound : t -> string -> unit
  val set_data : t -> string -> unit
  val set_icon : t -> string -> unit
  val set_smallicon : t -> string -> unit
  val set_every : t -> string -> unit
  val set_ongoing : t -> bool -> unit
  val set_led : t -> string -> unit
end

val schedule : ScheduleOptions.t -> unit
  [@@js.call "cordova.plugins.notification.local.schedule"]

val schedule_list : ScheduleOptions.t list -> unit
  [@@js.call "cordova.plugins.notification.local.schedule"]

val on : event -> (ScheduleOptions.t -> unit) -> unit
  [@@js.call "cordova.plugins.notification.local.on"]

val update : ScheduleOptions.t -> unit
  [@@js.call "cordova.plugins.notification.local.update"]

val update_list : ScheduleOptions.t list -> unit
  [@@js.call "cordova.plugins.notification.local.update"]

val clear : int -> (unit -> unit) -> unit
  [@@js.call "cordova.plugins.notification.local.clear"]

val clear_list : int list -> (unit -> unit) -> unit
  [@@js.call "cordova.plugins.notification.local.clear"]

val cancel : int -> (unit -> unit) -> unit
  [@@js.call "cordova.plugins.notification.local.cancel"]
