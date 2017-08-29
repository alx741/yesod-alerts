-- | Set alerts from your handlers
--
-- @
--      getHomeR :: Handler Html
--      getHomeR = do
--          ...
--          setAlert
-- @

module Yesod.Alert
    ( -- * Setting alerts
      setAlert

      -- ** Shortcuts
    , setDefaultAlert
    , setInfoAlert
    , setSuccessAlert
    , setWarningAlert
    , setErrorAlert

    -- * Getting alerts
    , getAlerts
    ) where

import Data.Maybe (fromMaybe)
import Data.Text
import Safe (readMay)
import Text.Blaze.Html.Renderer.Text
import Web.Alert
import Yesod.Core
import qualified Data.Text.Lazy as TL

-- Set an 'Alert'
setAlert :: MonadHandler m => Alert -> m ()
setAlert (Alert alert msg) = addMessage (pack $ show alert) $ toHtml msg

setDefaultAlert :: MonadHandler m => TL.Text -> m ()
setDefaultAlert msg = setAlert (Alert Default msg)

setInfoAlert :: MonadHandler m => TL.Text -> m ()
setInfoAlert msg = setAlert (Alert Info msg)

setSuccessAlert :: MonadHandler m => TL.Text -> m ()
setSuccessAlert msg = setAlert (Alert Success msg)

setWarningAlert :: MonadHandler m => TL.Text -> m ()
setWarningAlert msg = setAlert (Alert Warning msg)

setErrorAlert :: MonadHandler m => TL.Text -> m ()
setErrorAlert msg = setAlert (Alert Error msg)

-- Get available 'Alert's
getAlerts :: MonadHandler m => m [Alert]
getAlerts = do
    msgs <- getMessages
    return $ fmap mkAlert msgs
    where
        mkAlert (stat, msg) = Alert (fromMaybe Default (readMay $ unpack stat)) (renderHtml msg)
