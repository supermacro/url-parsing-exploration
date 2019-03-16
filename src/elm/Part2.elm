module Part2 exposing
  ( view
  , update
  , init
  , Model
  , Msg
  )

import Browser
import Html exposing (..)
import Html.Events exposing (..)
import Html.Attributes exposing (class, type_)
import Markdown
import Url

type alias Model =
  { visible : Bool
  }

init : Model
init = Model False


type Msg
  = ToggleVisibility


md : Html msg
md = Markdown.toHtml [ class "content" ] """
The above example demonstrates the usage of the `Url.fromString` function:

```elm
fromString -> String -> Maybe Url
```

Which translates to, "Give me a string" and I'll return to you a `Url` record
if the string represents a valid url!
"""


view : Model -> Html Msg
view model =
  let
    content =
      if model.visible
      then md
      else
        div []
          [ button [ onClick ToggleVisibility ] [ text "Ok Got It" ]
          , p [] [ text "Click above to continue" ]
          ]
      
  in
  div [ class "part-2" ]
    [ content ]


update : Msg -> Model -> Model
update _ model = Model <| not model.visible
