module BazaView exposing (bazaView)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Exts.Html exposing (..)
import List exposing (append)

import Type exposing (..)

bazaView : Model -> Html Msg
bazaView model =
    if model.invoiceSent == Nothing
        then
            invoiceReadyView model
        else
            invoiceSentView model

invoiceReadyView : Model -> Html Msg
invoiceReadyView model =
    div [] []

invoiceSentView : Model -> Html Msg
invoiceSentView model =
    let
        message : String
        message =
            if model.invoiceSent == Just True
                then "счёт на оплату отослан"
                else "счёт на оплату не удалось отправить"
    in
        div [] [ text message ]
