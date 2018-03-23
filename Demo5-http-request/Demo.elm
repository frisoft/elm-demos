module Demo exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Http
import Json.Decode as Decode


type Model
    = Nothing
    | Loading
    | Image String


type Msg
    = GetImage
    | GotImage (Result Http.Error String)


main =
    program { init = init, view = view, update = update, subscriptions = always Sub.none }


init : ( Model, Cmd Msg )
init =
    ( Nothing, Cmd.none )


view : Model -> Html Msg
view model =
    div []
        [ button [ onClick GetImage ] [ text "GET IMAGE" ]
        , div []
            [ showImage model
            ]
        ]


showImage : Model -> Html Msg
showImage image =
    case image of
        Nothing ->
            text ""

        Loading ->
            text "Loading..."

        Image url ->
            img [ src url ] []


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        GetImage ->
            ( Loading, getImageCmd )

        GotImage (Ok value) ->
            ( Image value, Cmd.none )

        GotImage (Err _) ->
            ( model, Cmd.none )


getImageCmd : Cmd Msg
getImageCmd =
    Http.get (imageUrl "cats") decodeGifUrl |> Http.send GotImage


imageUrl : String -> String
imageUrl topic =
    "https://api.giphy.com/v1/gifs/random?api_key=dc6zaTOxFJmzC&tag=" ++ topic


decodeGifUrl : Decode.Decoder String
decodeGifUrl =
    Decode.at [ "data", "image_url" ] Decode.string
