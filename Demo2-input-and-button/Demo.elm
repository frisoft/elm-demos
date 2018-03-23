module Demo exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)


type alias Model =
    { name : String
    , age : Int
    }


type Msg
    = UpdateName String
    | IncreaseAge


main =
    beginnerProgram { model = init, view = view, update = update }


init : Model
init =
    { name = "Andrea"
    , age = 45
    }


view : Model -> Html Msg
view model =
    div []
        [ div []
            [ text ("Name: " ++ model.name ++ " ")
            , input [ type_ "text", onInput UpdateName, value model.name ] []
            ]
        , div []
            [ text ("Job: " ++ toString model.age)
            , button [ onClick IncreaseAge ] [ text "+" ]
            ]
        ]


update : Msg -> Model -> Model
update msg model =
    case msg of
        UpdateName newName ->
            { model | name = newName }

        IncreaseAge ->
            { model | age = model.age + 1 }
