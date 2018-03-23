module Demo exposing (..)

import Html exposing (..)
import Html.Events exposing (onClick)


type alias Model =
    Int


type Msg
    = Increment
    | Decrement


main =
    beginnerProgram { model = init, view = view, update = update }


init : Model
init =
    0


view : Model -> Html Msg
view model =
    div []
        [ text "Counter: "
        , text (toString model)
        , button [ onClick Increment ] [ text "+" ]
        , button [ onClick Decrement ] [ text "-" ]
        ]


update : Msg -> Model -> Model
update msg model =
    case msg of
        Increment ->
            model + 1

        Decrement ->
            model - 1
