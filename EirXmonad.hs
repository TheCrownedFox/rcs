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
	modMask = mod4Mask,
        manageHook = myManageHooks <+> manageHook defaultConfig,
        layoutHook = avoidStruts $ myLayouts,
        handleEventHook = docksEventHook,
        logHook = dynamicLogWithPP xmobarPP {
            ppOutput = hPutStrLn xmproc,
            ppTitle = xmobarColor "#00AFFF" ""
        }
    } `additionalKeys` myKeys

myKeys = [ 
    ((0, 0x1008FFA9), spawn "$HOME/bin/toggleMouse"),
    ((0, 0x1008FF03), spawn "$HOME/bin/setBright dec 110"),
    ((0, 0x1008FF02), spawn "$HOME/bin/setBright inc 110"),
--    ((0, xK_F4), spawn "toggleMouse"),
--    ((0, xK_F6), spawn "setBright dec 110"),
--    ((0, xK_F7), spawn "setBright inc 110"),
    ((mod4Mask, xK_p), spawn "dmenu_run -fn -*-fixed-*-*-*-18-*"),
    ((mod4Mask, xK_F1), spawn "xdotool click 1"),
    ((mod4Mask, xK_F2), spawn "xdotool click 3")
    ]

myManageHooks = composeAll [
    className =? "Zathura" --> doShift "3",
    className =? "Chromium" --> doShift "2",
    className =? "LibreOffice" --> doShift "4"
    ]

myWorkspaces = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]

myLayouts = Full ||| tall ||| Mirror tall
    where tall = Tall 1 (3 / 100) (1 / 2)
