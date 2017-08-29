-- | Render 'Alert's using Foundation v5.x
--
--  Dependencies (These should be accessible in your app):
--
-- * Foundation's CSS and JS
--
-- * Modernizr
--
-- * JQuery

module Yesod.Alert.Foundation5
    ( renderAlertsFoundation5
    , F5.AlertType(..)
    ) where

import Text.Blaze
import Web.Alert
import qualified Web.Alert.Renderer.Foundation5 as F5

renderAlertsFoundation5 :: F5.AlertType -> [Alert] -> Markup
renderAlertsFoundation5 at as = preEscapedToMarkup $ F5.renderAlertsFoundation5 at as
