---
title: fft
---

{== Discrete Fourier transform of tseries object ==}


## Syntax 

    [y, range, freq, per] = fft(x)
    [y, range, freq, per] = fft(x, range, ...)


## Input arguments 

__`x`__ [ tseries ]
> 
> Input tseries object that will be transformed.
> 

__`range`__ [ numeric | Inf ] 
> 
> Date range.
> 

## Output arguments 


__`y`__ [ numeric ]
> 
> Fourier transform with data organised in columns.
> 

__`range`__ [ numeric ] 
> 
> Actually used date range.
> 

__`freq`__ [ numeric ] 
> 
> Frequencies corresponding to FFT vector elements.
> 

__`per`__ [ numeric ] 
> 
> Periodicities corresponding to FFT vector elements.
> 

## Options 

__`'full='`__ [ `true` | *`false`* ]
> 
> Return Fourier transform on the whole
> interval [0, 2*pi]; if false only the interval [0, pi] is returned.
> 


## Description 



## Examples

```matlab
```

