using Images
function interacao_mandelbrot(cx, cy; max_inter = 60)
  x = 0
  y = 0
  for inter = 0:60
      p = x
      q = y
      x = p ^ 2 - q ^ 2 + cx
      y = 2p*q + cy
  end
  if x ^ 2 + y ^ 2  <  4
    return false, 0
  else
    return true, 1
  end
end

function mandelbrot(N)
  x =  intervalo( - 2,5 , 1,5 , length=N)
  y =  intervalo( - 2,0 , 2,0 , length=N)

  imagem = zeros(N, N)
  for i = 1 : N
    for j = 1 : N
      explodiu, ρ = interacao_mandelbrot(x[i], y[j])
      if explodiu
        imagem[i, j] = ρ
      end
    end
  end

  save("mandelbrot.jpg", imagem)
end

mandelbrot(2000)
