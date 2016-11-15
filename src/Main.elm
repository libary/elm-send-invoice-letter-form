module SendInvoiceLetterForm exposing (..)

import Html.App as App

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

        model = Model flags.target flags.sum flags.email flags.url render False False False Nothing
    in
        (model, Cmd.none)

subscriptions : Model -> Sub a
subscriptions model =
    Sub.none

main: Program Flags
main =
  App.programWithFlags { init = init, view = view, update = update, subscriptions = subscriptions }
