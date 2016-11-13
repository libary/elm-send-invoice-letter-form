module Type exposing (..)

import Http

type alias Flags =
    { target : String
    , sum : String
    , email : String
    , url : String
    , render : String }

type Render
    = Adv
    | Baza4Sms

type alias Model =
    { target : String
    , sum : String
    , email : String
    , url : String
    , render : Render
    , errorOnEmail : Bool
    , errorOnSum : Bool
    , errorOnTarget : Bool
    , invoiceSent : Maybe Bool
}

type Msg
    = NoOp
    | ChangeTarget String
    | ChangeSum String
    | ChangeEmail String 
    | ValidateEmail
    | ValidateSum
    | ValidateTarget
    | SendInit
    | SendSucceed Bool
    | SendFail Http.Error
