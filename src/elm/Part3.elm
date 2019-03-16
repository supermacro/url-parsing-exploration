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
  = ToggleVisibility Bool


md : Html msg
md = Markdown.toHtml [ class "content" ] """
GIORGIOOO

```javascript
() => null
```
"""


view : Model -> Html Msg
view model =
  div [ class "part-2" ]
    [ button [] [ text "Ok Got It" ]
    , md
    ]


update : Msg -> Model -> Model
update _ model = Model <| not model.visible
