TITLE 'Treball2_deTomas_MBA' { the problem identification }

COORDINATES cartesian2 
VARIABLES 
 Ca { Concentració ppm }
SELECT { method controls }
painted on
DEFINITIONS 
Da=5e-5
L=6
H=2.75
t0= 0
tf=35000 {run for a, mute for b, c}
!tf=11000 {run for b, mute for a, c}
!v=vector(0,0) {run for a, mute for b,c}
!v=vector(0,0.002){run for b, mute for a,c}
v=vector(0.002,0) {run for c, mute for b,c}

INITIAL VALUES
Ca=0
EQUATIONS { PDE's, one for each variable }
dt(Ca)+div(Ca*v)=Da*div(grad(Ca)) 


! CONSTRAINTS 
BOUNDARIES 

 REGION 1 
 
 
 START(0,0) 								natural(Ca)=0 
 LINE TO (2.95,0) 					natural(Ca)=0 
 LINE TO (2.95,0.10) 				natural(Ca)=0 value(Ca)=100
 LINE TO (3.05,0.10) 				natural(Ca)=0 
 LINE TO (3.05,0) 					natural(Ca)=0 
 LINE TO (L,0) 							natural(Ca)=0 
 LINE TO (L,H) 						natural(Ca)=0 
 LINE TO (0,H) 							natural(Ca)=0 
 					LINE TO CLOSE
 
 
 TIME FROM t0 TO tf 


MONITORS 
for t=t0 by tf/50 to tf {show progress}
elevation(Ca) from (0,H/2) to (L,H/2)


PLOTS 
for t=t0 by tf/50 to tf
CONTOUR(Ca) as "."

HISTORY(Ca) at (4,1.5) as "evolució de la concentració al punt"
END
