module Demo exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)


type alias Model =
    List String


type Msg
    = UpdateText Int String
    | AppendText String
    | DeleteText Int


main =
    beginnerProgram { model = init, view = view, update = update }


init : Model
init =
    [ "Text A", "Text B", "Text C" ]


view : Model -> Html Msg
view model =
    div []
        [ ul [] (List.indexedMap viewItem model)
        , button [ style [ ( "margin-left", "40px" ) ], onClick (AppendText "Text") ] [ text "+" ]
        ]


viewItem : Int -> String -> Html Msg
viewItem index str =
    li []
        [ text (toString (index + 1) ++ " - " ++ str ++ " - ")
        , input [ type_ "text", onInput (UpdateText index), value str ] []
        , button [ onClick (DeleteText index) ] [ text "-" ]
        ]


update : Msg -> Model -> Model
update msg model =
    case msg of
        UpdateText index string ->
            updateText index string model

        AppendText string ->
            appendText string model

        DeleteText index ->
            deleteText index model


updateText : Int -> String -> Model -> Model
updateText index str model =
    List.indexedMap (replaceNString index str) model


replaceNString : Int -> String -> Int -> String -> String
replaceNString i str i2 str2 =
    if i == i2 then
        str
    else
        str2


appendText : String -> Model -> Model
appendText str model =
    List.append model [ str ]


deleteText : Int -> Model -> Model
deleteText index model =
    List.indexedMap (\i s -> ( i, s )) model
        |> List.filter (\( i, _ ) -> i /= index)
        |> List.map (\( _, s ) -> s)
