module Helpers exposing (..)

import Type exposing (..)

import Task
import Http exposing (multipart,stringData)
import Json.Decode as Json
import String
import Result

sendInvoice : Model -> Cmd Msg
sendInvoice model =
    let
        url = model.url
        body = multipart
            [ stringData "target" model.target
            , stringData "sum" model.sum
            , stringData "email" model.email ]
    in
        Task.perform SendFail SendSucceed (Http.post decodeResult url body)

decodeResult : Json.Decoder Bool
decodeResult =
    let
        resultField = "result"
    in
        Json.at [resultField] Json.bool

validateTarget : Model -> Bool
validateTarget model =
    not (String.isEmpty model.target)

validateSum : Model -> Bool
validateSum model =
    not (String.isEmpty model.sum)
    &&
    Result.toMaybe (String.toFloat model.sum) /= Nothing

validateEmail : Model -> Bool
validateEmail model =
    not (String.isEmpty model.email)
