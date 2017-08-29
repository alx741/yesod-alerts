module Yesod.Alert where

import Data.Maybe (fromMaybe)
import Data.Text
import Safe (readMay)
import Text.Blaze.Html.Renderer.Text
import Web.Alert
import Yesod.Core
import Yesod.Core.Handler

-- Add an 'Alert'
addAlert :: MonadHandler m => Alert -> m ()
addAlert (Alert alert msg) = addMessage (pack $ show alert) $ toHtml msg

-- Get available 'Alert's
getAlerts :: MonadHandler m => m [Alert]
getAlerts = do
    msgs <- getMessages
    return $ fmap mkAlert msgs
    where
        mkAlert (stat, msg) = Alert (fromMaybe Default (readMay $ unpack stat)) (renderHtml msg)
