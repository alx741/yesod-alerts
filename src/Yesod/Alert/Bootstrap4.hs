-- | Render 'Alert's using Bootstrap v4.x
--
--  Dependencies (These should be accessible in your app):
--
-- * Bootstrap's CSS and JS
--
-- * JQuery >= 3.2.1

module Yesod.Alert.Bootstrap4
    ( renderAlertsBootstrap4
    ) where

import Text.Blaze
import Web.Alert
import qualified Web.Alert.Renderer.Bootstrap4 as B4

renderAlertsBootstrap4 :: [Alert] -> Markup
renderAlertsBootstrap4 = preEscapedToMarkup . B4.renderAlertsBootstrap4
