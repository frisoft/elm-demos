module Demo exposing (..)

import Html exposing (..)


type alias Model =
    String


main =
    beginnerProgram { model = init, view = view, update = update }


init : Model
init =
    "This is my initial state"


view : Model -> Html msg
view model =
    text model


update : msg -> Model -> Model
update msg model =
    model
