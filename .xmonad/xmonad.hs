import XMonad
import XMonad.Util.EZConfig
import XMonad.Util.Ungrab
import XMonad.Util.Run
import XMonad.Layout.Spacing
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageHelpers
import XMonad.Layout.NoBorders
myWorkspaces = ["dev", "www", "sys", "chat", "misc", "doc", "mus", "vid", "gfx"]

myLayout = smartBorders . avoidStruts $ spacing 8 $ Tall 1 (3/100) (1/2) ||| Full
  where
    tiled    = Tall nmaster delta ratio
    nmaster  = 1      -- Default number of windows in the master pane
    ratio    = 1/2    -- Default proportion of screen occupied by master pane
    delta    = 3/100  -- Percent of screen to increment by when resizing panes
main :: IO ()
main = do 
xmproc <- spawnPipe "xmobar"
xmonad $ docks def
    { modMask = mod4Mask  -- Rebind Mod to the Super key
    , terminal = "kitty"
	, handleEventHook = fullscreenEventHook
	, focusedBorderColor = "#F8F8F2"
	, normalBorderColor = "#282A36"
	, borderWidth = 1
	, layoutHook = myLayout
	, workspaces = myWorkspaces
	, manageHook = manageDocks <+> (isFullscreen --> doFullFloat) <+> manageHook defaultConfig
	, logHook = dynamicLogWithPP $ xmobarPP { ppOutput = hPutStrLn xmproc
	, ppCurrent = xmobarColor "#f1fa8c" ""
	, ppHiddenNoWindows = xmobarColor "#bd93f9" ""
	, ppTitle = xmobarColor "#8be9fd" ""
	, ppLayout = xmobarColor "#50fa7b" ""
	, ppHidden = xmobarColor "#ff79c6" ""}
    }
  `additionalKeysP`
    [ ("M-]"  , spawn "brave-browser"                   )
	, ("M-e"  , spawn "pcmanfm"					  )
	, ("M-["  , spawn "scrot '%Y-%m-%d_%h%M%S-$wx$h.png'")
	, ("M-S-<Return>"  , spawn "rofi -show run")
	, ("M-<Return>"	, spawn "kitty")
	, ("M-f" , spawn ("kitty -e ranger"))
	, ("M-b" , spawn "killall xmobar")
     ]
