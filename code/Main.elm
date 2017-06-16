module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onSubmit, onInput)


-- Model


model =
    { groceries = []
    , grocery = ""
    }



-- Update


type Msg
    = AddItem
    | UpdateInput String


update msg model =
    case msg of
        AddItem ->
            { model | groceries = model.grocery :: model.groceries, grocery = "" }

        UpdateInput str ->
            { model | grocery = str }



-- view


view model =
    div []
        [ h1 [] [ text "grocery list" ]
        , Html.form [ onSubmit AddItem ]
            [ input [ placeholder "Add a grocery item", value model.grocery, onInput UpdateInput ] []
            ]
        , ul [] (List.map singleItem model.groceries)
        ]


singleItem item =
    li [] [ text item ]


main =
    beginnerProgram
        { model = model
        , update = update
        , view = view
        }
