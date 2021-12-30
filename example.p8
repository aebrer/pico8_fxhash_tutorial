pico-8 cartridge // http://www.pico-8.com
version 34
__lua__
--fxhash snippet

hash=stat(6) --get string from js
s=1 --init seed
for i=1,#hash do -- for each char in hash
 ch=ord(sub(hash,i,i))s+=s*31+ch
end 
srand(s)

--s=rnd(-1)\1
--s=29699
--s=-12362 
--srand(s)

-- setup starts here
_set_fps(60)
cls()
num_circles = flr(rnd(4)+1)
--print(num_circles)

srand(s)

function pix_dither(x,y,r,c)
	pset(
	x-1+rnd(2),
	y-1+rnd(2),
	c
	)
end

function circ_dither(x,y,r,c)
	circ(
	x-1+rnd(2),
	y-1+rnd(2),
	r,
	c)
end

function sqr_dither(x,y,r,c)
	rect(
	x-r+rnd({-1,1}),
	y-r+rnd({-1,1}),
	x+r+rnd({-1,1}),
	y+r+rnd({-1,1}),
	c)
end

function p8scii_dither(x,y,r,c)
 print(
  "\^p"..chr(rnd(240)\1+16),
  x-1+rnd(2)-5,
	 y-1+rnd(2)-4,
	 c
	)
end

dither = rnd({
 pix_dither,
 circ_dither,
 sqr_dither,
 p8scii_dither
})

d_circ_r = rnd({
 1
})

pal({
 1,-14,-11,13,
 -3,2,-2,-7,
 7,6,12,-4,
 1,-15,0
},1)

dither_loops = rnd(4901)+100

::😐:: -- draw loop start

for i=0,num_circles do
	local r=rnd(16)
	local x=rnd(40)+40
	local y=rnd(40)+40
 circ(x,y,r,rnd({13,14,15}))
end

for i=0,dither_loops do
	local x=rnd(128)
	local y=rnd(128)
	local c=max(pget(x,y)-1,0)
	dither(x,y,d_circ_r,c)
end


if(rnd()>.9)srand(s)

--?s,0,0,7
flip()
goto 😐 -- draw loop end

