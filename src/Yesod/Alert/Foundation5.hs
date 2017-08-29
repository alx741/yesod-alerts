module Yesod.Alert.Bootstrap3
    ( renderAlertsBootstrap3
    ) where

import Text.Blaze
import Web.Alert
import qualified Web.Alert.Renderer.Bootstrap3 as B3

renderAlertsBootstrap3 :: [Alert] -> Markup
renderAlertsBootstrap3 = preEscapedToMarkup . B3.renderAlertsBootstrap3
