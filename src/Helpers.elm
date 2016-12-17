module Helpers exposing (..)

import Type exposing (..)
import Task
import Http exposing (..)
import Json.Decode as Json
import String


sendInvoice : Model -> Cmd Msg
sendInvoice model =
    let
        url : String
        url =
            model.sendUrl

        body : Body
        body =
            multipartBody
                [ stringPart "id" model.id
                , stringPart "target" model.target
                , stringPart "sum" model.sum
                , stringPart "email" model.email
                , stringPart "successUrl" model.successUrl
                ]
    in
        if (validate model) == True then
            Http.send SendResult (Http.post url body decodeResult)
        else
            Cmd.none


decodeResult : Json.Decoder Bool
decodeResult =
    let
        resultField : String
        resultField =
            "result"
    in
        Json.at [ resultField ] Json.bool


validateTarget : Model -> Bool
validateTarget model =
    not (String.isEmpty model.target)


validateSum : Model -> Bool
validateSum model =
    not (String.isEmpty model.sum) && (Result.toMaybe (String.toFloat model.sum) /= Nothing)


validateEmail : Model -> Bool
validateEmail model =
    not (String.isEmpty model.email)


validate : Model -> Bool
validate model =
    not model.errorOnTarget && not model.errorOnSum && not model.errorOnEmail


message : msg -> Cmd msg
message x =
    Task.perform identity (Task.succeed x)
