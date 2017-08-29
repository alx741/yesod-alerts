# yesod-alerts

Alert messages for the [Yesod framework](http://www.yesodweb.com/)


## Setup

Modify your definition of `defaultLayout` in *Foundation.hs*:

```haskell
defaultLayout widget = do
    ...
    alerts  <- getAlerts
    ...
```

Then Include a renderer in *default-layout.hamlet*


```haskell
...
#{renderAlertsBootstrap3 alerts}
...
^{widget}
...
```


## Usage

Set alerts from your handlers

```haskell
getHomeR :: Handler Html
getHomeR = do
    ...
    setAlert (Alert Error "oops")
    setSuccessAlert "Yay!"
    ...
    defautlLayout $ do
        $(widgetFile "homepage")
```


## Renderers

* Bootstrap v3
* Bootstrap v4
* Foundation v5
