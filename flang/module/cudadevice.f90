!===-- module/cudedevice.f90 -----------------------------------------------===!
!
! Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
! See https://llvm.org/LICENSE.txt for license information.
! SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
!
!===------------------------------------------------------------------------===!

! CUDA Fortran procedures available in device subprogram

module cudadevice
  use __cuda_device
  use, intrinsic :: __fortran_builtins, only: dim3 => __builtin_dim3
  use, intrinsic :: __fortran_builtins, only: c_devptr => __builtin_c_devptr
  use, intrinsic :: __fortran_builtins, only: c_devloc => __builtin_c_devloc
implicit none

  ! Synchronization Functions

  interface
    attributes(device) subroutine syncthreads()
    end subroutine
  end interface

  interface
    attributes(device) integer function syncthreads_and(value)
      integer, value :: value
    end function
  end interface

  interface
    attributes(device) integer function syncthreads_count(value)
      integer, value :: value
    end function
  end interface

  interface
    attributes(device) integer function syncthreads_or(value)
      integer, value :: value
    end function
  end interface

  interface
    attributes(device) subroutine syncwarp(mask)
      integer, value :: mask
    end subroutine
  end interface

  ! Memory Fences

  interface
    attributes(device) subroutine threadfence()
    end subroutine
  end interface

  interface
    attributes(device) subroutine threadfence_block()
    end subroutine
  end interface

  interface
    attributes(device) subroutine threadfence_system()
    end subroutine
  end interface

  ! Math API

  interface __fadd_rn
   attributes(device) real function __fadd_rn(a,b) bind(c, name='__nv_fadd_rn')
  !dir$ ignore_tkr (d) a, (d) b
    real, value :: a, b
   end function
  end interface
  
  interface __fadd_rz
   attributes(device) real function __fadd_rz(a,b) bind(c, name='__nv_fadd_rz')
  !dir$ ignore_tkr (d) a, (d) b
    real, value :: a, b
   end function
  end interface

  interface
    attributes(device) function __fadd_rd(x, y) bind(c, name='__nv_fadd_rd')
      real, intent(in), value :: x, y
      real :: __fadd_rd
    end function
  end interface

  interface
    attributes(device) function __fadd_ru(x, y) bind(c, name='__nv_fadd_ru')
      real, intent(in), value :: x, y
      real :: __fadd_ru
    end function
  end interface

  interface __fmul_rn
   attributes(device) real function __fmul_rn(a,b) bind(c, name='__nv_fmul_rn')
  !dir$ ignore_tkr (d) a, (d) b
    real, value :: a, b
   end function
  end interface

  interface __fmul_rz
   attributes(device) real function __fmul_rz(a,b) bind(c, name='__nv_fmul_rz')
  !dir$ ignore_tkr (d) a, (d) b
    real, value :: a, b
   end function
  end interface

  interface __fmul_ru
   attributes(device) real function __fmul_ru(a,b) bind(c, name='__nv_fmul_ru')
  !dir$ ignore_tkr (d) a, (d) b
    real, value :: a, b
   end function
  end interface

  interface __fmul_rd
   attributes(device) real function __fmul_rd(a,b) bind(c, name='__nv_fmul_rd')
  !dir$ ignore_tkr (d) a, (d) b
    real, value :: a, b
   end function
  end interface

  interface __fmaf_rn
   attributes(device) real function __fmaf_rn(a,b,c) bind(c, name='__nv_fmaf_rn')
  !dir$ ignore_tkr (d) a, (d) b, (d) c
    real, value :: a, b, c
   end function
  end interface

  interface __fmaf_rz
   attributes(device) real function __fmaf_rz(a,b,c) bind(c, name='__nv_fmaf_rz')
  !dir$ ignore_tkr (d) a, (d) b, (d) c
    real, value :: a, b, c
   end function
  end interface
  
  interface __fmaf_ru
   attributes(device) real function __fmaf_ru(a,b,c) bind(c, name='__nv_fmaf_ru')
  !dir$ ignore_tkr (d) a, (d) b, (d) c
    real, value :: a, b, c
   end function
  end interface
  
  interface __fmaf_rd
   attributes(device) real function __fmaf_rd(a,b,c) bind(c, name='__nv_fmaf_rd')
  !dir$ ignore_tkr (d) a, (d) b, (d) c
    real, value :: a, b, c
   end function
  end interface

  interface __frcp_rn
   attributes(device) real function __frcp_rn(a) bind(c, name='__nv_frcp_rn')
  !dir$ ignore_tkr (d) a
    real, value :: a
   end function
  end interface

  interface __frcp_rz
   attributes(device) real function __frcp_rz(a) bind(c, name='__nv_frcp_rz')
  !dir$ ignore_tkr (d) a
    real, value :: a
   end function
  end interface

  interface __frcp_ru
   attributes(device) real function __frcp_ru(a) bind(c, name='__nv_frcp_ru')
  !dir$ ignore_tkr (d) a
    real, value :: a
   end function
  end interface

  interface __frcp_rd
   attributes(device) real function __frcp_rd(a) bind(c, name='__nv_frcp_rd')
  !dir$ ignore_tkr (d) a
    real, value :: a
   end function
  end interface

  interface __fsqrt_rn
   attributes(device) real function __fsqrt_rn(a) bind(c, name='__nv_fsqrt_rn')
  !dir$ ignore_tkr (d) a
    real, value :: a
   end function
  end interface

  interface __fsqrt_rz
   attributes(device) real function __fsqrt_rz(a) bind(c, name='__nv_fsqrt_rz')
  !dir$ ignore_tkr (d) a
    real, value :: a
   end function
  end interface

  interface __fsqrt_ru
   attributes(device) real function __fsqrt_ru(a) bind(c, name='__nv_fsqrt_ru')
  !dir$ ignore_tkr (d) a
    real, value :: a
   end function
  end interface

  interface __fsqrt_rd
   attributes(device) real function __fsqrt_rd(a) bind(c, name='__nv_fsqrt_rd')
  !dir$ ignore_tkr (d) a
    real, value :: a
   end function
  end interface

  interface __fdiv_rn
   attributes(device) real function __fdiv_rn(a,b) bind(c, name='__nv_fdiv_rn')
  !dir$ ignore_tkr (d) a, (d) b
    real, value :: a, b
   end function
  end interface

  interface __fdiv_rz
   attributes(device) real function __fdiv_rz(a,b) bind(c, name='__nv_fdiv_rz')
  !dir$ ignore_tkr (d) a, (d) b
    real, value :: a, b
   end function
  end interface

  interface __fdiv_ru
   attributes(device) real function __fdiv_ru(a,b) bind(c, name='__nv_fdiv_ru')
  !dir$ ignore_tkr (d) a, (d) b
    real, value :: a, b
   end function
  end interface

  interface __fdiv_rd
   attributes(device) real function __fdiv_rd(a,b) bind(c, name='__nv_fdiv_rd')
  !dir$ ignore_tkr (d) a, (d) b
    real, value :: a, b
   end function
  end interface

  interface __dadd_rn
   attributes(device) real(8) function __dadd_rn(a,b) bind(c, name='__nv_dadd_rn')
  !dir$ ignore_tkr (d) a, (d) b
    real(8), value :: a, b
   end function
  end interface

  interface __dadd_rz
   attributes(device) real(8) function __dadd_rz(a,b) bind(c, name='__nv_dadd_rz')
  !dir$ ignore_tkr (d) a, (d) b
    real(8), value :: a, b
   end function
  end interface

  interface __dadd_ru
   attributes(device) real(8) function __dadd_ru(a,b) bind(c, name='__nv_dadd_ru')
  !dir$ ignore_tkr (d) a, (d) b
    real(8), value :: a, b
   end function
  end interface

  interface __dadd_rd
   attributes(device) real(8) function __dadd_rd(a,b) bind(c, name='__nv_dadd_rd')
  !dir$ ignore_tkr (d) a, (d) b
    real(8), value :: a, b
   end function
  end interface

  interface __dmul_rn
   attributes(device) real(8) function __dmul_rn(a,b) bind(c, name='__nv_dmul_rn')
  !dir$ ignore_tkr (d) a, (d) b
    real(8), value :: a, b
   end function
  end interface

  interface __dmul_rz
   attributes(device) real(8) function __dmul_rz(a,b) bind(c, name='__nv_dmul_rz')
  !dir$ ignore_tkr (d) a, (d) b
    real(8), value :: a, b
   end function
  end interface

  interface __dmul_ru
   attributes(device) real(8) function __dmul_ru(a,b) bind(c, name='__nv_dmul_ru')
  !dir$ ignore_tkr (d) a, (d) b
    real(8), value :: a, b
   end function
  end interface

  interface __dmul_rd
   attributes(device) real(8) function __dmul_rd(a,b) bind(c, name='__nv_dmul_rd')
  !dir$ ignore_tkr (d) a, (d) b
    real(8), value :: a, b
   end function
  end interface

  interface __fma_rn
   attributes(device) real(8) function __fma_rn(a,b,c) bind(c, name='__nv_fma_rn')
  !dir$ ignore_tkr (d) a, (d) b
    real(8), value :: a, b, c
   end function
  end interface

  interface __fma_rz
   attributes(device) real(8) function __fma_rz(a,b,c) bind(c, name='__nv_fma_rz')
  !dir$ ignore_tkr (d) a, (d) b
    real(8), value :: a, b, c
   end function
  end interface

  interface __fma_ru
   attributes(device) real(8) function __fma_ru(a,b,c) bind(c, name='__nv_fma_ru')
  !dir$ ignore_tkr (d) a, (d) b
    real(8), value :: a, b, c
   end function
  end interface

  interface __fma_rd
   attributes(device) real(8) function __fma_rd(a,b,c) bind(c, name='__nv_fma_rd')
  !dir$ ignore_tkr (d) a, (d) b
    real(8), value :: a, b, c
   end function
  end interface

  interface rsqrt
    attributes(device) real(4) function rsqrtf(x) bind(c,name='__nv_rsqrtf')
      real(4), value :: x
    end function
    attributes(device) real(8) function rsqrt(x) bind(c,name='__nv_rsqrt')
      real(8), value :: x
    end function
  end interface
  
  interface signbit
    attributes(device) integer(4) function signbitf(x) bind(c,name='__nv_signbitf')
      real(4), value :: x
    end function
    attributes(device) integer(4) function signbit(x) bind(c,name='__nv_signbitd')
      real(8), value :: x
    end function
  end interface

  interface
    attributes(device) subroutine sincosf(x, y, z) bind(c,name='__nv_sincosf')
      real(4), value :: x
      real(4), device :: y
      real(4), device :: z
    end subroutine
  end interface
  interface
    attributes(device) subroutine sincos(x, y, z) bind(c,name='__nv_sincos')
      real(8), value :: x
      real(8), device :: y
      real(8), device :: z
    end subroutine
  end interface
  interface sincos
    procedure :: sincosf
    procedure :: sincos
  end interface

  interface
    attributes(device) subroutine sincospif(x, y, z) bind(c,name='__nv_sincospif')
      real(4), value :: x
      real(4), device :: y
      real(4), device :: z
    end subroutine
  end interface
  interface
    attributes(device) subroutine sincospi(x, y, z) bind(c,name='__nv_sincospi')
      real(8), value :: x
      real(8), device :: y
      real(8), device :: z
    end subroutine
  end interface
  interface sincospi
    procedure :: sincospif
    procedure :: sincospi
  end interface

  interface
    attributes(device) real(4) function cospif(x) bind(c,name='__nv_cospif')
      real(4), value :: x
    end function
  end interface
  interface
    attributes(device) real(8) function cospi(x) bind(c,name='__nv_cospi')
      real(8), value :: x
    end function
  end interface
  interface cospi
    procedure :: cospif
    procedure :: cospi
  end interface

  interface  
    attributes(device) real(4) function sinpif(x) bind(c,name='__nv_sinpif')
      real(4), value :: x
    end function
  end interface
  interface
    attributes(device) real(8) function sinpi(x) bind(c,name='__nv_sinpi')
      real(8), value :: x
    end function
  end interface
  interface sinpi
    procedure :: sinpif
    procedure :: sinpi
  end interface
  
  interface mulhi
   attributes(device) integer function __mulhi(i,j) bind(c,name='__nv_mulhi')
  !dir$ ignore_tkr (d) i, (d) j
    integer, value :: i,j
   end function
  end interface

  interface umulhi
   attributes(device) integer function __umulhi(i,j) bind(c,name='__nv_umulhi')
  !dir$ ignore_tkr (d) i, (d) j
    integer, value :: i,j
   end function
  end interface
  
  interface mul64hi
   attributes(device) integer(8) function __mul64hi(i,j) bind(c,name='__nv_mul64hi')
  !dir$ ignore_tkr (d) i, (d) j
    integer(8), value :: i,j
   end function
  end interface
  
  interface umul64hi
   attributes(device) integer(8) function __umul64hi(i,j) bind(c,name='__nv_umul64hi')
  !dir$ ignore_tkr (d) i, (d) j
    integer(8), value :: i,j
   end function
  end interface

  ! Atomic Operations

  interface atomicadd
    attributes(device) pure integer function atomicaddi(address, val)
  !dir$ ignore_tkr (d) address, (d) val
    integer, intent(inout) :: address
    integer, value :: val
    end function
    attributes(device) pure real function atomicaddf(address, val)
  !dir$ ignore_tkr (d) address, (d) val
    real, intent(inout) :: address
    real, value :: val
    end function
    attributes(device) pure real(8) function atomicaddd(address, val)
  !dir$ ignore_tkr (d) address, (d) val
    real(8), intent(inout) :: address
    real(8), value :: val
    end function
    attributes(device) pure integer(8) function atomicaddl(address, val)
  !dir$ ignore_tkr (d) address, (d) val
    integer(8), intent(inout) :: address
    integer(8), value :: val
    end function
  end interface

  interface atomicsub
    attributes(device) pure integer function atomicsubi(address, val)
  !dir$ ignore_tkr (d) address, (d) val
    integer, intent(inout) :: address
    integer, value :: val
    end function
    attributes(device) pure real function atomicsubf(address, val)
  !dir$ ignore_tkr (d) address, (d) val
    real, intent(inout) :: address
    real, value :: val
    end function
    attributes(device) pure real(8) function atomicsubd(address, val)
  !dir$ ignore_tkr (d) address, (d) val
    real(8), intent(inout) :: address
    real(8), value :: val
    end function
    attributes(device) pure integer(8) function atomicsubl(address, val)
  !dir$ ignore_tkr (d) address, (dk) val
    integer(8), intent(inout) :: address
    integer(8), value :: val
    end function
  end interface
  
  interface atomicmax
    attributes(device) pure integer function atomicmaxi(address, val)
  !dir$ ignore_tkr (d) address, (d) val
    integer, intent(inout) :: address
    integer, value :: val
    end function
    attributes(device) pure real function atomicmaxf(address, val)
  !dir$ ignore_tkr (d) address, (d) val
    real, intent(inout) :: address
    real, value :: val
    end function
    attributes(device) pure real(8) function atomicmaxd(address, val)
  !dir$ ignore_tkr (d) address, (d) val
    real(8), intent(inout) :: address
    real(8), value :: val
    end function
    attributes(device) pure integer(8) function atomicmaxl(address, val)
  !dir$ ignore_tkr (d) address, (dk) val
    integer(8), intent(inout) :: address
    integer(8), value :: val
    end function
  end interface
  
  interface atomicmin
    attributes(device) pure integer function atomicmini(address, val)
  !dir$ ignore_tkr (d) address, (d) val
    integer, intent(inout) :: address
    integer, value :: val
    end function
    attributes(device) pure real function atomicminf(address, val)
  !dir$ ignore_tkr (d) address, (d) val
    real, intent(inout) :: address
    real, value :: val
    end function
    attributes(device) pure real(8) function atomicmind(address, val)
  !dir$ ignore_tkr (d) address, (d) val
    real(8), intent(inout) :: address
    real(8), value :: val
    end function
    attributes(device) pure integer(8) function atomicminl(address, val)
  !dir$ ignore_tkr (d) address, (dk) val
    integer(8), intent(inout) :: address
    integer(8), value :: val
    end function
  end interface
  
  interface atomicand
    attributes(device) pure integer function atomicandi(address, val)
  !dir$ ignore_tkr (d) address, (d) val
    integer, intent(inout) :: address
    integer, value :: val
    end function
  end interface
  
  interface atomicor
    attributes(device) pure integer function atomicori(address, val)
  !dir$ ignore_tkr (d) address, (d) val
    integer, intent(inout) :: address
    integer, value :: val
    end function
  end interface

  interface atomicinc
    attributes(device) pure integer function atomicinci(address, val)
  !dir$ ignore_tkr (d) address, (d) val
    integer, intent(inout) :: address
    integer, value :: val
    end function
  end interface
  
  interface atomicdec
    attributes(device) pure integer function atomicdeci(address, val)
  !dir$ ignore_tkr (d) address, (d) val
    integer, intent(inout) :: address
    integer, value :: val
    end function
  end interface

  interface
    attributes(device) integer(8) function clock64()
    end function
  end interface

interface match_all_sync
  attributes(device) integer function match_all_syncjj(mask, val, pred)
!dir$ ignore_tkr(d) mask, (d) val, (d) pred
  integer(4), value :: mask
  integer(4), value :: val
  integer(4)        :: pred
  end function
  attributes(device) integer function match_all_syncjx(mask, val, pred)
!dir$ ignore_tkr(d) mask, (d) val, (d) pred
  integer(4), value :: mask
  integer(8), value :: val
  integer(4)        :: pred
  end function
  attributes(device) integer function match_all_syncjf(mask, val, pred)
!dir$ ignore_tkr(d) mask, (d) val, (d) pred
  integer(4), value :: mask
  real(4), value    :: val
  integer(4)        :: pred
  end function
  attributes(device) integer function match_all_syncjd(mask, val, pred)
!dir$ ignore_tkr(d) mask, (d) val, (d) pred
  integer(4), value :: mask
  real(8), value    :: val
  integer(4)        :: pred
  end function
end interface

interface match_any_sync
  attributes(device) integer function match_any_syncjj(mask, val)
!dir$ ignore_tkr(d) mask, (d) val
  integer(4), value :: mask
  integer(4), value :: val
  end function
  attributes(device) integer function match_any_syncjx(mask, val)
!dir$ ignore_tkr(d) mask, (d) val
  integer(4), value :: mask
  integer(8), value :: val
  end function
  attributes(device) integer function match_any_syncjf(mask, val)
!dir$ ignore_tkr(d) mask, (d) val
  integer(4), value :: mask
  real(4), value    :: val
  end function
  attributes(device) integer function match_any_syncjd(mask, val)
!dir$ ignore_tkr(d) mask, (d) val
  integer(4), value :: mask
  real(8), value    :: val
  end function
end interface

end module
