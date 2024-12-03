a = list(map(lambda x : list(int(y) for y in x.split()), open("input", "r").readlines()))
b = list(map(lambda x : (sorted(x) if (sorted(x) == x or list(reversed(sorted(x))) == x) else [0, 4]), a))
c = list(map(lambda x : list(x[n] - x[n-1] for n in range(1, len(x))), b))
print(sum(list(map(lambda x : (1 if all((i > 0 and i < 4) for i in x) else 0), c))))

