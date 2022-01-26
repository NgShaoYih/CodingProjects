function z = find_eq (T ,a , z )
 % find_eq .m - find equilibrium position along z axis
 %
 % Usage :
 % z = find_eq (T ,a );
 % z = find_eq (T ,a , initial_guess );
 % where T = T - matrix , a = field vector .

 newton = true ;

 z_precision = 1e-4;
 short_distance = 1e-5;
 zpoints = 45;

 if nargin < 3
 z = 0;
 end

 z_old = z + 10* z_precision ;

 if newton

 % Newton ’s method
 while abs (z - z_old ) > z_precision

 a2 = translate_z (a , z );
 a3 = translate_z ( a2 , short_distance );

 p = T * a2 ;
 f1 = force_z ( a2 , p );

 p = T * a3 ;
 f2 = force_z ( a3 , p );


 dz = short_distance * f1 /( f1 - f2 );

 z_old = z ;

 z = z + dz ;

 end

 else % end of if newton

 % Bisection method

 % Need initial guess

 % Guess the radius
 size_T = size ( T );
 radius = size_T (1)/(2* pi );

 z = linspace ( - radius ,3* radius , zpoints );

 fz = zeros ( size ( z ));

 for nz = 1: zpoints

 a2 = translate_z (a , z ( nz ));

 p = T * a2 ;
 fz ( nz ) = force_z ( a2 , p );

 if fz ( nz ) < 0
 z1 = z ( nz -1);
 z2 = z ( nz );
 f1 = fz ( nz -1);
 f2 = fz ( nz );
 break
 end

 end

 if f1 == 0
 z = z1 ;
 return
 end

 if nz == zpoints
 error ( "Starting points for bisection not found" );
 end

 % Now the actual bisection search

 while z2 - z1 > z_precision


 z3 = ( z1 + z2 )/2;

 a2 = translate_z (a , z3 );

 p = T * a2 ;
 f3 = force_z ( a2 , p );

 if f3 == 0
 z = z3 ;
 break
 end
 if f1 * f3 < 0
 z1 = z3 ;
 f1 = f3 ;
 else
 z2 = z3 ;
 f2 = f3 ;
 end

 end

 z = z3 ;

 end % end of if bisection ( ie not newton )

 return