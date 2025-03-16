program main
    use libcalc, only: bissection, SUCCESS, FAILURE
    implicit none
 
    real :: a, b, tol, out
    integer :: status
 
    a = 0.
    b = 5.0
    tol = 1.0e-6
 
    status = bissection(func, a, b, tol, 100, out)
 
    if (status == SUCCESS) then
       print *, 'Raiz = ', out
    else
       print *, 'Nao foi possivel encontrar a raiz'
    end if
 
 contains
    real function func(x) result(y)
       implicit none
       real, intent(in) :: x
       y = x**2 - 2
    end function func
 end program main
 