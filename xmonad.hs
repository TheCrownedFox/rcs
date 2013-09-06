import XMonad
import qualified XMonad.StackSet as W
import XMonad.Util.EZConfig
import XMonad.Layout.IndependentScreens
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.SetWMName

main = do
    xmonad =<< dzen defaultConfig
    xmonad $ defaultConfig {
        workspaces = withScreens 2 ["1", "2", "3", "4"],
        startupHook = setWMName "LG3D"
    }





