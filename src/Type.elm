module Type exposing (..)

import Http

type alias Flags = 
    { email : String
    , sum : String
    , target : String
    , url : String
    , render : String }

type Render
    = Adv
    | Baza4Sms

type alias Model = 
    { email : String
    , sum : String
    , target : String
    , url : String
    , render : Render
    , errorOnEmail : Bool
    , errorOnSum : Bool
    , errorOnTarget : Bool
    , invoiceSent : Maybe Bool
}

type Msg
  = NoOp
  | ChangeEmail String
  | ChangeSum String
  | ChangeTarget String
  | SendInit
  | SendSucceed Bool
  | SendFail Http.Error