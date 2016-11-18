module SendInvoiceLetterForm exposing (..)

import Html.App as App
import Cmd.Extra exposing (message)

import Type exposing (..)
import Update exposing (..)
import View exposing (..)

init : Flags -> (Model, Cmd Msg)
init flags =
    let
        render : Render
        render =
            if flags.render == "adv" then
                Adv
            else
                Baza

        model =
            Model flags.id flags.target flags.sum flags.email render flags.sendUrl flags.successUrl False False False Nothing
    in
        (model, Cmd.batch [message ValidateTarget, message ValidateSum, message ValidateEmail])

subscriptions : Model -> Sub a
subscriptions model =
    Sub.none

main: Program Flags
main =
  App.programWithFlags { init = init, view = view, update = update, subscriptions = subscriptions }
