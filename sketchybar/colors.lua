return {
 -- Catppuccin Frappe Base Colors
 rosewater = 0xfff2d5cf,
 flamingo = 0xffeebebe,
 pink = 0xfff4b8e4,
 mauve = 0xffca9ee6,
 red = 0xffe78284,
 maroon = 0xffea999c,
 peach = 0xffef9f76,
 yellow = 0xffe5c890,
 green = 0xffa6d189,
 teal = 0xff81c8be,
 sky = 0xff99d1db,
 sapphire = 0xff85c1dc,
 blue = 0xff8caaee,
 lavender = 0xffbabbf1,

 -- Frappe Surface Colors
 text = 0xffc6d0f5,
 subtext1 = 0xffb5bfe2,
 subtext0 = 0xffa5adce,
 overlay2 = 0xff949cbb,
 overlay1 = 0xff838ba7,
 overlay0 = 0xff737994,
 surface2 = 0xff626880,
 surface1 = 0xff51576d,
 surface0 = 0xff414559,
 base = 0xff303446,
 mantle = 0xff292c3c,
 crust = 0xff232634,

 -- Compatibility aliases
 black = 0xff232634, -- crust
 white = 0xffc6d0f5, -- text
 grey = 0xff737994,  -- overlay0
 transparent = 0x00000000,

 bar = {
  bg = 0xf0303446,     -- base with transparency
  border = 0xff303446, -- base
 },
 popup = {
  bg = 0xc0303446,     -- base with more transparency
  border = 0xff737994, -- overlay0
 },
 bg1 = 0xff414559,     -- surface0
 bg2 = 0xff51576d,     -- surface1

 with_alpha = function(color, alpha)
  if alpha > 1.0 or alpha < 0.0 then
   return color
  end
  return (color & 0x00ffffff) | (math.floor(alpha * 255.0) << 24)
 end,
}
