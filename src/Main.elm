module SendPaymentLetterForm exposing (..)

import Html.App as App

import Type exposing (..)
import View exposing (..)
import Helpers exposing (..)

init : Flags -> (Model, Cmd Msg)
init flags =
    let
        render : Render
        render = 
            if flags.render == "adv" then
                Adv
            else
                Baza4Sms
                
        model = Model flags.email flags.sum flags.target flags.url render False False False Nothing
    in      
        (model, Cmd.none)

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
    case msg of
        NoOp ->
            (model, Cmd.none)
        ChangeEmail newEmail ->
            ({model | email = newEmail}, Cmd.none)
        ChangeSum newSum->
            ({model | sum = newSum}, Cmd.none)
        ChangeTarget newTarget ->
            ({model | target = newTarget}, Cmd.none)
        SendInit ->
            (model, sendInvoice model)
        SendSucceed result ->
            ({model | invoiceSent = Just result }, Cmd.none)
        SendFail error ->
            ({model | invoiceSent = Just False }, Cmd.none)

subscriptions : Model -> Sub a
subscriptions model =
    Sub.none

main: Program Flags
main =
  App.programWithFlags { init = init, view = view, update = update, subscriptions = subscriptions }