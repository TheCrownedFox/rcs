import XMonad hiding ( (|||) )
import XMonad.Layout.LayoutCombinators
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig
import System.IO

main = do
    xmproc <- spawnPipe "xmobar"
    xmonad $ defaultConfig {
        workspaces = myWorkspaces,
        manageHook = myManageHooks <+> manageHook defaultConfig,
        layoutHook = avoidStruts $ myLayouts,
        handleEventHook = docksEventHook,
        logHook = dynamicLogWithPP xmobarPP {
            ppOutput = hPutStrLn xmproc,
            ppTitle = xmobarColor "#00AFFF" ""
        }
    } `additionalKeys` myKeys

myKeys = [ 
    ((0, 0x1008FFA9), spawn "toggleMouse"),
    ((0, 0x1008FF03), spawn "setBright dec 110"),
    ((0, 0x1008FF02), spawn "setBright inc 110"),
    ((mod1Mask, xK_p), spawn "dmenu_run -fn -*-fixed-*-*-*-18-*")
    ]

myManageHooks = composeAll [
    className =? "Zathura" --> doShift "3",
    className =? "Chromium" --> doShift "2"
    ]

myWorkspaces = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]

myLayouts = Full ||| tall ||| Mirror tall
    where tall = Tall 1 (3 / 100) (1 / 2)
