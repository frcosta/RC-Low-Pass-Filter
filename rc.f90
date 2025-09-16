! RC Low Pass Filter Calc
! GNU Fortran (tdm64-1) 10.3.0 on Windows 10
! Fabiano Costa Sep/09/2025
! compile: gfortran rc.f90 getch.o -o rc 

program rc_filter
    use iso_c_binding
    implicit none

    real, parameter :: PI = 3.1415926535
    real :: fc, R, C
    integer :: choice
    integer(c_int) :: k

    interface
        function getch() bind(C, name="getch")
          import :: c_int
          integer(c_int) :: getch
        end function getch
    end interface

    write(*,'(/, A, /)') '=== RC Low Pass Filter Calc ==='
    write(*,'(6X, A)') '1) fc? enter R and C'
    write(*,'(6X, A)') '2) R? enter fc and C'
    write(*,'(6X, A)') '3) C? enter fc and R'
    write(*,'(6X, A)') '4) Quit'
    write(*,'(/, A)', advance="no") 'Select your choice: '
    k = getch()
    
    select case (k)
    case (49)
        write(*,'(2/, A)') 'Use cientific notation for C (e.g. 100E-9 for 100nF)'
        write(*,'(A)', advance="no") 'Enter R(Ohms), C(Farads): '
        read (*,*) R, C
        fc = 1 / (2 * PI * R * C)
        write(*,'(/, A, F8.2, A, /)') 'fc = ', fc, ' Hz'
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
        write(*,'(/, A, E12.4, A, /)') 'C = ', C, ' Farads'
    case (52)
        write(*,'(2/, A, /)') 'Bye'  
    end select

end program rc_filter