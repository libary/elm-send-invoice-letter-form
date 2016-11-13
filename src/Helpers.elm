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
            [ stringData "email" model.email
            , stringData "sum" model.sum
            , stringData "target" model.target
            ]
    in
        Task.perform SendFail SendSucceed (Http.post decodeResult url body)

decodeResult : Json.Decoder Bool
decodeResult =
    let
        resultField = "result"
    in
        Json.at [resultField] Json.bool

validateEmail : String -> Bool
validateEmail email =
  not (String.isEmpty email)

validateSum : String -> Bool
validateSum sum =
  not (String.isEmpty sum)
  &&
  Result.toMaybe (String.toFloat sum) /= Nothing

validateTarget : String -> Bool
validateTarget target =
  not (String.isEmpty target)
