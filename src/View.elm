module View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Exts.Html exposing (..)

import Type exposing (..)
import Helpers exposing (..)

view : Model -> Html Msg
view model =
    case model.render of
        Adv ->
            advView model
        Baza4Sms ->
            bazaView model

advView : Model -> Html Msg
advView model =
    div [] []

bazaView : Model -> Html Msg
bazaView model =
    div [] []