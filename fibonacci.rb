#fibonacci sequence with iteration
def fibs(n)
  f = []
  n.times do |num|
    if num <= 1
      f << num
    else
      f << (f[-1] + f[-2])
    end
  end
  return f[-1] + f[-2]
end

#fibaonacci sequence with recursion
def fibs_rec(n)
  return n if n <= 1
  return fibs_rec(n-2) + fibs_rec(n-1)
end

#fibs(10) => 55
#fibs_rec(10) => 55
