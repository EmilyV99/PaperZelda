/*
 * Option setup, appropriate for the general use. Don't modify this!
 * If you need a different option somewhere, you can add a '#option'
 * in that file/function/namespace/script/etc; these are the GLOBAL
 * options that are the DEFAULT in all files! -V
 */
#option SHORT_CIRCUIT on
#option BINARY_32BIT off
#option TRUE_INT_SIZE on
#option TRUNCATE_DIVISION_BY_LITERAL_BUG off
#option BOOL_TRUE_RETURN_DECIMAL off
#option HEADER_GUARD on

#include "std.zh"
#include "PZeldaScripts/Constants.zs"
#include "PZeldaScripts/Global.zs"
#include "PZeldaScripts/Subscreen.zs"
#include "PZeldaScripts/Misc.zs"
#include "PZeldaHeaders/customTango.zh" //Main 'tango.zh' file
#include "PZeldaHeaders/TangoHandler.zh" //Tango handler file, for ease-of-use functions
#include "PZeldaHeaders/LiftPotsV2.0.zs" //Lift and throw objects such as pots/rocks
#include "PZeldaHeaders/IcePhysics_ForceSlide_255.zs" //Pokemon-style ice; slide until you hit a wall, or slide off the ice
#include "PZeldaHeaders/IcePhysics_Slippery_255.zs" //Slippery ice
#include "PZeldaHeaders/VenrobMisc.zh" //Misc stuffs
#include "PZeldaHeaders/FFCShop.zs" //Shop
#include "PZeldaHeaders/bitmap.zh" //Bitmap rental system
