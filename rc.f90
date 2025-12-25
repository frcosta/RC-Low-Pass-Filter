! RC Low Pass Filter Calc
! GNU Fortran (tdm64-1) 13.3.0 on Linux
! Fabiano Costa Sep/16/2025

program rc_filter
    use convert
    use iso_c_binding
    implicit none
    integer, parameter :: dp=selected_real_kind(18,12)

    real(kind=dp), parameter :: PI = 4*atan(1.0_dp)
    real(kind=dp) :: fc, R, C
    integer(c_int) :: k

    interface
        function getch() bind(C, name="getch")
          import :: c_int
          integer(c_int) :: getch
        end function getch
    end interface

    write(*,'(/, A, /)') '=== RC Low Pass Filter Calc ==='
    write(*,'(3X, A)') '1) Calc FC (enter R and C)'
    write(*,'(3X, A)') '2) Calc R  (enter FC and C)'
    write(*,'(3X, A)') '3) Calc C  (enter FC and R)'
    write(*,'(3X, A, /)') '4) Quit'
    write(*,'(A)')   '==============================='
    write(*,'(A)', advance="no") 'Select your choice: '
    k = getch()
    
    select case (k)
    case (49)
        write(*,'(2/, A)') 'Use cientific notation for C (e.g. 100E-9 for 100nF)'
        write(*,'(A)', advance="no") 'Enter R(Ohms), C(Farads): '
        read (*,*) R, C
        fc = 1 / (2 * PI * R * C)
        write(*,'(/, A, F12.2, A, /)') 'fc = ', fc, ' Hz'
    case (50)
        write(*,'(2/, A)') 'Use cientific notation for C (e.g. 100E-9 for 100nF)'
        write(*,'(A)', advance="no") 'Enter fc(Hz), C(Farads): '
        read (*,*) fc, C
        R = 1 / (2 * PI * fc * C)
        write(*,'(/, A, F9.2, A, /)') 'R = ', R, ' Ohms'
    case (51)
        write(*,'(2/, A)', advance="no") 'Enter fc(Hz), R(Ohms): '
        read (*,*) fc, R
        C = 1 / (2 * PI * fc * R)
        write(*,'(/, A, E12.4, A)', advance="no" ) 'C = ', C, " "
        call shcap (C)
    case (52)
        write(*,'(2/, A, /)') 'Bye'
    end select

end program rc_filter
