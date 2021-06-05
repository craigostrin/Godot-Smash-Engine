# Godot-Smash-Engine
Open Source SSB Engine
This was forked from ValorZard's fork of NyxTheShield's project. ValorZard updated the original 2018 project to Godot 3.2.4. I mostly forked this to try to learn how to code Smash-esque movement in Godot, but maybe I'll take a crack at moving this baby another mile down the road for the next poor soul.

Things that work:
Dashing,
Crouching,
Landing *Jump,
Double Jump,
Directional Air Dodge,
Ledges,
Stage Collision and Platforms.

Advances Techniques:

Melee Wavedash,
Melee Perfect Wavedash,
Perfect Ledge Dash,
RoA Platform Drops (Drop while Running),
RoA Wavedash (Air Dodge on Jump Squat),
Pivot Ledgedrop,

Things still left to do:

Make attacks do damage
  - add knockback
  - add hitstun
  - add armor
  - add i-frames

Reorganize state stuff so that its not just a bunch of constants, while still making the state machine easily modable and generic.
  - current plan is to maybe put all of the states into a giant dictionary, or just use a mutable enum. /shrug'

Add Rollback (Godot GGPO)
  - I want to use this repo https://github.com/FlutterTal/godot_ggpo
  - That project is still being worked on, but if we can get that working in Godot, I'd like to port this project into GGPO
  - If that doesn't work, then we'll have to mess around with using WebRTC and building an original version of rollback
  - That would also require porting this project to the web.
  
Switch from hardcorded animation player to Godot's built in AnimationPlayer
  - This should make editing animations for hitboxes and sprites much MUCH easier
  
