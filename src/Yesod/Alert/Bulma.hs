-- | Render 'Alert's using Bulma
--
--  Dependencies (These should be accessible in your app):
--
-- * Bulma's CSS
--
-- * JQuery >= 3.2.1

module Yesod.Alert.Bulma
    ( renderAlertsBulma
    ) where

import Text.Blaze
import Web.Alert
import qualified Web.Alert.Renderer.Bulma as B

renderAlertsBulma :: [Alert] -> Markup
renderAlertsBulma = preEscapedToMarkup . B.renderAlertsBulma
