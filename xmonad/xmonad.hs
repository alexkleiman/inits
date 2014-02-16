import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run
import XMonad.Util.EZConfig
import qualified XMonad.StackSet as W
import XMonad.Hooks.ManageHelpers
import System.IO
import Data.Maybe
import XMonad.Actions.WithAll

myWorkspaces = ["Internet", "Scholarly Internet", "Code", "Writing", "Readings", "Utils", "VMs", "devil spawn", "minimize"]


myManageHook = composeAll . concat $
    [ 
      [ className =? "Tkzgram" --> doF W.focusDown
      , className =? "Tkzgram" --> doFloat
      , className =? "XTerm" --> doF W.focusDown
      ]
      , [ className =? util  --> doShift "Utils" | util <- utilClass ]
      , [ className =? devilSpawn --> doShift "devil spawn" | devilSpawn <- devilClass ]
      , [ className =? vm --> doFloat | vm <- vmClass ]
    ]
    where
        webClass = ["Firefox", "Iceweasel", "Google-chrome"]
        readClass = ["Okular", "Xpdf", "Evince"]
        writerClass = ["Kile", "Kate"]
        codeClass = ["Eclipse", "QtCreator"]
        devilClass = ["XTerm"]
        utilClass = ["Workrave"]
        vmClass = ["qemu-system-i386"]
      

main = do 
    xmproc <- spawnPipe "xmobar"
    spawn "eval $(cat ~/.fehbg)"
    spawn "workrave"
    xmonad $ defaultConfig
      { manageHook = manageDocks <+> myManageHook
                   <+> manageHook defaultConfig
        , layoutHook = avoidStruts $ layoutHook defaultConfig
        , logHook = dynamicLogWithPP xmobarPP
                    { ppOutput = hPutStrLn xmproc
                      , ppTitle = xmobarColor "green" "" . shorten 50
                    }
--        , modMask = mod3Mask --change to whatever you want
        , terminal = "konsole" --use konsole for terminal
        , workspaces = myWorkspaces
      } `additionalKeys`
      [ ((mod1Mask .|. shiftMask, xK_l), spawn "xlock")
        , ((mod1Mask .|. shiftMask, xK_g), spawn "/contrib/bin/google-chrome")
--        , ((mod4Mask .|. shiftMask .|. mod1Mask, xK_c), W.filter(\x -> isJust(W.peek) && fromJust(W.peek) == x))
--        ,  ((mod3Mask .|. shiftMask, xK_x), killAll)
      ]
