module libcalc
    use iso_c_binding, only: c_float, c_int
    implicit none
    integer(c_int) :: i
    integer(c_int), parameter :: SUCCESS = 0, FAILURE = 1
 contains
    !> Função que realiza o método da bisseção
    !!
    !! @param func Função externa usada no cálculo
    !! @param a, b Intervalo inicial
    !! @param tol Tolerância do método
    !! @param max_iter Número máximo de iterações
    !! @param out Variável para armazenar a raiz
    !!
    !! @return status Status da execução
    function bissection(func, a, b, tol, max_iter, out) result(status)
       implicit none
       real(c_float), external :: func
       real(c_float), intent(inout) :: a, b, tol
       integer(c_int), intent(in) :: max_iter
       real(c_float) :: out
       real(c_float) :: xo, fa, fxo
       integer(c_int) :: status
 
       print *, '[BISECTION METHOD]'
 
       i = 1
       fa = func(a)
       do while (i <= max_iter)
          xo = a + (b - a)/2
          fxo = func(xo)
 
          print *, 'i = ', i, ' a = ', a, ' b = ', b, ' xo = ', xo, ' f(xo) = ', fxo
 
          ! convergiu
          if (fxo == 0 .or. (b - a)/2 < tol) then
             status = SUCCESS
             out = xo
             return
          end if
 
          ! continua o processo
          i = i + 1
          if (fa*fxo > 0) then
             a = xo
             fa = fxo
          else
             b = xo
          end if
       end do
       status = FAILURE
    end function bissection
 end module libcalc
 