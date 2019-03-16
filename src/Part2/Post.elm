module Part2.Post exposing
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
fromString : String -> Maybe Url
```

Which translates to, "Give me a string and I'll return to you a `Url` record
if the string represents a valid url!"

See the relevant documentation [here](https://package.elm-lang.org/packages/elm/url/latest/Url#fromString)


## Mapping URL Records to Domain-Specifc Routes

The above was pretty straight forward. Now let's imagine we're developing a complex SPA in Elm
using `Browser.application` that connects you with your friends and loved ones. We'll call this app ElmBook. 

And we  have the following `Model` type:

```elm
import Profile
import Newsfeed
import Settings

type Model
  = Profile Profile.model
  | Newsfeed Newsfeed.model
  | Settings Settings.model
```

Let's imagine ElmBook has the following `Route` and `Msg` types:

```elm
type Route
  = Profile
  | Newsfeed
  | Settings
  | Login
  | Register

type Msg
  = Loading
  | Like
  | Dislike
  | Navigate Route -- <-- THIS IS THE RELEVANT BIT
```

The question then is, how do we convert a Url (which we've received inside a `UrlRequest`
from the application's top-level `onUrlRequest` function) into a state update in our application?

In other words, we need the following type signature:

```
Url -> Route -> Model
```
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
