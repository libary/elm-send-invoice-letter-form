module SendPaymentLetterForm exposing (..)

import Html.App as App

import Type exposing (..)
import View exposing (..)
import Helpers exposing (..)

init : Flags -> ( Model, Cmd Msg )
init flags =
    let
        model = Model flags.account flags.email flags.sum flags.target flags.successURL False False False False
    in      
        ( model, Cmd.none )

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )
        ChangeEmail newEmail ->
            ( {model | email = newEmail}, Cmd.none )
        ChangeSum newSum->
            ( {model | sum = newSum}, Cmd.none)
        ChangeTarget newTarget ->
            ( {model | target = newTarget}, Cmd.none )
        ChangeUrl newUrl ->
            ( {model | url = newUrl}, Cmd.none)
        SendInit ->
            ( model, sendLetter model)
        SendComplete ->
            ( {model | complete = True }, Cmd.none )

subscriptions model =
    Sub.none

main: Program Flags
main =
  App.programWithFlags { init = init, view = view, update = update, subscriptions = subscriptions }