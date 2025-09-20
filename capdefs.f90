module convert
    implicit none

    contains

    subroutine shcap ( valcap )
        real, intent(in) :: valcap
        real(8) :: valor_conv
        character(3) :: sufixo

        if (valcap < 1e-9) then
            valor_conv = valcap * 1e12
            sufixo = 'pF'
        else if (valcap < 1e-6) then
            valor_conv = valcap * 1e9
            sufixo = 'nF'
        else if (valcap < 1e-3) then
            valor_conv = valcap * 1e6
            sufixo = 'uF'
        else
            valor_conv = valcap
            sufixo = 'F'
        end if

        write (*,'(A, F7.2,1X,A,A,/)', advance="no") "(", valor_conv, sufixo, ")"

    end subroutine
end module
