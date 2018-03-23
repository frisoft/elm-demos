module Demo exposing (..)

import Html exposing (..)
import Time exposing (..)


type alias Model =
    Float


type Msg
    = Tick Time


main =
    program { init = init, view = view, update = update, subscriptions = subscriptions }


init : ( Model, Cmd Msg )
init =
    justModel 0.0


view : Model -> Html msg
view model =
    div [] [ text (toString model) ]


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Tick newTime ->
            justModel (Time.inSeconds newTime)


justModel : Model -> ( Model, Cmd Msg )
justModel model =
    ( model, Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions model =
    Time.every millisecond Tick
